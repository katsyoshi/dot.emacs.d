(require 'magit)
(require 'magit-gh-pulls)

(require 'git-rebase-mode)
(require 'git-commit-mode)
(require 'gitconfig-mode)
(require 'gitignore-mode)
(require 'gitattributes-mode)

(global-set-key (kbd "M-g M-b") 'magit-branch-manager)
(global-set-key (kbd "M-g M-c") 'magit-checkout)
(global-set-key (kbd "M-g M-g") 'magit-status)
(global-set-key (kbd "M-g M-u") 'magit-pull)
(global-set-key (kbd "M-g M-s") 'vc-git-grep)

(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
