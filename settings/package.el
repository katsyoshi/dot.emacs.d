(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(fset 'package-desc-vers 'package--ac-desc-version)
;; (package-refresh-contents)
(package-initialize)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; system
    exec-path-from-shell

    ;;;; for auto-complete
    auto-complete fuzzy popup pos-tip yasnippet auto-yasnippet

    ;;;; buffer utils
    popwin elscreen yascroll buffer-move

    ;;;; flycheck
    flycheck

    ;;;; helm
    helm

    ;;;; git
    magit git-gutter git-rebase-mode git-commit-mode gitconfig-mode gitignore-mode
    gitattributes-mode gh magit-gh-pulls

    ;;;; rails
    haml-mode slim-mode sass-mode coffee-mode feature-mode

    ;;;; skk
    ddskk

    ;;;; text
    yaml-mode markdown-mode

    ;;;; lang
    lua-mode rust-mode
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))


