;; -*- lexical-binding: t -*-
(when (require 'org nil 'noerror)
  (setq org-startup-truncated nil)
  (setq org-return-follows-link t)
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (when (require 'org-remember nil 'noerror)
    (when (fboundp 'org-remember-insinuate)
      (org-remember-insinuate)))
  (setq org-directory "~/.emacs.d/memo/")
  (setq org-default-notes-file (concat org-directory "agenda.org"))
  (setq org-remember-templates
        '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
          ("Bug" ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
          ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")))

  (when (boundp 'org-export-latex-classes)
    (add-to-list 'org-export-latex-classes
                 '("resume"
                   "\\documentclass{jsarticle}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))))
