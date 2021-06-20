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
    consult
    ddskk
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
    consult-lsp
    consult-flycheck

    ;; visual thema
    ace-window
    doom
    doom-modeline
    doom-themes
    fill-column-indicator
    hide-mode-line
    minimap

    ;; lsp-mode
    lsp-mode
    lsp-ui

    ;; auto completion packages
    company
    company-box
    company-lsp

    ;; snippet
    yasnippet

    ;; terraform
    terraform-mode

    ;; ruby
    enh-ruby-mode
    inf-ruby
    ;; company for ruby
    company-inf-ruby

    ;; language packages
    ccls
    dockerfile-mode
    go-mode
    js2-mode
    markdown-mode
    lua-mode
    rust-mode
    yaml-mode
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
