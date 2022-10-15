(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)
(package-refresh-contents)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;; default install packages
    exec-path-from-shell
    company
    company-box
    consult
    ddskk
    ddskk-posframe
    eglot
    flycheck
    hydra
    magit
    migemo
    multiple-cursors
    neotree
    undo-tree
    vertico

    ;; all-the-icons
    all-the-icons
    all-the-icons-ivy

    ;; consult
    consult-flycheck

    ;; visual thema
    ace-window
    doom
    doom-modeline
    doom-themes
    fill-column-indicator
    hide-mode-line
    minimap

    ;; snippet
    yasnippet

    ;; terraform
    terraform-mode

    ;; ruby
    inf-ruby

    ;; language packages
    ccls
    dockerfile-mode
    go-mode
    js2-mode
    markdown-mode
    lua-mode
    plantuml-mode
    rust-mode
    yaml-mode
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
