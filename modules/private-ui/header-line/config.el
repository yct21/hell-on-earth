;;; private-ui/header-line/config.el -*- lexical-binding: t; -*-

;; (use-package! common-header-mode-line
;;   :init
;;   (add-hook! 'window-setup-hook #'hoe/init-header-line)
;;   ;; (setq per-frame-header-line-display-type nil)
;;   ;; (set-face-attribute 'header-line nil  :height 140)
;;   (add-hook! 'org-pomodoro-started-hook
;;     (delete 'org-pomodoro-mode-line global-mode-string)
;;     )
;;   )

;; (defun hoe/init-header-line ()
;;   (setq org-clock-clocked-in-display nil)

;; (let ((def-height (face-attribute 'default :height)))
;;     (set-face-attribute
;;      'per-frame-header-line-face nil
;;      :height (ceiling (max 1 (* 0.90 def-height)))))

;;   (setq common-header-mode-line-update-delay 0)

;;   (setq per-frame-header-line-update-display-function
;;         #'(lambda (display)
;; ;;             (let ((buf (cdr (assq 'buf display))))
;; ;;               (with-current-buffer buf
;; ;;                 (setq-local buffer-read-only nil)
;; ;;                 (erase-buffer)
;; ;;                 (let*
;; ;;                     ((mode-l-str
;; ;;                       (format-mode-line hoe/header-line-format)))
;; ;;                   (insert mode-l-str))
;; ;;                 (setq-local header-line-format nil)
;; ;;                 (goto-char (point-min))
;; ;;                 (setq-local buffer-read-only t)))
;; ;;             ))
;; ;;   )

(defun +workspace-list-names-limited ()
  (let* ((names (+workspace-list-names))
         (substracted-names (seq-subseq names 0 (min 5 (length names))))
         (current-name (+workspace-current-name)))
    (propertize
     (mapconcat
      #'identity
      (cl-loop for i to (length substracted-names)
               for name in substracted-names
               collect
               (format "[%d] %s " (1+ i) name)
               )
      " ")
     ;; 'face 'mode-line
     )
    ))

(setq-default frame-title-format
              '(
                ;; (:eval (hoe/header-line-left))
                "Visual Studio Code   |   "
                (:eval (+workspace-list-names-limited))
                 "                      "
                ))

(defun hoe/header-pomo ()
  (if (boundp 'org-pomodoro-state)
    (if (eq org-pomodoro-state :pomodoro)
      '(" |  " org-pomodoro-mode-line " " org-clock-heading)
      (if (eq org-pomodoro-state :none)
        '(" ")
        '(" |  " org-pomodoro-mode-line "break")))
    ""
    ))

;; (defun hoe/header-line-right ()
;;   (+workspace-list-names-limited)
;;   )

;; (setq-default hoe/header-line-format
;;               '(" ✎ "
;;                 (:eval (hoe/header-line-left))
;;                 ;; (:eval
;;                 ;;  (mode-line-fill-right 'mode-line
;;                 ;;                        (reserve-middle/right)))
;;                 (:eval (hoe/header-line-right))
;;                 ;; org-pomodoro-mode-line
;;                 ;; (org-clock-get-clock-string)
;;                 ))
