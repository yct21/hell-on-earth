;;; private/org/config.el -*- lexical-binding: t; -*-

(setq hoe/peregrine "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/peregrine")

(after! org
  ;; (set-face-attribute 'org-level-1 nil :height 1.1)
  ;; (set-face-attribute 'org-level-2 nil :height 1.0)

  ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ✿ "❀"
  ;; (setq org-bullets-bullet-list '("✸" "✿" "◉" "○" "●" "◇"))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "SHORT-LIST(s)" "NOW(n)" "DONE(D!/!)" "OB(r)")
                (sequence "CANCELLED(C@/!)" "BLOCKED(b@/!)" "SOMEDAY(S)"))))
  (setq +org-capture-todo-file (expand-file-name "quick-notes.org" hoe/peregrine)
        +org-capture-notes-file (expand-file-name "quick-notes.org" hoe/peregrine)
        org-agenda-prefix-format '((agenda . "%s %t")
                                   (todo . "%s")
                                   (tags . " %i %-12:c")
                                   (search . " %i %-12:c"))
        ))

(after! org-superstar
  (setq org-superstar-prettify-item-bullets t
        org-superstar-special-todo-items t
        org-superstar-todo-bullet-alist
        '(("TODO" . 9744)
          ("[ ]"  . 9744)
          ("NOW" . 9744)
          ("SHORT-LIST" . 9744)
          ("DONE" . 9745)
          ("[X]"  . 9745))
        ))

(use-package! org-super-agenda
  :config
  (org-super-agenda-mode)
  ;; (setq org-agenda-files (list (expand-file-name "gtd" org-directory)))
  (setq org-agenda-files (list hoe/peregrine))

  (setq org-super-agenda-groups
        '((:name "Now"
           :todo "NOW")
          (:name "Short List"
           :todo "SHORT-LIST")
          (:name "Important"
           :priority "A")
          (:priority "C"
           :name "Rear"
           :order 8)
          (:name "Quick notes"
           :file-path "quick-notes")
          (:name "Work"
           :tag "work")
          (:name "Study"
           :tag "study")
          (:name "Side project"
           :tag "side_project")
          (:name "Utilities"
           :tag "utility")
          (:name "Personal"
           :tag "personal")
          (:name "Someday"
           :todo "SOMEDAY")
          (:name "Blocked"
           :todo "BLOCKED")
          (:log t)  ; Automatically named "Log"
          )))

(use-package! org-alert
  :config
  (setq alert-default-style 'notifier))

(setq +org-babel-mode-alist
      '((cpp . C)
        (C++ . C)
        (D . C)
        (rust . rustic)
        (sh . shell)
        (bash . shell)
        (matlab . octave)
        (amm . ammonite)))

;;; org-roam
(defun my-org-protocol-focus-advice (orig &rest args)
  (x-focus-frame nil)
  (apply orig args))

(after! org-roam
  (setq org-roam-directory "~/doc/observatory")
  (setq org-roam-graph-viewer "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
  (setq +org-roam-open-buffer-on-find-file nil)
  (add-hook! 'org-roam-mode-hook #'flymake-mode)
  (set-company-backend! 'org-mode '(company-tabnine company-yasnippet company-dabbrev))
  (advice-add 'org-roam-protocol-open-ref :around
              #'my-org-protocol-focus-advice)
  (advice-add 'org-roam-protocol-open-file :around
              #'my-org-protocol-focus-advice)

  (setq org-roam-capture-templates '(("d" "default" plain #'org-roam-capture--get-point "%?" :file-name "%<%Y%m%d%H%M%S>-${slug}" :head "#+TITLE: ${title}\n#+TODO: TODO\n#+ROAM_TAGS:" :unnarrowed t))
        )
  )

;;; org-journal
(use-package! org-journal
  :init
  (map! :leader :n "oj" #'org-journal-new-entry)
  :config
  (setq org-journal-dir "~/doc/stf")
  (setq org-journal-file-format "%Y%m%d.stf")
  (setq org-journal-find-file (lambda (filename)
                                (let ((buffer (find-file-noselect filename)))
                                  (display-buffer buffer)
                                  (org-journal-mode)
                                  )
                                ))
  (setq org-journal-carryover-items "")
  )

(set-popup-rule!
  ".*\\.stf$"
  :select t
  :modeline t
  :autosave t
  )

(use-package! org-roam-server
  :config
  (setq org-roam-server-port 2020)
  )
