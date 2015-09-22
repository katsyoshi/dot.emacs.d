(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "M-g M-b") 'magit-branch-manager)
(global-set-key (kbd "M-g M-c") 'magit-checkout)
(global-set-key (kbd "M-g M-g") 'magit-status)
(global-set-key (kbd "M-g M-u") 'magit-pull)
(global-set-key (kbd "M-g M-s") 'vc-git-grep)
