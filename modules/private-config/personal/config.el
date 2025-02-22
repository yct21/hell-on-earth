;;; private/personal/config.el -*- lexical-binding: t; -*-

(when (featurep! +keybindings) (load! "+keybindings"))
(when (featurep! +mru-workspace) (load! "+mru-workspace"))
(load! "+workarounds")
(load! "+bookmark")
(load! "+menubar")
(load! "+tempscript")

(after! ivy
  (define-key ivy-minibuffer-map (kbd "M-l") #'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "M-h") #'ivy-backward-delete-char)
  (define-key ivy-minibuffer-map (kbd "M-RET") #'ivy-immediate-done))

;; (after! avy
;;   (setq avy-all-windows 'all-frames))

(after! typescript-mode
  (setq typescript-indent-level 2))

(after! json-reformat
  (setq json-reformat:indent-width 2))

(after! js2-mode
  (setq js2-basic-offset 2))

;; I've swapped these keys on my keyboard
(setq x-super-keysym 'alt
      x-alt-keysym   'meta

      user-mail-address "yct21@12tcy.com"
      user-full-name    "Chutian Yang"
      )

;; deft
(after! deft
  (setq deft-directory org-directory)
  (setq deft-recursive t)
  )

;; (pcase (system-name)
;;   ((or "proteus" "halimede")
;;    (setq ivy-height 12
;;          +doom-modeline-height 24
;;          ivy-posframe-font (font-spec :family "Input Mono Narrow" :size 12)
;;          doom-font (font-spec :family "Input Mono Narrow" :size 10)))
;;   (_
;;    (setq ivy-posframe-font (font-spec :family "Input Mono Narrow" :size 18)
;;          doom-font (font-spec :family "Input Mono Narrow" :size 16 :weight 'semi-light))))

(setq doom-big-font (font-spec :family "Fira Mono" :size 19))
(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'semi-light))
;; (setq doom-font (font-spec :family "Source Code Pro" :size 16 :weight 'semi-light))
(setq doom-unicode-font (font-spec :family "Fira Code"))
(setq doom-variable-pitch-font (font-spec :family "Fira Code"))

;; (modify-frame-parameters nil '((inhibit-double-buffering . t)))
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(defvar xdg-data (getenv "XDG_DATA_HOME"))
;; (defvar xdg-bin (getenv "XDG_BIN_HOME"))
;; (defvar xdg-cache (getenv "XDG_CACHE_HOME"))
;; (defvar xdg-config (getenv "XDG_CONFIG_HOME"))

(setq +doom-modeline-buffer-file-name-style 'relative-from-project
      show-trailing-whitespace t

      mu4e-maildir        (expand-file-name "mail" xdg-data)
      mu4e-attachment-dir (expand-file-name "attachments" mu4e-maildir))

(add-hook! minibuffer-setup (setq-local show-trailing-whitespace nil))

(setq standard-indent 2)
(setq-default evil-shift-width 2)

(setq configuration-layer-elpa-archives
      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

;; (setq url-proxy-services
;;    '(("http"     . "10.144.1.10:8080")
;;        ("https"    . "10.144.1.10:8080")))

(after! hide-show
  (setq hs-special-modes-alist
        (append
         '((web-mode "// **" "// End region" "/[*/]" nil nil))
         hs-special-modes-alist)))

(after! projectile
  (setq projectile-enable-caching nil)
  )

(after! tide
  (setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")
  )

(setq +workspaces-main "others")

(setq insert-directory-program "/usr/local/bin/gls")
(setq dired-listing-switches "-aBhl --group-directories-first")

(after! web-mode
  (define-key web-mode-map (kbd "M-k") #'typescript-mode)
  )

(after! typescript-mode
  (define-key typescript-mode-map (kbd "M-k") #'web-mode)
  )

(after! projectile
  (add-to-list 'projectile-globally-ignored-files ".projectile")
  )

(setq mac-command-modifier 'meta)

;;(after! electric (electric-pair-mode))

(setq max-mini-window-height 0.25)

(setq ns-use-proxy-icon nil)

(setq projectile-project-search-path
      '("~/doc"
        "~/doc/peafowl"
        "~/code/hub"
        "~/code/side-projects"
        "~/code/docker"
        "~/code/remote"
        "~/code/scripts"
        "~/code/templates"
        "~/code/nokia"
        "~/code/nokia/pr-analysis"
        "~/code/playgrounds/leetcode-rust"
        "~/code/playgrounds"
        "~/code/slides"
        "~/code/personal"
        "~/code/emacs"
        "~/code/utils"))

;; ;; (define-key global-map [menu-bar file-menu] nil)
;; ;; (define-key global-map [menu-bar buffers] nil)
;; ;; (define-key global-map [menu-bar options] nil)
;; (define-key global-map [menu-bar edit] nil)
;; (define-key global-map [menu-bar help-menu] nil)
;; (define-key global-map [menu-bar projectile-mode-menu] nil)
;; ;; (define-key global-map [menu-bar tools] nil)
;; ;; (define-key global-map [menu-bar outline] nil)
;; ;; (define-key global-map [menu-bar projectile] nil)
;; ;; (define-key global-map [menu-bar help] nil)

;;; lint hint

(setq! link-hint-avy-all-windows t)

(setq doom-theme 'doom-xcode)

(after! magit-todos
  (add-to-list 'magit-todos-keywords-list "todo!")
  )

;;; spell check
(after! ispell
  (setq ispell-local-dictionary "en_AU"))

(setf (alist-get 'markdown-mode +spell-excluded-faces-alist)
      '(markdown-code-face
        markdown-plain-url-face
        markdown-reference-face
        markdown-link-face
        markdown-inline-code-face
        markdown-blockquote-face
        markdown-url-face
        markdown-markup-face
        markdown-html-attr-value-face
        markdown-html-attr-name-face
        markdown-html-tag-name-face))

(setf (alist-get 'org-mode +spell-excluded-faces-alist)
      '(org-block
        (:inherit (org-block))
        org-block-begin-line
        org-block-end-line
        org-code
        org-quote
        org-date
        org-formula
        org-latex-and-related
        org-link
        org-meta-line
        org-property-value
        org-ref-cite-face
        org-special-keyword
        org-tag
        org-todo
        org-todo-keyword-done
        org-todo-keyword-habt
        org-todo-keyword-kill
        org-todo-keyword-outd
        org-todo-keyword-todo
        org-todo-keyword-wait
        org-verbatim))

;;; I hate my work
(add-to-list 'auto-mode-alist '("\\.pkgfile\\'" . sh-mode))

;;; opacity
(modify-frame-parameters nil `((alpha  99)))

(setq insert-directory-program "/Users/yct21/.nix-profile/bin/ls")
