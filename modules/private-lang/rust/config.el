(after! lsp-mode
  (setq rustic-lsp-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-command "~/.cargo/bin/rust-analyzer")
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-ui-doc-use-childframe nil)
  )

(after! rustic
  (add-hook! rustic-mode
    (lsp-rust-analyzer-inlay-hints-mode +1)
    (lsp-ui-doc-mode +1))
  )
