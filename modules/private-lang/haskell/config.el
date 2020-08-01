;;; private-lang/haskell/config.el -*- lexical-binding: t; -*-

(message "haskell/config")

(after! lsp-mode
 (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
 (message "haskell/config/afterlsp")

 ;; Comment/uncomment this line to see interactions between lsp client/server.
 (setq lsp-log-io t)
)

(after! haskell-mode
 (message "haskell/config/aftermode")
  (add-hook! 'haskell-mode-hook
    (push 'haskell-stack-ghc flycheck-disabled-checkers))
  )
