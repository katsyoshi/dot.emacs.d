(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(fset 'package-desc-vers 'package--ac-desc-version)
;; (package-refresh-contents)
(package-initialize)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;; default install packages
    exec-path-from-shell
    counsel
    ddskk
    magit
    neotree

    ;; all-the-icons
    all-the-icons
    all-the-icons-ivy

    ;; lsp-mode
    lsp-mode
    lsp-ui

    ;; auto completion packages
    company
    company-lsp

    ;; language packages
    dockerfile-mode
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
