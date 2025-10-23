;; -*- lexical-binding: t -*-
(when (require 'rust-mode nil 'noerror)
  (when (fboundp 'lsp)
    (add-hook 'rust-mode-hook #'lsp)))
