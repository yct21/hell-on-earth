;;; private-lang/reasonml/config.el -*- lexical-binding: t; -*-


(use-package! reason-mode
  :config
  (add-hook 'reason-mode-hook #'lsp!))

;;;(after! reason-mode
  ;;;(lsp-register-client
   ;;;(make-lsp-client :new-connection (lsp-stdio-connection "/Users/yct21/code/emacs/reason-language-server.exe")
     ;;;               :major-modes '(reason-mode)
       ;;;             :server-id 'ocaml-ls)))
