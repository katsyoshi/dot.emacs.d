(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tab-mode nil)
            (local-set-key "\C-cc" 'compile)
            (local-set-key "\C-c\C-g" 'grep)
            (local-set-key "\C-c\C-kc" 'kill-compile)
            (local-set-key "\C-c\C-kg" 'kill-grep)))
