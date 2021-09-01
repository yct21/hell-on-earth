;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       (ivy +prescient +icons +childframe)

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       hydra
       modeline
       ;; nav-flash
       ophints
       (popup +defaults)
       (ligatures +fira)
       treemacs
       ;; unicode
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
       (dired +icons)
       electric
       (ibuffer +icons)
       vc
       (undo +tree)

       :checkers
       syntax
       (spell +aspell)

       :tools
       editorconfig
       eval
       docker
       (debugger +lsp)
       (lookup +docsets)
       magit
       (lsp +peek)
       taskrunner
       upload

       :lang
       agda
       (cc +lsp)
       (csharp +lsp)
       data
       emacs-lisp
       (go +lsp)
       (haskell +lsp)
       idris
       (kotlin +lsp)
       (javascript +lsp)
       (markdown +pandoc)
       nix
       (org +gnuplot +pandoc +present +pretty +dragndrop)
       plantuml
       ruby
       rest
       scala
       swift
       sh
       solidity
       web
       lua
       (rust +lsp)
       (yaml +lsp)

       :config
       (default +bindings +evil-commands +smartparens)

       :os
       macos

       :private-config
       (personal
        +keybindings
        +mru-workspace)
       chinese
       startup
       disable-mouse

       :private-lang
       cc
       (org +observatory)
       haskell
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
       lsp
       tabnine
       ;; pullover

       :private-ui
       ;; neutral-title-bar
       ;; page-break-line
       ;; mini-modeline
       header-line

       :private-feature
       evil
       org-roam
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
