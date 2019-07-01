;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (company +childframe +auto)
       (ivy +childframe)

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       modeline
       nav-flash
       ophints           ; highlight the region an operation acts on
       (popup +all +defaults)
       (pretty-code +fira)
       vc-gutter
       vi-tilde-fringe
       window-select
       unicode
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       format
       snippets
       rotate-text

       :emacs
       (dired +ranger +icons)
       electric
       vc

       :tools
       eval
       editorconfig
       docker
       (flycheck +childframe)
       (lookup +docsets)
       magit
       lsp

       :lang
       cc
       data
       elm
       emacs-lisp
       ess
       go
       javascript
       (markdown +pandoc)
       (org +gnuplot +pandoc +present)
       plantuml
       ruby
       rest
       swift
       rest
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
       (org
        +org-projectile
        +org-journal)
       rust
       elixir
       elisp
       groovy
       reasonml
       typescript
       cucumber

       :private-tools
       ;; ranger
       wakatime
       git
       hexo
       jira
       vlf

       :private-ui
       ;; neutral-title-bar
       ;; page-break-line

       :private-feature
       evil
       insert-screenshot
       insert-chrome-url)

