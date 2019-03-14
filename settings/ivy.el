;; ivy設定
(require 'ivy)
(ivy-mode 1)
(global-set-key "\C-s" 'swiper)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 30)
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

;; counsel設定
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-c C-f") 'counsel-rg)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

;; swiper設定
(global-set-key (kbd "C-s") 'swiper)
(defvar swiper-include-line-number-in-search t)

;; all-the-icons-ivy
(require 'all-the-icons)
(all-the-icons-ivy-setup)
