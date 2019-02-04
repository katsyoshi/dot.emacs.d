(require 'js2-mode)
(add-hook 'js2-mode-hook
          (lambda ()
             (setq js2-basic-offset 2)
             (setq js-switch-indent-offset 2)))
(add-hook 'js2-mode-hook #'lsp)
(add-hook 'js2-mode-hook #'flycheck)
