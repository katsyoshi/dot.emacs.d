(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(fset 'package-desc-vers 'package--ac-desc-version)
;; (package-refresh-contents)
(package-initialize)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; for auto-complete
    auto-complete fuzzy popup pos-tip

    ;;;; buffer utils
    popwin elscreen yascroll buffer-move

    ;;;; flymake
    flycheck flymake-jslint flymake-coffee

    ;;;; helm
    helm

    ;;;; git
    magit git-gutter git-rebase-mode git-commit-mode gitconfig-mode gitignore-mode
    gitattributes-mode

    ;;;; rails
    haml-mode slim-mode sass-mode coffee-mode feature-mode flymake-ruby flymake-haml

    ;;;; skk
    ddskk

    ;;;; text
    yaml-mode markdown-mode flymake-yaml

    ;;;; lang
    lua-mode rust-mode flymake-lua flymake-rust
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))


