;; -*- lexical-binding: t -*-
(if (require 'chatgpt-shell nil 'noerror)
    (progn
      (setq chatgpt-shell-ollama-models '("llama3.1" "codellama" "qwen2.5-coder"))
      (setq chatgpt-shell-model-version "ollama:qwen2.5-coder")
      (setq chatgpt-shell-ollama-url "http://localhost:11434")
      (global-set-key (kbd "C-c o") #'chatgpt-shell))
  (message "chatgpt-shell package not available; Ollama bindings disabled."))
