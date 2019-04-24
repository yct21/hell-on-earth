;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       ;;debugger
       eval
       (evil +everywhere)
       file-templates
       (lookup +docsets)
       snippets
       workspaces

       :completion
       (company +childframe +auto)
       (ivy +childframe)

       :ui
       (popup +all +defaults)
       doom
       doom-dashboard
       modeline
       hl-todo
       nav-flash
       ophints           ; highlight the region an operation acts on
       vi-tilde-fringe
       window-select
       vc-gutter
       unicode
       (pretty-code +fira)

       :emacs
       electric
       (dired +ranger)
       imenu
       vc

       :editor
       ;; format
       rotate-text
       multiple-cursors
       fold

       :tools
       editorconfig
       docker
       magit
       (flycheck +childframe)
       lsp

       :lang
       cc
       data
       elixir
       elm
       emacs-lisp
       ess
       javascript
       (markdown +pandoc)
       (org +habit +attach +babel +capture +export +present)
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
       elisp
       groovy
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

