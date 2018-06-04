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
              '("欢迎回来，指挥官   |   "
                (:eval (+workspace-list-names-limited))))

(after! typescript-mode
  (setq typescript-indent-level 2))

(after! json-reformat
  (setq json-reformat:indent-width 2))

(after! js2-mode
  (setq js2-basic-offset 2))
