(after! lsp-mode
  (setq rustic-lsp-server 'rust-analyzer)
  (setq lsp-rust-analyzer-server-command "~/.local/bin/rust-analyzer")
  (setq lsp-rust-server 'rust-analyzer)

  (setq lsp-rust-show-hover-context nil)
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
  (setq lsp-rust-analyzer-display-chaining-hints t)
  (setq lsp-rust-analyzer-cargo-watch-enable nil)
  )

(after! rustic
  (add-hook! rustic-mode
             )
  ;; (when (buffer-file-name)
  ;;   (lsp-rust-analyzer-inlay-hints-mode +1)))
  )

(after! quickrun
  (quickrun-add-command "rust"
    '((:command . "rustc")
      (:exec . ("%c --edition 2018 %o -o %e %s" "%e %a"))
      (:compile-only . "%c %o -o %e %s")
      (:remove . ("%e"))
      (:description . "Compile rust and execute"))
    :default "rustic")
  )
