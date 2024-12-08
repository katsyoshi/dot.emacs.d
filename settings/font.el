(setq 4k '(3840 2160))
(setq fhd '(1920 1080))
(setq default-font-height 100)
(setq 4k-font-height 140)
(setq fhd-font-height 160)
(setq default-display-width 10) ;; maybe default display size
(setq default-display-height 9) ;; maybe default display size

(cond ((and (= (display-pixel-width) default-display-width)
            (= (display-pixel-height) default-display-height))
       (setq font-height default-font-height))
      ((and (>= (display-pixel-width) (nth 0 4k))
            (>= (display-pixel-height) (nth 1 4k)))
       (setq font-height 4k-font-height))
      ((and (>= (display-pixel-width) (nth 0 fhd))
            (>= (display-pixel-height) (nth 1 fhd)))
       (setq font-height 4k-font-height))
      ((and (<  (display-pixel-width) (nth 0 fhd))
            (<  (display-pixel-height) (nth 1 fhd)))
       (setq font-height 4k-font-height)))

;; フォント設定
(set-face-attribute 'default nil :family "Cica" :height font-height)

(global-set-key (kbd "s-C-u") 'text-scale-increase)
(global-set-key (kbd "s-C-l") 'text-scale-decreae)
(global-set-key (kbd "s-C-0") 'text-scale-adjust)
