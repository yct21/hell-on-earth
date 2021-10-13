;;; private-tools/lsp/config.el -*- lexical-binding: t; -*-

(after! lsp-mode
  (message "change lsp settings")
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-log-io nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-diagnostics-provider :none)
  (setq lsp-completion-enable t)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-links nil)
  (defvar lsp-on-touch-time 0)
  (defadvice lsp-on-change (around lsp-on-change-hack activate)
    ;; don't run `lsp-on-change' too frequently
    (when (> (- (float-time (current-time))
                lsp-on-touch-time) 30) ;; 30 seconds
      (setq lsp-on-touch-time (float-time (current-time)))
      ad-do-it)))
