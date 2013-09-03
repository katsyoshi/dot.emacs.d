;;; carbon-emacs-package.el --- tools for the Carbon Emacs Package

;; Copyright (C) 2004-2010  Seiji Zenitani

;; Author: Seiji Zenitani <zenitani@mac.com>
;; $Id: carbon-emacs-package.el 699 2009-12-21 04:51:03Z zenitani $

;; URL(en): http://homepage.mac.com/zenitani/emacs-e.html
;; URL(jp): http://homepage.mac.com/zenitani/emacs-j.html

;; This file is distributed under the term of the GNU General
;; Public License version 3 or later.


;;; Code:

(require 'easymenu)


;;;###autoload
(defconst carbon-emacs-package-version
  "Winter, 2010; Carbon Emacs Package by S. Zenitani et al."
;;   (eval-when-compile (format-time-string "%B, %Y"))
  "Version information of Carbon Emacs Package.")


;; utility functions

;;;###autoload
(defun carbon-emacs-package-add-to-path (arg)
  "Add the each element of ARG to the PATH environment variable
and to the value of `exec-path'.

For example:
\(carbon-emacs-package-add-to-path '(\"/usr/local/bin\" \"/usr/X11R6/bin\"))
\(carbon-emacs-package-add-to-path \"/usr/local/bin:/usr/X11R6/bin\")"
  (when (stringp arg)
    (setq arg (split-string arg ":"))
    (message "PATH=%s" (getenv "PATH"))
    )
  (when (listp arg)
    (dolist (path (prune-directory-list arg))
      (carbon-emacs-package-add-to-env "PATH" path)
      (add-to-list 'exec-path path t)
      )
    (message "PATH=%s" (getenv "PATH"))
    )
  )

(defun carbon-emacs-package-add-to-env (key value)
  "Document forthcoming..."
  (let ((env (getenv key)))
    (if (and env (not (equal env "")))
        (if (not (member value (split-string env ":")))
            (setenv key (concat env ":" value)))
      (setenv key value) )
    ))

;; ;;;###autoload
;; (defun carbon-emacs-package-tmpdir ()
;;   "Return a temporary directory for Emacs.
;; If the directory does not exist, create it."
;;   (let((tmpdir (shell-command-to-string
;;                 "/bin/bash -c 'echo -n /tmp/$UID/TemporaryItems/Emacs'")))
;;     (make-directory tmpdir t)
;;     ;; security: chmod 700 /tmp/$(UID)
;;     (set-file-modes (expand-file-name "../../" tmpdir) ?\700)
;;     tmpdir
;;     ))


;; variables

(defvar carbon-emacs-package-osaka-lite-enabled nil)
(defvar carbon-emacs-package-unix-path-fixed nil)
;;;###autoload
(defvar carbon-emacs-package-netinstall-on nil
  "Return t if the user can use the netinstaller.
When (1) Developer Tools are installed and (2) the Emacs prefix path is unix-friendly and writable, the netinstaller and its relevant menu items are activated.")


;; Net-install

;;;###autoload
(defun carbon-emacs-package-netinstall (&optional url)
  "Net-installer for Carbon Emacs Package."
  (interactive)

  (cond

   ;; error check
   ((not (eq window-system 'mac))
    (message "Net-installer requires an OSX/Carbon window environment."))
   ((not carbon-emacs-package-netinstall-on)
    (mac-dialog
     "Error" "Net-installer does not work, because (1) Developer Tools are not found, or because (2) the Emacs prefix path is not unix-friendly or writable."))
   ;; time limit: three-years
   ((> (string-to-int (format-time-string "%Y%m%d" (current-time)))
       (+ 30000
          (string-to-int (format-time-string "%Y%m%d" emacs-build-time))))
    (mac-dialog
     "Not available." "Three years have passed since this emacs was released.\nNet-installer packages are no longer available.\nUpgrade to the latest version."))

   (t
    (let* ((my-url (or url (read-string "Enter URL: " "http://")))
           (my-tmp-dir (make-temp-file "CarbonEmacs-netinstall-" t "/"))
           (my-install-step 0)
           last-nonmenu-event
           my-tgz-file
           my-dir-name
           my-sha1-string
           )

      ;; remove trailing white spaces (ref. [carbon-emacs:468])
      (while (string-match " $" my-url)
        (setq my-url (substring my-url 0 -1)))
      (setq my-tgz-file (file-name-nondirectory my-url)
            my-pkg-name (file-name-sans-extension my-tgz-file))

      (when (mac-dialog-y-or-n-p
             (concat "Download " my-pkg-name)
             (concat "Do you want to download the following package?\n"
                     my-url "\n\n"
                     "It may take some time.  You can press Ctrl-g "
                     "(hold down the Ctrl key then type g) to interrupt."))

        ;; downloader process
        (let* ((process-connection-type t)
               (default-directory my-tmp-dir)
               (my-process (start-process-shell-command
                            "netinstaller" "*CEP Netinstaller*"
                            (concat "curl -OR '" my-url "'")))
               (my-buffer (process-buffer my-process)))

          (switch-to-buffer my-buffer)
          ;; display spinner
          (unwind-protect
              (progn
                (while (eq (process-status my-process) 'run)
                  (redisplay)
                  (dolist (my-mark '("-" "/" "\|" "\\"))
                    (message "Downloading %s... %s" my-pkg-name my-mark)
                    (sleep-for 0.1)
                    ))
                (setq netinstall-step 1))

            ;; When interrupted by Ctrl-g,
            ;; discard buffer to kill the netinstallation subprocess
            (when (and (not (= my-install-step 1))
                       (buffer-live-p my-buffer))
              (kill-buffer my-buffer)
              (beep))
            ) ;; unwind

          (if (not (= (process-exit-status my-process) 0))
              (progn
                (mac-dialog
                 "Error"
                 (concat "An error occurred while downloading "
                         my-pkg-name "."))
                (beep))

            ;; otherwise, let's continue
            (let ((str (shell-command-to-string
                        (concat "openssl sha1 '" my-tgz-file "'"))))
              (string-match "\= \\(.*\\)" str)
              (setq my-sha1-string (or (match-string-no-properties 1 str)
                                      "(unavailable)"))
              )
            ;; dialog again && installer process
            (when
                (mac-dialog-y-or-n-p
                 (concat "Install " my-pkg-name)
                 (concat "Are you sure you want to install " my-pkg-name "?\n\n"
                         "SHA1: " my-sha1-string "\n\n"
                         "It may take some time. You can press Ctrl-g (hold down the Ctrl key then type g) to interrupt the installation."))
              (setq my-process
                    (start-process-shell-command
                     "netinstaller" "*CEP Netinstaller*"
                     (concat "tar zxvf " my-tgz-file "&&"
                             "cd " my-pkg-name "&&"
                             "make PACKAGE_PREFIX='"
                             carbon-emacs-package-prefix "'"))
                    my-buffer (process-buffer my-process))

              (switch-to-buffer my-buffer)
              ;; display spinner
              (unwind-protect
                  (progn
                    (while (eq (process-status my-process) 'run)
                      (redisplay)
                      (dolist (my-mark '("-" "/" "\|" "\\"))
                        (message "Installing %s... %s" my-pkg-name my-mark)
                        (sleep-for 0.1)
                        ))
                    (setq my-install-step 2))
                ;; When interrupted by Ctrl-g,
                ;; discard buffer to kill the netinstallation subprocess
                (when (and (not (= my-install-step 2))
                           (buffer-live-p my-buffer))
                  (kill-buffer my-buffer)
                  (beep))
                ) ;; unwind

              (if (= (process-exit-status my-process) 0)
                  (mac-dialog
                   "Installation done"
                   (concat (capitalize my-pkg-name)
                           " was successfully installed.\n"
                           "Restart Emacs for the changes to take effect."))
                (mac-dialog
                 "Error"
                 (concat "An error occurred while installing " my-pkg-name "."))
                (beep))

              ))))

        )))) ;; (defun (cond (t (let*


;; an extra menu (Help > Carbon Emacs Package) in the menu bar

;;;###autoload
(defvar carbon-emacs-package-map
  (make-sparse-keymap "Carbon Emacs Package Menu")
  "Keymap for Carbon Emacs Package Menu.")

(easy-menu-define carbon-emacs-package-menu carbon-emacs-package-map
  "Menu for Carbon Emacs Package."
  '("Carbon Emacs Package"
    ["Package Version"
     (mac-dialog
      "Carbon Emacs Package"
      (concat carbon-emacs-package-version "\n" (emacs-version)))
     :help "Show the release version of Carbon Emacs Package"]
    ["Web Site (jp)"
     (browse-url "http://homepage.mac.com/zenitani/emacs-j.html")
     :help "Visit the Japanese website"]
    ["Web Site (en)"
     (browse-url "http://homepage.mac.com/zenitani/emacs-e.html")
     :help "Visit the English website"]
    ["--" nil nil]
    ["CJK Fixed-Width Fontset"
     (setq carbon-emacs-package-osaka-lite-enabled
           (not carbon-emacs-package-osaka-lite-enabled))
     :style toggle :selected carbon-emacs-package-osaka-lite-enabled
     :help "Use 12pt fixed-width fontset, compatible with CJK languages"]
    ["Mac-Style Key Bindings"
     (mac-key-mode)
     :style toggle :selected mac-key-mode
     :help "Use Mac-style shortcut keys such as Command ($,1zx(B) + C to copy"]
    ["Mac-Style Print Dialog"
     (mac-print-mode)
     :style toggle :selected mac-print-mode
     :help "Use Mac-style print dialog (by a helper application, coral.app)"]
    ["Support Typical UNIX paths"
     (setq carbon-emacs-package-unix-path-fixed
           (not carbon-emacs-package-unix-path-fixed))
     :style toggle :selected carbon-emacs-package-unix-path-fixed
     :help "Add typical directories to the search paths (e.g. /usr/local/bin, /sw/bin)"]
    ["Save Changes..."
     (when (y-or-n-p
            (concat "Do you save changes to the preference file?\n"
                    "~/Library/Preferences/CarbonEmacsPackage.plist "))
       (dolist
           (elt
            '(
              ("MacKeyModeEnabled" . mac-key-mode)
              ("MacPrintModeEnabled" . mac-print-mode)
              ("FixedWidthFontset" . carbon-emacs-package-osaka-lite-enabled)
              ("UnixPathFix" . carbon-emacs-package-unix-path-fixed)
              ))
         (let ((key (car elt))
               (value (cond
                       ((numberp (cdr elt)) (cdr elt))
                       ((boundp (cdr elt)) (eval (cdr elt)))
                       (t "NO"))))
           (shell-command
            (concat "defaults write CarbonEmacsPackage " key " "
                    (cond
                     ((stringp value) value)
                     ((numberp value) (number-to-string value))
                     (value "YES")
                     (t "NO")
                     )))
           ))
       (message "")
       (mac-dialog
        "The changes have been saved."
        "Restart Emacs for the changes to take effect.")
       )
     :help "Save the above options to the preference file"]
    ["--" nil nil]
    ("Net-Install"
     ["Aspell (English)" nil :style toggle :selected t :active nil]
     ["Aspell (Brazilian Portuguese)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/aspell-pt_BR.tgz")
      :help "Install Brazilian Portuguese dictionary for aspell over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Aspell (French)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/aspell-fr.tgz")
      :help "Install French dictionary for aspell over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Aspell (German)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/aspell-de.tgz")
      :help "Install German dictionary for aspell over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Aspell (Italian)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/aspell-it.tgz")
      :help "Install Italian dictionary for aspell over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Aspell (Russian)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/aspell-ru.tgz")
      :help "Install Russian dictionary for aspell over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Aspell (Spanish)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/aspell-es.tgz")
      :help "Install Spanish dictionary for aspell over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["--" nil nil]
     ["BBDB"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/bbdb.tgz")
      :help "Install BBDB over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Cedet"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/cedet.tgz")
      :help "Install cedet over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Navi2ch"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/navi2ch.tgz")
      :help "Install navi2ch over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["SLIME"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/slime.tgz")
      :help "Install SLIME over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["Wanderlust (unmaintained)"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/wanderlust.tgz")
      :help "Install Wanderlust over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["YaTeX"
      (carbon-emacs-package-netinstall
       "http://macwiki.sourceforge.jp/emacs/netinstall/yatex.tgz")
      :help "Install YaTeX over the Internet"
      :active carbon-emacs-package-netinstall-on]
     ["--" nil nil]
     ["Enter URL..."
      (carbon-emacs-package-netinstall)
      :help "Enter URL to install third-party packages over the Internet"
      :active carbon-emacs-package-netinstall-on]
     )
    ["--" nil nil]
    ["Open Site-Lisp Directory"
     (shell-command
      (concat "/usr/bin/open "
              (shell-quote-argument
               (concat carbon-emacs-package-prefix "/site-lisp"))))
     :help "Open the site-lisp folder in Finder"]
    ["Open Site-Start Directory"
     (shell-command
      (concat "/usr/bin/open "
              (shell-quote-argument
               (concat carbon-emacs-package-prefix
                       "/site-lisp/site-start.d"))))
     :help "Open the site-start folder in Finder"]
    ))


(provide 'carbon-emacs-package)


;; carbon-emacs-package.el ends here.
