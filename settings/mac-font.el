;; Mac fonts
;; Mac用フォント
;; Cocoa
(cond
 ((eq window-system 'ns)
  (load "fonts23"))
 ((eq window-system 'mac)
  (require 'carbon-font)
  (fixed-width-set-fontset "hirakaku_w3" 14)))
