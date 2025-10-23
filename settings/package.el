;; -*- lexical-binding: t -*-
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

    ;; completion helpers
    auto-complete

    ;; AI / LLM integrations
    chatgpt-shell
    copilot
    copilot-chat
    ellama
    ;; llm-ollama is loaded opportunistically because it is not packaged

    ;; consult
    consult-flycheck
    consult-hatena-bookmark

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
    ccls
    dockerfile-mode
    go-mode
    graphviz-dot-mode
    helm
    js2-mode
    mastodon
    plantuml-mode
    rbs-mode
    rust-mode
    scala-mode
    textile-mode
    tsx-mode
    twittering-mode
    yaml-mode

    ;; claude
    claude-code

    ;; lsp and tooling
    lsp-mode
    lsp-ui
    term+
    e2wm
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (condition-case err
        (package-install package)
      (error (message "Failed to install %s: %s" package err)))))
