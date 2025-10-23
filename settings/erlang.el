;; -*- lexical-binding: t -*-
;; (setq load-path 
;;       (cons "~/.emacs.d/site-lisp/erlang-mode/" load-path))
(let ((root (cond ((string-match "darwin" system-configuration)
                   "/opt/local/lib/erlang")
                  ((string-match "freebsd" system-configuration)
                   "/usr/local/lib/erlang"))))
  (when root
    (setq erlang-root-dir root)
    (add-to-list 'exec-path (expand-file-name "bin" root))))

(when (require 'erlang-start nil 'noerror)
  (message "Erlang mode loaded."))
