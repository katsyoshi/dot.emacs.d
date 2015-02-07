;; AutoComplete
;; (setq 'ac-dictionary-directories
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/site-lisp/auto-complete/dict/")
(require 'auto-complete-config)
(ac-config-default)
;; 'ac-dictionary-directories
