;;; carbon-font-lite.el -- default fontset for Carbon Emacs Package
;; -*- coding: iso-2022-7bit -*-

;; Contact: Seiji Zenitani <zenitani@mac.com>
;; Original Author: Takashi Hiromatsu <matsuan@users.sourceforge.jp>

;;; Commentary:

;; This file provides a multilingual fixed-width fontset, a subset of
;; carbon-font.el by Takashi Hiromatsu, for Carbon Emacs Package.
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GPL version 2 or later.

;; $B$3$N%U%!%$%k$O!"(BCarbon Emacs $B%Q%C%1!<%8MQ$N%U%)%s%H%;%C%H$rDs6!$7$^$9!#(B
;; $BW">>$5$s:n@.$N(B carbon-font.el $B$GDs6!$5$l$F$$$k%U%)%s%H%;%C%H=8$+$i(B
;; osaka 12 $B%]%$%s%H$r<h$j=P$7$F!"JLL>$GDj5A$7$F$$$^$9!#(B
;; $B$3$N%U%!%$%k$O(B GPL $B%i%$%;%s%9(B (v3 $B0J9_(B) $B$K4p$E$$$F:FG[I[2DG=$G$9!#(B

;;; Code:

(require 'fixed-width-fontset)

(defvar fixed-width-fontset-template "-*-*-medium-r-normal--%d-*-*-*-*-*-fontset-%s")

(defalias 'fixed-width-create-fontset-func 'create-fontset-from-mac-roman-font)

;;;;;;;;;;;;;;;;;;;; modified (S. Zenitani) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; osaka 12 pt

(let ((fixed-width-encode-reg-alist
       '((japanese-jisx0208 . "iso10646-*")
         (katakana-jisx0201 . "iso10646-*")
         (japanese-jisx0212 . "iso10646-*")
         (thai-tis620 . "iso10646-*")
         (chinese-gb2312 . "iso10646-*")
         (chinese-big5-1 . "iso10646-*")
         (korean-ksc5601 . "iso10646-*")
         (latin-iso8859-1 . "mac-roman")
         (latin-iso8859-2 . "mac-centraleurroman")
         (cyrillic-iso8859-5 . "mac-cyrillic")))
      (fixed-width-xlfd-template
       "-apple-%s-medium-r-normal--%d-*-*-*-*-*-iso10646-1"))
  (fixed-width-create-fontset "osaka_lite" 12
                              '((ascii . "monaco")
                                (japanese-jisx0208 . "osaka")
                                (katakana-jisx0201 . "osaka")
                                (japanese-jisx0212 . "osaka")
                                (chinese-gb2312 . "stheiti*")
                                (chinese-big5-1 . "lihei pro*")
                                (korean-ksc5601 . "applegothic*"))))

;;;;;;;;;;;;;;;;;;;; modified (S. Zenitani) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; $BJQ?t(B section
;;

;;  $B;HMQ$9$k%U%)%s%H%;%C%H$rJQ$($?8e!"<+F0$G!"%\!<%k%I$r%j%9%1!<%k$5$;$k!#(B
;;  $B%\!<%k%I$r%j%9%1!<%k$9$k0Y$N%U%!%/%?!<$NDj5A(B

(defvar fixed-width-scale-alist-hiragino
  '(("7" . 1.15) ("8" . 1.35) ("9" . 1.35) ("10" . 1.2) ("12" . 1.2)
    ("14" . 1.2) ("16" . 1.25) ("18" . 1.25) ("20" . 1.2) ("24" . 1.2)))

(defvar fixed-width-scale-alist-two-byte-bold
  '(("8" . 1.2) ("9" . 1.25) ("10" . 1.1) ("12" . 1.15)
    ("14" . 1.1) ("16" . 1.2) ("18" . 1.2) ("20" . 1.15) ("24" . 1.15)))

(defvar fixed-width-scale-alist-osaka-normal
  '(("7" . 1.15) ("8" . 1.25) ("9" . 1.35) ("10" . 1.2) ("12" . 1.2)
    ("14" . 1.2) ("16" . 1.25) ("18" . 1.25) ("20" . 1.2) ("24" . 1.2)))

(defvar fixed-width-scale-alist-osaka-bold
  '(("7" . 1.15) ("8" . 1.25) ("9" . 1.35) ("10" . 1.25) ("12" . 1.2)
    ("14" . 1.2) ("16" . 1.25) ("18" . 1.25) ("20" . 1.2) ("24" . 1.2)))

(defvar fixed-width-scale-alist-hirakaku-bold
  '(("7" . 1.1) ("8" . 1.2) ("9" . 1.3) ("10" . 1.1) ("12" . 1.1)
    ("14" . 1.1) ("16" . 1.2) ("18" . 1.2) ("20" . 1.15) ("24" . 1.15)))

(defvar fixed-width-scale-alist-hirahan-bold
  '(("7" . 0.8) ("8" . 1.1) ("9" . 1.2) ("10" . 1.0) ("12" . 1.0)
    ("14" . 1.0) ("16" . 1.1) ("18" . 1.1) ("20" . 1.1) ("24" . 1.1)))

