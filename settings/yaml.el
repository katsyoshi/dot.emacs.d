(require 'yaml-mode)
(setq auto-mode-alist
      (cons (cons "\\.yml$" 'yaml-mode) auto-mode-alist))
(setq indent-tabs-mode nil)
(add-hook 'yaml-mode-hook '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

