;; -*- lexical-binding: t -*-
(when (require 'textile-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode)))
