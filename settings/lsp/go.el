;; -*- lexical-binding: t -*-
(when (require 'go-mode nil 'noerror)
  (when (fboundp 'lsp)
    (add-hook 'go-mode-hook #'lsp)))
