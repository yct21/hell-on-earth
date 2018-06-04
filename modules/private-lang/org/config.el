;;; private/org/config.el -*- lexical-binding: t; -*-

(when (featurep! +org-projectile)
  (def-package! org-projectile
    :config
    (org-projectile-per-project)
    (setq org-projectile-per-project-filepath "TODOs.org"))
  (load! +org-projectile))

(when (featurep! +org-journal)
  (load! +org-journal))

(map!
 (:map org-mode-map
   :localleader
   (:desc "Insert element" :prefix "i"
     :desc "Insert drawer" :n "d" #'org-insert-drawer
     (:when (featurep! :private-feature insert-chrome-url)
       :desc "Insert link" :n "l" #'+insert-chrome-url/insert-chrome-current-tab-url-in-org)
     )
   ))

(after! org
  (set-face-attribute 'org-level-1 nil :height 1.1)
  (set-face-attribute 'org-level-2 nil :height 1.0)
  (setq org-bullets-bullet-list '("✸" "✿" "◉" "○" "●" "◇")))

    ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ✿ "❀"
