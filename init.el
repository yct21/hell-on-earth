;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       debugger
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
       doom-modeline
       hl-todo
       nav-flash
       evil-goggles
       vi-tilde-fringe
       window-select
       unicode
       vc-gutter
       (pretty-code +fira)

       :emacs
       electric
       dired
       imenu
       vc
       hideshow

       :editor
       rotate-text

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
       markdown
       (org +attach +babel +capture +export +present)
       plantuml
       ruby
       rest
       sh
       web
       lua

       :config
       (default +bindings +snippets +evil-commands)

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

       :private-tools
       ;; ranger
       wakatime
       git
       habitica

       :private-ui
       ;; neutral-title-bar
       ;; page-break-line

       :private-feature
       evil
       insert-chrome-url)

