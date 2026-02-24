;; -*- lexical-binding: t -*-
(require 'corfu)

(setq corfu-auto t
      corfu-auto-delay 0
      corfu-auto-prefix 3
      corfu-cycle t)

(global-corfu-mode 1)

;; Keep Enter as default completion key and add only navigation keys.
(define-key corfu-map (kbd "TAB") #'indent-for-tab-command)
(define-key corfu-map (kbd "<tab>") #'indent-for-tab-command)
(define-key corfu-map (kbd "C-S-n") #'corfu-next)
(define-key corfu-map (kbd "C-S-p") #'corfu-previous)
