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
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq default-frame-alist
      (append default-frame-alist '((inhibit-double-buffering . t))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
    '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" default))
 '(safe-local-variable-values
    '((org-roam-directory . "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/peregrine")))
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
