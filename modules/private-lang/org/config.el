;;; private/org/config.el -*- lexical-binding: t; -*-

(when (featurep! +org-projectile)
  (def-package! org-projectile
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
   (:desc "Refile" :n "r" #'org-refile)
   (:desc "Insert element" :prefix "i"
     :desc "Insert drawer" :n "d" #'org-insert-drawer
     (:when (featurep! :private-feature insert-chrome-url)
       :desc "Insert link" :n "l" #'+insert-chrome-url/insert-chrome-current-tab-url-in-org))))

(after! org
  (set-face-attribute 'org-level-1 nil :height 1.1)
  (set-face-attribute 'org-level-2 nil :height 1.0)

  ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ✿ "❀"
  (setq org-bullets-bullet-list '("✸" "✿" "◉" "○" "●" "◇"))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "SHORT-LIST(s)" "NOW(n)" "DONE(D!/!)")
                (sequence "CANCELLED(C@/!)" "BLOCKED(b@/!)" "SOMEDAY(S)"))))
  (setq +org-capture-todo-file "~/orlog/gtd/quick-notes.org"
        +org-capture-notes-file "~/orlog/gtd/quick-notes.org")
  (add-to-list 'org-modules 'habits)
  )

(def-package! org-super-agenda
  :config
  (org-super-agenda-mode)

  (setq org-super-agenda-groups
         '((:name "Now"
                  :todo "NOW")
           (:name "Short List"
                  :todo "SHORT-LIST")
           (:name "Important"
                  :priority "A")
           (:name "Work"
                  :file-path "work")
           (:name "Side project"
                  :file-path "side-project")
           (:name "Personal"
                  :file-path "personal")
           (:name "Learning"
                  :file-path "learning")
           (:name "Quick notes"
                  :file-path "quick-notes")
           (:name "Someday"
                  :todo "SOMEDAY")
           (:name "Blocked"
                  :todo "BLOCKED"))))

(def-package! org-alert
  :config
  (setq alert-default-style 'notifier))
