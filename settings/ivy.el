;; ivy設定
(require 'ivy)
(ivy-mode 1)
(global-set-key "\C-s" 'swiper)
(setq enable-recursive-minibuffers t)
(setq ivy-use-virtual-buffers t
      ivy-height 30
      ivy-extra-directories nil
      ivy-re-builders-alist '((t . ivy--regex-fuzzy))
      ivy-initial-inputs-alist nil)

;; counsel設定
(global-set-key (kbd "C-c C-f") 'counsel-rg)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-c C-c") 'counsel-flycheck)
(defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

;; swiper設定
(global-set-key (kbd "C-s") 'swiper)
(defvar swiper-include-line-number-in-search t)

;; all-the-icons-ivy
(require 'all-the-icons)
(all-the-icons-ivy-setup)
