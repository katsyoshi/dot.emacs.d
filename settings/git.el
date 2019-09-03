(require 'magit)
(setq magit-repository-directories '(("~/." . 5 )))

(global-set-key (kbd "C-x C-g") 'magit-status)
