(tree-sitter-require 'ruby)
(add-to-list 'tree-sitter-major-mode-language-alist '(ruby-ts-mode . ruby))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cgi$" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.gemspsec$" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Steepfile" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.schema" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rbs" . rbs-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc" . rbs-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys
  "inf-ruby" "Set local key defs for inf-ruby in ruby-ts-mode")

(defun exec-bundle-update-for-emacs-shortcuts ()
  "Update Emacs shortcuts using the Bundle package manager."
  (interactive)
  (shell-command-to-string "bundle update"))

(defun my/exec-bundle-update-for-emacs-shortcuts ()
  (local-set-key (kbd "C-c b u") 'exec-bundle-update-for-emacs-shortcuts))

(add-hook 'ruby-mode-hook 'my/exec-bundle-update-for-emacs-shortcuts)

(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-construct nil)

;; flycheck ruby rubocop
(add-hook 'ruby-ts-mode-hook
          #'(lambda ()
             (setq flycheck-checker 'ruby-lint)
             (flycheck-mode 1)))

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))
(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'ruby-ts-mode-hook 'inf-ruby-minor-mode)
