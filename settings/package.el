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
    counsel
    ddskk
    ddskk-posframe
    flycheck
    hydra
    magit
    migemo
    multiple-cursors
    neotree
    orderless
    undo-tree
    vertico
    web-mode

    ;; all-the-icons
    all-the-icons
    all-the-icons-ivy
    all-the-icons-ivy-rich

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

    ;; themes
    material-theme

    ;; language packages
    dockerfile-mode
    js2-mode
    yaml-mode
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
