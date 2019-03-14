(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tab-mode nil)
            (local-set-key (kbd "C-c c") 'compile)
            (local-set-key (kbd "C-c C-g") 'grep)
            (local-set-key (kbd "C-c C-k c") 'kill-compile)
            (local-set-key (kbd "C-c C-k g") 'kill-grep)))
