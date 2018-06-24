;;; private/hlissner/config.el -*- lexical-binding: t; -*-

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

(modify-frame-parameters nil '((inhibit-double-buffering . t)))
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
   (setq doom-font (font-spec :family "Source Code Pro" :size 16 :weight 'semi-light))))

;;


;;
;; Keybindings
;;

(map!
 (:leader
   (:prefix "f"
     :desc "Find file in dotfiles" :n "t" #'+hlissner/find-in-dotfiles
     :desc "Browse dotfiles"       :n "T" #'+hlissner/browse-dotfiles)))


;;
;; Modules
;;

;; feature/evil
(after! evil-mc
  ;; Make evil-mc resume its cursors when I switch to insert mode
  (add-hook! 'evil-mc-before-cursors-created
    (add-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors nil t))
  (add-hook! 'evil-mc-after-cursors-deleted
    (remove-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors t)))

;; completion/helm
(after! helm
  ;; Hide header lines in helm. I don't like them
  (set-face-attribute 'helm-source-header nil :height 0.1))

;; tools/magit
(after! magit
  (setq magit-repository-directories
        (cl-loop for dir in (directory-files "~/work" t "^[^.]" t)
                 if (file-directory-p dir)
                 nconc (cl-loop for subdir in (directory-files dir t "^[^.]" t)
                                if (and (file-directory-p subdir)
                                        (file-directory-p (expand-file-name ".git/" subdir)))
                                collect subdir))))

;; lang/org
(add-hook 'org-mode-hook #'auto-fill-mode)
;; The standard unicode characters are usually misaligned depending on the font.
;; This bugs me. Personally, markdown #-marks for headlines are more elegant.

