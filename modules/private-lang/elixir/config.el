;;; private-lang/elixir/config.el -*- lexical-binding: t; -*-

(add-to-list 'exec-path "/Users/yct21/code/emacs/elixir-lsp")

(def-package! elixir-mode
  :defer t
  :init
  ;; Disable default smartparens config. There are too many pairs; we only want
  ;; a subset of them (defined below).
  (provide 'smartparens-elixir)
  :config
  (add-hook 'elixir-mode-hook #'lsp!)
  (set-pretty-symbols! 'elixir-mode
    ;; Functional
    :def "def"
    :lambda "fn"
    ;; :src_block "do"
    ;; :src_block_end "end"
    ;; Flow
    :not "!"
    :in "in" :not-in "not in"
    :and "and" :or "or"
    :for "for"
    :return "return" :yield "use")

  ;; ...and only complete the basics
  (after! smartparens
    (sp-with-modes 'elixir-mode
      (sp-local-pair "do" "end"
                     :when '(("RET" "<evil-ret>"))
                     :unless '(sp-in-comment-p sp-in-string-p)
                     :post-handlers '("||\n[i]"))
      (sp-local-pair "do " " end" :unless '(sp-in-comment-p sp-in-string-p))
      (sp-local-pair "fn " " end" :unless '(sp-in-comment-p sp-in-string-p))))
  )
