(require 'haml-mode)
(require 'sass-mode)
(require 'coffee-mode)
(require 'feature-mode)
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
(add-hook 'feature-mode-hook 'flycheck-mode)
(custom-set-variables '(coffee-tab-width 2))

(require 'helm-rails)
(define-key global-map (kbd "M-p M-c") 'helm-rails-controllers)
(define-key global-map (kbd "M-p M-m") 'helm-rails-models)
(define-key global-map (kbd "M-p M-u") 'helm-rails-views)
(define-key global-map (kbd "M-p M-s") 'helm-rails-specs)
(define-key global-map (kbd "M-p M-r") 'helm-rails-all)
