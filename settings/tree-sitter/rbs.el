;; -*- lexical-binding: t -*-
(when (require 'rbs-mode nil 'noerror)
  (when (and (boundp 'dotemacs/tree-sitter-has-legacy)
             dotemacs/tree-sitter-has-legacy
             (fboundp 'tree-sitter-require))
    (ignore-errors
      (tree-sitter-require 'rbs)))
  (when (fboundp 'rbs-ts-mode)
    (add-to-list 'major-mode-remap-alist '(rbs-mode . rbs-ts-mode))))
