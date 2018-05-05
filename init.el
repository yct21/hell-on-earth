;;; init.el -*- lexical-binding: t; -*-

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

      user-mail-address "henrik@lissner.net"
      user-full-name    "Henrik Lissner"

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
       (popup                 ; tame sudden yet inevitable temporary windows
        +all                  ; catch all popups that start with an asterix
        +defaults)            ; default popup rules
       eval                   ; run code, run (also, repls)
       (evil +everywhere)     ; come to the dark side, we have cookies
       file-templates         ; auto-snippets for empty files
       (lookup                ; helps you navigate your code and documentation
        +devdocs              ; ...on devdocs.io online
        +docsets)             ; ...or in Dash docsets locally
       snippets               ; my elves. They type so I don't have to
       spellcheck             ; tasing you for misspelling mispelling
       syntax-checker         ; tasing you for every semicolon you forget
       version-control        ; remember, remember that commit in November
       workspaces             ; tab emulation, persistence & separate workspaces

       :completion
       company                          ; the ultimate code completion backend
       ivy                              ; a search engine for love and life

       :ui
       doom                   ; what makes DOOM look the way it does
       doom-dashboard         ; a nifty splash screen for Emacs
       doom-modeline          ; a snazzy Atom-inspired mode-line
       hl-todo                ; highlight TODO/FIXME/NOTE tags
       nav-flash              ; blink the current line after jumping
       evil-goggles           ; display visual hints when editing in evil
       vi-tilde-fringe        ; fringe tildes to mark beyond EOB
       window-select          ; visually switch windows
       posframe               ; use child frames where possible (Emacs 26+ only)

       :tools
       electric-indent           ; smarter, keyword-based electric-indent
       eshell                    ; a consistent, cross-platform shell (WIP)
       imenu                     ; an imenu sidebar and searchable code index
                                        ;macos             ; MacOS-specific commands
       magit                            ;
       make                             ; run make tasks from Emacs
       rotate-text               ; cycle region at point between text candidates

       :lang
                                        ;assembly          ; assembly for fun or debugging
       cc                               ; C/C++/Obj-C madness
       data                             ; config/data formats
       elixir                           ; erlang done right
       elm                              ; care for a cup of TEA?
       emacs-lisp                       ; drown in parentheses
       ess                              ; emacs speaks statistics
       (haskell +intero)                ; a language that's lazier than I am
       javascript             ; all(hope(abandon(ye(who(enter(here))))))
                                        ;ledger            ; an accounting system in Emacs
       lua                              ; one-based indices? one-based indices
       markdown                         ; writing docs for people to ignore
       ocaml                            ; an objective camel
       (org                             ; organize your plain life in plain text
        +attach                         ; custom attachment system
        +babel                          ; running code in org
        +capture                        ; org-capture in and outside of Emacs
        +export                         ; Exporting org to whatever you want
        +present                        ; Emacs for presentations
        +publish                        ; Emacs+Org as a static site generator
        )
       php            ; make php less awful to work with
       plantuml       ; diagrams for confusing people more
       python         ; beautiful is better than ugly
       rest           ; Emacs as a REST client
       ruby           ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       sh             ; she sells (ba|z)sh shells on the C xor
       typescript     ; javascript, but better
       web            ; the tubes


       :config
       (default +bindings +snippets +evil-commands)

       :private-config
       (personal +keybindings)
       chinese

       :private-lang
       (org
        +org-projectile
        +org-journal)
       elisp

       :private-tools
       ranger)

