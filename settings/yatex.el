;; YaTeX MODE
;;(load "~/.emacs.d/elisp/yatexmode.el")
;; (setq load-path(cons "~/.emacs.d/site-lisp/yatex/" load-path))
;;; *.tex
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (require 'yatex-mode)
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-kanji-code 4)
(setq YaTeX-use-LaTeX2e t)
;(setq YaTex-basic-offset 4)
(setq YaTeX-use-font-lock t)
(setq YaTeX-inhibit-prefix-letter t)
(setq tex-command "~/.emacs.d/settings/platex2pdf-utf8"
      dvi2-command "open -a Preview")
(setq bibtex-command (cond ((string-match "uplatex" tex-command) "upbibtex -kanji=utf8")
                           ((string-match "platex" tex-command) "pbibtex -kanji=utf8")
                           ((string-match "lualatex\\|xelatex" tex-command) "biber")
                           (t "bibtex")))
(setq YaTeX-dvi2-command-ext-alist
      '(("[agx]dvi\\|dviout" . ".dvi")
        ("gv" . ".ps")
        ("texworks\\|xpdf\\|Preview\\|acroread\\|pdfopen" . ".pdf")))
;(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
