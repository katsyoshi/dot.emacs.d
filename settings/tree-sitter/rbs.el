(require 'rbs-mode)
(tree-sitter-require 'rbs)
(add-to-list major-mode-remap-alist '(rbs-mode . rbs-ts-mode))
