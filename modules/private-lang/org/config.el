;;; private/org/config.el -*- lexical-binding: t; -*-

(when (featurep! +org-projectile)
  (use-package! org-projectile
    :config
    (org-projectile-per-project)
    (setq org-projectile-per-project-filepath "TODOs.org"))
  (load! "+org-projectile"))

(when (featurep! +org-journal)
  (load! "+org-journal"))

(map!
 (:map org-mode-map
   :localleader
   (:desc "Set priority" :n "p" #'org-priority)
   (:desc "insert link" :n "L" #'+insert-chrome-url/insert-chrome-current-tab-url-in-org)
   (:desc "Refile" :n "r" #'org-refile)))
   ;(:prefix "o"
   ;  (:when (featurep! :private-feature insert-chrome-url)
   ;   :desc "Insert link" :n "l" #'+insert-chrome-url/insert-chrome-current-tab-url-in-org))))

(after! org
  (set-face-attribute 'org-level-1 nil :height 1.1)
  (set-face-attribute 'org-level-2 nil :height 1.0)

  ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ✿ "❀"
  (setq org-bullets-bullet-list '("✸" "✿" "◉" "○" "●" "◇"))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "SHORT-LIST(s)" "NOW(n)" "DONE(D!/!)")
                (sequence "CANCELLED(C@/!)" "BLOCKED(b@/!)" "SOMEDAY(S)"))))
  (setq +org-capture-todo-file (expand-file-name "quick-notes.org" org-directory)
        +org-capture-notes-file (expand-file-name "quick-notes.org" org-directory))
  )

(use-package! org-super-agenda
  :config
  (org-super-agenda-mode)
  ;; (setq org-agenda-files (list (expand-file-name "gtd" org-directory)))
  (setq org-agenda-files (list (expand-file-name "gtd" org-directory)))

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
