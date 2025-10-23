;; -*- lexical-binding: t -*-
;; helm
(if (require 'helm-config nil 'noerror)
    (progn
      (helm-mode 1)
      (global-set-key (kbd "C-x C-f") #'helm-find-files)
      (global-set-key (kbd "C-c C-v") #'helm-show-kill-ring)
      (global-set-key (kbd "C-c C-l") #'goto-line))
  (message "helm not available; default bindings retained."))
