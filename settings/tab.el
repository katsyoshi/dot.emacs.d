;; Tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-stop-list
              '(4 8 16 20 24 28 32 36 40 44 48 52 56 60))

;; C/C++ mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (setq c-basic-offset tab-width)))
;; Make
(add-hook 'makefile-mode-hook
          '(lambda ()
             (setq tab-width 8)))
;; ShellScript
(add-hook 'shell-script-mode-hook
          '(lambda ()
             (setq tab-width 8)))
;; Ruby mode
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-indent-tabs-mode nil)
             (setq indent-level 2)))

;; Yaml mode
(add-hook 'yaml-mode-hook
          '(lambda ()
             (setq tab-width 8)))
;; elisp mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq tab-width 8)))
;; XML mode
(add-hook 'nxml-mode
          '(lambda()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (setq nxml-slash-auto-complete-flag t)))