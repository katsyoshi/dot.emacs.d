;; -*- lexical-binding: t -*-
;; AutoComplete
(when (require 'auto-complete nil 'noerror)
  (global-auto-complete-mode t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/site-lisp/auto-complete/dict/")
  (when (require 'auto-complete-config nil 'noerror)
    (ac-config-default)))
