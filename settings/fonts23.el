;; Cocoa
(when (>= emacs-major-version 23)
  (when (eq window-system 'ns)
    (progn
      (set-face-attribute 'default nil
                          :family "Ricty"
                          :height 140)
      (set-fontset-font
       (frame-parameter nil 'font)
       'japanese-jisx0208
       '("Ricty" . "iso10646-1"))
      (set-fontset-font
       (frame-parameter nil 'font)
       'japanese-jisx0208
       '("Hiragino Maru Gothic Pro" . "iso10646-1"))
      (set-fontset-font
       (frame-parameter nil 'font)
       'japanese-jisx0212
       '("Hiragino Maru Gothic Pro" . "iso10646-1"))
      (setq face-font-rescale-alist
            '(("^-apple-hiragino.*" . 1.2)
              (".*osaka-bold.*" . 1.2)
              (".*osaka-medium.*" . 1.2)
              (".*courier-bold-.*-mac-roman" . 1.0)
              (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
              (".*monaco-bold-.*-mac-roman" . 0.9)
              ("-cdac$" . 1.3)))))
  (when (eq window-system 'x)
    (progn
      (set-face-attribute 'default nil
                          :family "Ricty"
                          :height 100))))

(global-set-key (kbd "M-C-<up>") 'text-scale-increase)
(global-set-key (kbd "M-C-<down>") 'text-scale-decrease)
(global-set-key (kbd "M-C-a") 'text-scale-adjust)
