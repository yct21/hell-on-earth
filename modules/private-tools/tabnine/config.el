;;; private-tools/tabnine/config.el -*- lexical-binding: t; -*-
;; (use-package! company
;;   :commands company-complete-common company-manual-begin company-grab-line
;;   :after-call evil-insert-state-entry-hook evil-emacs-state-entry-hook
;;   :init
;;   (setq company-minimum-prefix-length 2
;;         company-tooltip-limit 14
;;         company-dabbrev-downcase nil
;;         company-dabbrev-ignore-case nil
;;         company-dabbrev-code-other-buffers t
;;         company-tooltip-align-annotations t
;;         company-require-match 'never
;;         company-global-modes
;;         '(not erc-mode message-mode help-mode gud-mode eshell-mode))
;;   (define-key! company-active-map
;;     "C-k" #'company-abort)
;;   (global-company-mode +1)
;;   )


;; (use-package! company-tabnine
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)

;;   ;; Trigger completion immediately.
;;   (setq company-idle-delay 0.3)
;;   (setq company-minimum-prefix-length 0)

;;   ;; Number the candidates (use M-1, M-2 etc to select completions).
;;   (setq company-show-numbers t)
;;   (add-to-list 'company-backends #'company-tabnine)

;;   (map! :g [C-return] #'newline-and-indent)

;;   ;; (define-key! company-active-map
;;   ;;   "M-j" #'company-select-next
;;   ;;   "M-k" #'company-select-previous
;;   ;;   [C-return]
;;   ;;   [return]    nil
;;   ;;   "TAB"       #'company-complete-selection)
;;   ;; (add-to-list 'company-backends #'company-tabnine)
;;   )

(use-package! company-tabnine
  :after company
  :config
  (setq +lsp-company-backend 'company-capf)
  (setq company-frontends '(company-pseudo-tooltip-frontend))
  (setq company-idle-delay 0
        company-minimum-prefix-length 0
        company-show-numbers t)
  )

  (set-company-backend! 'tide-mode '(company-tide :with company-tabnine :separate))
(after! tide
  )
