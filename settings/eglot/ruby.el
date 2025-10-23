;; -*- lexical-binding: t -*-
(add-to-list 'eglot-server-programs '(ruby-ts-mode . ("ruby-lsp")))
(add-hook 'ruby-ts-mode-hook 'eglot-ensure)