(defvar fixed-width-scale-alist-hiramin
  '(("7" . 1.15) ("8" . 1.35) ("9" . 1.2) ("10" . 1.2) ("12" . 1.2)
    ("14" . 1.2) ("16" . 1.25) ("18" . 1.25) ("20" . 1.2) ("24" . 1.2)))

(defvar fixed-width-scale-alist-monaco-bold
  '(("7" . 0.8) ("8" . 0.95) ("9" . 0.9) ("10" . 0.8) ("12" . 0.9)
    ("14" . 0.9) ("16" . 0.95) ("18" . 0.9) ("20" . 0.95) ("24" . 0.92)))

(defvar fixed-width-get-scale-alist
  `((".*monaco-bold-.*-mac-roman" . ,fixed-width-scale-alist-monaco-bold)
    (".*monaco cy-bold-.*-mac-cyrillic" . ,fixed-width-scale-alist-monaco-bold)
    (".*courier-bold-.*-mac-roman" . (( "9" . 0.9) ("10" . 0.9)))
    (".*osaka-medium.*" . ,fixed-width-scale-alist-osaka-normal)
    (".*osaka-bold.*" . ,fixed-width-scale-alist-osaka-bold)
    ("^-apple-hiragino.*" . ,fixed-width-scale-alist-hiragino)
    ("^-apple-stheiti-.*" . ,fixed-width-scale-alist-hiragino)
    ("^-apple-lihei pro-.*" . ,fixed-width-scale-alist-hiragino)
    ("^-apple-applegothic-.*" . ,fixed-width-scale-alist-hiragino)
    ("^-apple-applemyungjo-.*" . ,fixed-width-scale-alist-hiramin)
    ("^-apple-lisong pro-.*" . ,fixed-width-scale-alist-hiramin)
    (,(encode-coding-string ".*$B%R%i%.%N4]%4(B pro w4.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hiragino)
    (,(encode-coding-string ".*$B%R%i%.%N3Q%4(B pro w3-medium.*" 'emacs-mule) .
     ,fixed-width-scale-alist-osaka-normal)
    (,(encode-coding-string ".*$B%R%i%.%N3Q%4(B pro w3-bold.*jisx0208.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hirakaku-bold)
    (,(encode-coding-string ".*$B%R%i%.%N3Q%4(B pro w3-bold.*jisx0201.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hirahan-bold)
    (,(encode-coding-string ".*$B%R%i%.%N3Q%4(B pro w6.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hiragino)
    (,(encode-coding-string ".*$B%R%i%.%N3Q%4(B std w8.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hiragino)
    (,(encode-coding-string ".*$B%R%i%.%NL@D+(B pro w3.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hiramin)
    (,(encode-coding-string ".*$B%R%i%.%NL@D+(B pro w6.*" 'emacs-mule) .
     ,fixed-width-scale-alist-hiramin)
    ("^-apple-stkaiti-.*" . ,fixed-width-scale-alist-hiramin)
    ("^-apple-hei-.*" . ,fixed-width-scale-alist-hiragino)
    ("^-apple-apple ligothic-.*" . ,fixed-width-scale-alist-hiragino))
  "ReScale factor alist for each fonts and size.")

(provide 'carbon-font-lite)

;;; carbon-font-lite.el ends here
