;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       ;;debugger
       eval
       (evil +everywhere)
       file-templates
       (lookup +devdocs +docsets)
       snippets
       spellcheck
       (syntax-checker +childframe)
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
       sh
       web
       lua
       rust

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

