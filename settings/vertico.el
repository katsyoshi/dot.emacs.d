;; -*- lexical-binding: t -*-
(require 'vertico)
(vertico-mode)

;; orderless 設定
(require 'orderless)
(setq completion-styles '(orderless))

(require 'vertico-directory)

(require 'marginalia)
(marginalia-mode)

(keymap-set vertico-map "RET" #'vertico-directory-enter)
(keymap-set vertico-map "DEL" #'vertico-directory-delete-char)

;; consult 設定
(global-set-key (kbd "C-c C-f") 'consult-ripgrep)
(global-set-key (kbd "M-y") 'consult-yank-from-kill-ring)
(global-set-key (kbd "C-s") 'consult-line)
