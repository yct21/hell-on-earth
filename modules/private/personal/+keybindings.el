;;; private/personal/+keybindings.el -*- lexical-binding: t; -*-

;; General keybindings that modifies doom default bindings

(map!
 ;; show workspace
 :ne "M-`" #'+workspace/display

 ;; evil commands
 ;; TODO: Put it into another module
 :ne "M-d" #'evil-scroll-down
 :ne "M-u" #'evil-scroll-up
 :ne "M-o" #'evil-jump-backward
 :nv "t" #'avy-goto-char
 :nv "T" #'avy-goto-line

 ;; -------<leader>-------
 (:leader
   (:desc "Previous buffer" :n "TAB" #'previous-buffer)
   (:desc "Switch workspace buffer" :n "SPC" #'+ivy/switch-workspace-buffer)

   (:desc "workspace" :prefix "l"
     :desc "New workspace" :n "n" #'+workspace/new
     :desc "Save workspace to file" :n "s" #'+workspace/save
     :desc "Autosave current session" :n "S" #'+workspace/save-session
     :desc "Switch workspace" :n "l" #'+workspace/switch-to
     :desc "Kill all buffers" :n "x" #'doom/kill-all-buffers
     :desc "Delete session" :n "X" #'+workspace/kill-session
     :desc "Delete this workspace" :n "d" #'+workspace/delete
     :desc "Load session" :n "L" #'+workspace/load-session
     :desc "Rename workspace" :n "r" #'+workspace/rename
     :desc "Next workspace" :n "]" #'+workspace/switch-right
     :desc "Previous workspace" :n "[" #'+workspace/switch-left)

   (:desc "buffers" :prefix "b"
     :desc "Kill buffer" :n "d" #'kill-this-buffer
     :desc "Kill other buffers" :n "D" #'doom/kill-other-buffers
     :desc "Scratch buffer" :n "s" #'doom/open-scratch-buffer
     :desc "Message buffer" :n "m" (lambda! (switch-to-buffer "*Messages*")))

   (:desc "file" :prefix "f"
     :desc "Find file" :n "f" #'find-file
     :desc "Sudo find file" :n "F" #'doom/sudo-find-file
     :desc "Find file from here" :n "?" #'counsel-file-jump
     :desc "Find other file" :n "a" #'projectile-find-other-file
     :desc "Open project editorconfig" :n "c" #'editorconfig-find-current-editorconfig
     :desc "Find directory" :n "d" #'dired
     :desc "Save file" :n "s" #'save-buffer
     :desc "Find file in emacs.d" :n "e" #'+default/find-in-emacsd
     :desc "Browse emacs.d" :n "E" #'+default/browse-emacsd
     :desc "Recent files" :n "r" #'recentf-open-files
     :desc "Recent project files" :n "R" #'projectile-recentf
     :desc "Yank filename" :n "y" #'+default/yank-buffer-filename
     :desc "Find file in private config" :n "p" #'+default/find-in-config
     :desc "Browse private config" :n "P" #'+default/browse-config)

   (:desc "git" :prefix "g"
     :desc "Magit blame" :n "b" #'magit-blame
     :desc "Magit commit" :n "c" #'magit-commit
     :desc "Magit clone" :n "C" #'magit-clone
     :desc "Magit dispatch" :n "d" #'magit-dispatch-popup
     :desc "Magit find-file" :n "f" #'magit-find-file
     :desc "Magit status" :n "s" #'magit-status
     :desc "List gists" :n "G" #'+gist:list
     :desc "Initialize repo" :n "i" #'magit-init
     :desc "Magit buffer log" :n "l" #'magit-log-buffer-file
     :desc "List repositories" :n "L" #'magit-list-repositories
     :desc "Magit push popup" :n "p" #'magit-push-popup
     :desc "Magit pull popup" :n "P" #'magit-pull-popup
     :desc "Git revert hunk" :n "r" #'git-gutter:revert-hunk
     :desc "Git revert file" :n "R" #'vc-revert
     :desc "Git time machine" :n "t" #'git-timemachine-toggle
     :desc "Git stage hunk" :n "U" #'magit-unstage-file
     :desc "Next hunk" :nv "]" #'git-gutter:next-hunk
     :desc "Previous hunk" :nv "[" #'git-gutter:previous-hunk)

   (:desc "project" :prefix "p"
     :desc "Browse project" :n "." #'+default/browse-project
     :desc "Find file in project" :n "f" #'projectile-find-file
     :desc "Run cmd in project root" :nv "!" #'projectile-run-shell-command-in-root
     :desc "Compile project" :n "c" #'projectile-compile-project
     (:when (featurep! :private org +org-projectile)
       :desc "Goto todo" :n "o" #'+org/projectile-goto-todo)
     :desc "Switch project" :n "p" #'projectile-switch-project
     :desc "Recent project files" :n "r" #'projectile-recentf
     :desc "List project tasks" :n "t" #'+ivy/tasks
     :desc "Invalidate cache" :n "I" #'projectile-invalidate-cache)))
