;; -*- lexical-binding: t -*-
(when (require 'tsx-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.tsx$" . tsx-mode)))
