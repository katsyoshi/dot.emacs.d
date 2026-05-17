;; -*- lexical-binding: t -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;; startup
    exec-path-from-shell

    ;; completion
    corfu
    consult
    marginalia
    orderless
    vertico

    ;; editing
    flycheck
    markdown-mode
    undo-tree
    yasnippet

    ;; input
    ddskk
    ddskk-posframe

    ;; search
    dash
    migemo
    s

    ;; git
    magit

    ;; AI / LLM
    chatgpt-shell
    copilot
    ellama
    ;; llm-ollama is loaded opportunistically because it is not packaged

    ;; appearance
    doom-modeline
    doom-themes

    ;; languages
    js2-mode
    rbs-mode
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (condition-case err
        (package-install package)
      (error (message "Failed to install %s: %s" package err)))))
