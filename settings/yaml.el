(autoload 'yaml-mode "yaml-mode" "Mode for editing TeX sources files")
(setq auto-mode-alist
      (cons (cons "\\.yml$" 'yaml-mode) auto-mode-alist))
(setq indent-tabs-mode nil)
(add-hook 'yaml-mode-hook '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

