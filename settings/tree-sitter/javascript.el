;; -*- lexical-binding: t -*-
(when (and (boundp 'dotemacs/tree-sitter-has-legacy)
           dotemacs/tree-sitter-has-legacy
           (fboundp 'tree-sitter-require))
  (ignore-errors
    (tree-sitter-require 'javascript)))

(when (fboundp 'javascript-ts-mode)
  (add-to-list 'major-mode-remap-alist '(js-mode . javascript-ts-mode)))
