(after! lsp-mode
  (setq rustic-lsp-server 'rust-analyzer))

(after! lsp-mode
  (setq lsp-rust-analyzer-server-command "~/.cargo/bin/rust-analyzer")
  (setq lsp-rust-server 'rust-analyzer))
