;;; init.el -*- lexical-binding: t; -*-

(setq standard-indent 2)
(setq-default evil-shift-width 2)

(setq configuration-layer-elpa-archives
        '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "http://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

;;(setq url-proxy-services
;;    '(("http"     . "10.144.1.10:8080")
;;        ("https"    . "10.144.1.10:8080")))

(map-put default-frame-alist 'inhibit-double-buffering t)
(toggle-frame-maximized)

;; I've swapped these keys on my keyboard
(setq x-super-keysym 'alt
      x-alt-keysym   'meta

      user-mail-address "yct21@12tcy.com"
      user-full-name    "Chutian Yang"

      +org-dir (expand-file-name "~/orlog/")
      org-ellipsis " ▼ "

      ;; doom-variable-pitch-font (font-spec :family "Fira Sans")
      ;; doom-unicode-font (font-spec :family "Input Mono Narrow" :size 12)
      doom-big-font (font-spec :family "Fira Mono" :size 19))


(pcase (system-name)
  ((or "proteus" "halimede")
   (setq ivy-posframe-font (font-spec :family "Source Code Pro" :size 16)
         ivy-height 12))
  (_
   (setq doom-font (font-spec :family "Source Code Pro" :size 16 :weight 'semi-light))))

;;
(doom! :feature
       debugger
       eval
       (evil +everywhere)
       file-template
       (lookup +devdocs +docsets)
       snippets
       spellcheck
       (syntax-checker +childframe)
       version-control
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

       :tools
       editorconfig
       electric-indent
       magit
       rotate-text

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
       ranger

       :private-ui
       neutral-title-bar
       ;; page-break-line

       :private-feature
       evil
       insert-chrome-url
       )

