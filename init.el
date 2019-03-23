;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       ;;debugger
       eval
       (evil +everywhere)
       file-templates
       (lookup +devdocs +docsets)
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
       evil-goggles
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
       (org +attach +babel +capture +export +present)
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

       :private-ui
       ;; neutral-title-bar
       ;; page-break-line

       :private-feature
       evil
       insert-screenshot
       insert-chrome-url)

