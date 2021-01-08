;;; private-config/personal/+workarounds.el -*- lexical-binding: t; -*-

;; (global-undo-tree-mode)

;; https://github.com/hlissner/doom-emacs/issues/3038
(after! counsel
  (setq counsel-rg-base-command "rg -M 240 --with-filename --no-heading --line-number --color never %s || true"))

;; ;; https://emacs.stackexchange.com/questions/20651/turn-off-mouse-highlighting-in-org-agenda
;; (add-hook 'org-agenda-finalize-hook
;;           (lambda () (remove-text-properties
;;                       (point-min) (point-max) '(mouse-face t))))

(setq mouse-highlight nil)
