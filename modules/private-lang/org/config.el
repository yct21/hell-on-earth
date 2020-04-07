;;; private/org/config.el -*- lexical-binding: t; -*-

(setq hoe/peregrine "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/peregrine/gtd")

(after! org
  (set-face-attribute 'org-level-1 nil :height 1.1)
  (set-face-attribute 'org-level-2 nil :height 1.0)

  ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ✿ "❀"
  (setq org-bullets-bullet-list '("✸" "✿" "◉" "○" "●" "◇"))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "SHORT-LIST(s)" "NOW(n)" "DONE(D!/!)" "OB(r)")
                (sequence "CANCELLED(C@/!)" "BLOCKED(b@/!)" "SOMEDAY(S)"))))
  (setq +org-capture-todo-file (expand-file-name "quick-notes.org" hoe/peregrine)
        +org-capture-notes-file (expand-file-name "quick-notes.org" hoe/peregrine)))

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
          (:name "Quick notes"
                 :file-path "quick-notes")
          (:name "Important"
                 :priority "A")
          (:name "Someday"
                 :todo "SOMEDAY")
          (:name "Blocked"
                 :todo "BLOCKED")
          (:name "Work"
                 :file-path "work")
          (:name "Side project"
                 :file-path "side-project")
          (:name "Personal"
                 :file-path "personal")
          (:name "Utilities"
                 :file-path "utilities")
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
  (setq org-roam-directory "~/observatory")
  (setq org-roam-graph-viewer "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")

  (advice-add 'org-roam-protocol-open-ref :around
              #'my-org-protocol-focus-advice)
  (advice-add 'org-roam-protocol-open-file :around
              #'my-org-protocol-focus-advice)
  )

;;; org-journal
(use-package! org-journal
  :init
  (map! :leader :n "oj" #'org-journal-new-entry)
  :config
  (setq org-journal-dir "~/.stf")
  (setq org-journal-file-format "%Y%m%d.stf")
  (setq org-journal-find-file (lambda (filename)
                                (let ((buffer (find-file-noselect filename)))
                                  (display-buffer buffer)
                                  (org-journal-mode)
                                  )
                                ))
  (setq org-journal-carryover-items ""))

(set-popup-rule!
  ".*\\.stf$"
  :select t
  :modeline t
  :autosave t
  )
