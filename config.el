;;; private/hlissner/config.el -*- lexical-binding: t; -*-

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
        (cl-loop for dir in (directory-files "~/code" t "^[^.]" t)
                 if (file-directory-p dir)
                 nconc (cl-loop for subdir in (directory-files dir t "^[^.]" t)
                                if (and (file-directory-p subdir)
                                        (file-directory-p (expand-file-name ".git/" subdir)))
                                collect subdir))))

;; lang/org
(add-hook 'org-mode-hook #'auto-fill-mode)
;; The standard unicode characters are usually misaligned depending on the font.
;; This bugs me. Personally, markdown #-marks for headlines are more elegant.

;;; load private settings

;;; make title bar autoloaded
(ns-auto-titlebar-mode)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq doom-theme 'doom-dark+)

(setq default-frame-alist
      (append default-frame-alist '((inhibit-double-buffering . t))))
