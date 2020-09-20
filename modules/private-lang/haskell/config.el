;;; private-lang/haskell/config.el -*- lexical-binding: t; -*-


(after! lsp-mode
 (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")

 ;; Comment/uncomment this line to see interactions between lsp client/server.
 (setq lsp-log-io t)
)

(after! haskell-mode
  (add-hook! 'haskell-mode-hook
    (push 'haskell-stack-ghc flycheck-disabled-checkers)
    (push 'haskell-ghc flycheck-disabled-checkers))
  )
