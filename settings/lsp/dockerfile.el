(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-hook 'dockerfile-mode-hook #'lsp)
