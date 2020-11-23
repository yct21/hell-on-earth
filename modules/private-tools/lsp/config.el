;;; private-tools/lsp/config.el -*- lexical-binding: t; -*-

(after! lsp-mode
  (message "change lsp settings")
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-log-io nil)
  )
