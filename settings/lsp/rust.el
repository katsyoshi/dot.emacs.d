(require 'rust-mode)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'flycheck-mode)
