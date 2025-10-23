;; -*- lexical-binding: t -*-
(let* ((term-plus-root (expand-file-name "site-lisp/term-plus-el/" user-emacs-directory))
       (subdirs-el (expand-file-name "lib/subdirs.el" term-plus-root)))
  (if (file-directory-p term-plus-root)
      (progn
        (when (file-exists-p subdirs-el)
          (load-file subdirs-el))
        (when (fboundp 'add-subdirs-to-load-path)
          (add-subdirs-to-load-path term-plus-root))
        (dolist (feature '(term+ term+mux xterm-256color key-intercept multi-mode-util))
          (require feature nil 'noerror)))
    (message "term-plus not available; skipping additional terminal config.")))
