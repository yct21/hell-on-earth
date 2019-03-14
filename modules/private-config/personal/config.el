;;; private/personal/config.el -*- lexical-binding: t; -*-

(when (featurep! +keybindings) (load! "+keybindings"))
(when (featurep! +mru-workspace) (load! "+mru-workspace"))

(after! ivy
  (define-key ivy-minibuffer-map (kbd "M-l") #'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "M-h") #'ivy-backward-delete-char)
  (define-key ivy-minibuffer-map (kbd "M-RET") #'ivy-immediate-done))

;; (after! avy
;;   (setq avy-all-windows 'all-frames))

(defun +workspace-list-names-limited ()
  (let* ((names (+workspace-list-names))
         (substracted-names (seq-subseq names 0 (min 5 (length names))))
        (current-name (+workspace-current-name)))
    (mapconcat
     #'identity
     (cl-loop for i to (length substracted-names)
              for name in substracted-names
              collect
              (propertize (format " [%d] %s " (1+ i) name)
                          'face (if (equal current-name name)
                                    '+workspace-tab-selected-face
                                  '+workspace-tab-face)))
     " ")))

(setq-default frame-title-format
              '("欢迎回来，指挥官  |   "
                (:eval (+workspace-list-names-limited))))

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

      org-directory (expand-file-name "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/gtd")
      org-ellipsis " ▼ "

      ;; doom-variable-pitch-font (font-spec :family "Fira Mono")
      ;; doom-unicode-font (font-spec :family "Input Mono Narrow" :size 12)
      doom-big-font (font-spec :family "Fira Mono" :size 19))

;; (pcase (system-name)
;;   ((or "proteus" "halimede")
;;    (setq ivy-height 12
;;          +doom-modeline-height 24
;;          ivy-posframe-font (font-spec :family "Input Mono Narrow" :size 12)
;;          doom-font (font-spec :family "Input Mono Narrow" :size 10)))
;;   (_
;;    (setq ivy-posframe-font (font-spec :family "Input Mono Narrow" :size 18)
;;          doom-font (font-spec :family "Input Mono Narrow" :size 16 :weight 'semi-light))))

(pcase (system-name)
  ((or "proteus" "halimede")
   (setq ivy-posframe-font (font-spec :family "Source Code Pro" :size 16)
         ivy-height 12))
  (_
   (setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'semi-light))))

(modify-frame-parameters nil '((inhibit-double-buffering . t)))
(toggle-frame-maximized)

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

(setq url-proxy-services
   '(("http"     . "10.144.1.10:8080")
       ("https"    . "10.144.1.10:8080")))

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

(setq max-mini-window-height 0.7)

(setq projectile-project-search-path '("~/code/hub" "~/code/side-projects" "~/code/nokia" "~/code/playgrounds"))
