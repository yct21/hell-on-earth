;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (company +childframe)
       (ivy +prescient +icons +childframe)

       :ui
       deft
       doom
       doom-dashboard
       doom-quit
       fill-column
       hl-todo
       hydra
       modeline
       nav-flash
       ophints
       (popup +all +defaults)
       (pretty-code +fira)
       unicode
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       format
       multiple-cursors
       snippets
       word-wrap

       :emacs
       (dired +ranger +icons)
       electric
       (ibuffer +icons)
       vc

       :checkers
       (syntax +childframe)

       :tools
       editorconfig
       (eval +overlay)
       docker
       (lookup +docsets)
       magit
       lsp
       pdf
       upload

       :lang
       agda
       cc
       data
       emacs-lisp
       (go +lsp)
       (haskell +lsp +dante)
       idris
       (kotlin +lsp)
       javascript
       (markdown +pandoc)
       (org +gnuplot +pandoc +present +roam)
       plantuml
       ruby
       rest
       swift
       sh
       web
       lua
       (rust +lsp)

       :config
       (default +bindings +evil-commands +smartparens)

       :private-config
       (personal
        +keybindings
        +mru-workspace)
       chinese

       :private-lang
       org
       rust
       elixir
       elisp
       groovy
       reasonml
       typescript
       cucumber
       kotlin

       :private-tools
       ;; ranger
       ;; wakatime
       git
       hexo
       jira
       vlf
       anywhere
       observatory
       leetcode
       tabnine
       frog-jump-buffer
       ;; pullover

       :private-ui
       ;; neutral-title-bar
       ;; page-break-line

       :private-feature
       evil
       insert-screenshot
       insert-chrome-url)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" default)))
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
