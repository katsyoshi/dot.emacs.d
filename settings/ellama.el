;; -*- lexical-binding: t -*-
(require 'ellama)
(require 'llm-ollama nil 'noerror)

(setopt ellama-keymap-prefix "C-c e")
(setopt ellama-language "Japanese")

(when (fboundp 'make-llm-ollama)
  (setopt ellama-provider (make-llm-ollama
                           :chat-model "llama3.1:latest"
                           :embedding-model "llama3.1:latest"))
  (setopt ellama-chat-translation-enabled nil)
  (setopt ellama-translation-provider (make-llm-ollama
                                       :chat-model "gemma:latest"
                                       :embedding-model "gemma:latest")))
