;; -*- lexical-binding: t -*-
(when (require 'rbs-ts-mode nil 'noerror)
  (when (and (boundp 'dotemacs/tree-sitter-has-legacy)
             dotemacs/tree-sitter-has-legacy
             (fboundp 'tree-sitter-require))
    (ignore-errors
      (tree-sitter-require 'rbs)))
  (add-to-list 'major-mode-remap-alist '(rbs-mode . rbs-ts-mode)))
