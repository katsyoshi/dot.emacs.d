(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(fset 'package-desc-vers 'package--ac-desc-version)
;; (package-refresh-contents)
(package-initialize)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; system
    exec-path-from-shell

    ;;;; for auto-complete
    auto-complete fuzzy popup pos-tip

    ;;;; buffer utils
    popwin elscreen yascroll buffer-move

    ;;;; flycheck
    flycheck

    ;;;; helm
    helm

    ;;;; git
    magit gitattributes-mode gh magit-gh-pulls

    ;;;; rails
    haml-mode slim-mode sass-mode coffee-mode feature-mode web-mode

    ;;;; skk
    ddskk

    ;;;; snippet
    yasnippet auto-yasnippet helm-c-yasnippet

    ;;;; text
    yaml-mode markdown-mode textile-mode

    ;;;; lang
    lua-mode rust-mode

    ;; Dockerfile
    dockerfile-mode
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
