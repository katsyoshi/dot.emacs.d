(require 'magit)
(setq magit-repository-directories
      '(("~/" . 5)))
(global-set-key (kbd "C-c C-s") 'magit-status)
