;;; private/personal/+keybindings.el -*- lexical-binding: t; -*-

(map!
 ;; mac bindings
  "M-z" #'undo
  "M-c" #'evil-yank
  "M-v" #'yank
  "M-w" #'delete-window
  "M-s" #'save-buffer
  "M-e" #'+eval:repl
  "M-f" #'+format/buffer

  :i [tab] (general-predicate-dispatch nil ; fall back to nearest keymap
            (and (featurep! :editor snippets)
                (bound-and-true-p yas-minor-mode)
                (yas-maybe-expand-abbrev-key-filter 'yas-expand))
            'yas-expand
            (and (featurep! :completion company +tng)
                (+company-has-completion-p))
            '+company/complete)
  :n [tab] (general-predicate-dispatch nil
            (and (featurep! :editor fold)
                (save-excursion (end-of-line) (invisible-p (point))))
            '+fold/toggle
            (fboundp 'evil-jump-item)
            'evil-jump-item)
  :v [tab] (general-predicate-dispatch nil
            (and (bound-and-true-p yas-minor-mode)
                (or (eq evil-visual-selection 'line)
                    (not (memq (char-after) (list ?\( ?\[ ?\{ ?\} ?\] ?\))))))
            'yas-insert-snippet
            (fboundp 'evil-jump-item)
            'evil-jump-item)

 ;; company
 :ni "M-i" #'+company/complete
 ;; :ni "C-j" #'newline-and-indent
 :ni "C-j" (lambda! (newline)
                     (newline)
                     (indent-according-to-mode)
                     (forward-line -1)
                     (indent-according-to-mode))

 ;; workspace
 :n "M-1" (lambda! (persp-switch "peregrine"))

 ;; evil commands
 ;; TODO: Put it into another module
 :nve "M-d" #'evil-scroll-down
 :nve "M-u" #'evil-scroll-up
 :ne "M-o" #'evil-jump-backward

 ;; org gtd
 :ne "C-`" (lambda! (org-agenda nil "t"))
 :ne "M-`" (lambda! (org-capture nil "t"))

 (:map org-agenda-mode-map
   "j" #'evil-next-line
   "k" #'evil-previous-line
   "M-d" #'evil-scroll-down
   "M-u" #'evil-scroll-up )

 (:map evil-window-map
   "M-d" #'evil-scroll-down
   "M-u" #'evil-scroll-up
   "d" #'+workspace/close-window-or-workspace
   "D" #'ace-delete-window
   "S" #'+evil-window-split-a
   "s" #'+evil-window-vsplit-a)

 ;; ivy
 (:after ivy
   :map ivy-minibuffer-map
   [escape] #'keyboard-escape-quit
   [tab] #'ivy-call-and-recenter
   "M-z" #'undo
   "M-v" #'yank
   "C-v" #'yank
   "C-r" #'evil-paste-from-register
   "M-k" #'ivy-previous-line
   "M-j" #'ivy-next-line
   "M-u" #'ivy-scroll-down-command
   "M-d" #'ivy-scroll-up-command
   "C-l" #'ivy-alt-done
   "C-u" #'ivy-kill-line
   "C-b" #'backward-word
   "C-f" #'forward-word)

 (:after avy
   :nv "f" #'avy-goto-char
   :nv "F" #'avy-goto-line))

;; evil-surround
(map!
 :v "s" #'evil-surround-region
 :o "s" #'evil-surround-edit
 :o "S" #'evil-Surround-edit)

;;; :completion
(map! (:when (featurep! :completion company)
        :i "C-@"      #'+company/complete
        :i "C-SPC"    #'+company/complete
        (:after company
          (:map company-active-map
            "C-w"     nil  ; don't interfere with `evil-delete-backward-word'
            "C-n"     #'company-select-next
            "C-p"     #'company-select-previous
            "C-j"     #'company-select-next
            "C-k"     #'company-select-previous
            "C-h"     #'company-show-doc-buffer
            "C-u"     #'company-previous-page
            "C-d"     #'company-next-page
            "C-s"     #'company-filter-candidates
            "C-S-s"   (cond ((featurep! :completion helm) #'helm-company)
                            ((featurep! :completion ivy)  #'counsel-company))
            "C-SPC"   #'company-complete-common
            "TAB"     #'company-complete-common-or-cycle
            [tab]     #'company-complete-common-or-cycle
            [backtab] #'company-select-previous
            [f1]      nil)
          (:map company-search-map  ; applies to `company-filter-map' too
            "C-n"     #'company-select-next-or-abort
            "C-p"     #'company-select-previous-or-abort
            "C-j"     #'company-select-next-or-abort
            "C-k"     #'company-select-previous-or-abort
            "C-s"     (λ! (company-search-abort) (company-filter-candidates))
            [escape]  #'company-search-abort))
        ;; TAB auto-completion in term buffers
        (:after comint :map comint-mode-map
          "TAB" #'company-complete
          [tab] #'company-complete))

      (:when (featurep! :completion ivy)
        (:after ivy
          :map ivy-minibuffer-map
          "C-SPC" #'ivy-call-and-recenter  ; preview file
          "C-l"   #'ivy-alt-done
          "C-v"   #'yank)
        (:after counsel
          :map counsel-ag-map
          "C-SPC"    #'ivy-call-and-recenter ; preview
          "C-l"      #'ivy-done
          [C-return] #'+ivy/git-grep-other-window-action))

      (:when (featurep! :completion helm)
        (:after helm :map helm-map
          [left]     #'left-char
          [right]    #'right-char
          "C-S-f"    #'helm-previous-page
          "C-S-n"    #'helm-next-source
          "C-S-p"    #'helm-previous-source
          "C-S-j"    #'helm-next-source
          "C-S-k"    #'helm-previous-source
          "C-j"      #'helm-next-line
          "C-k"      #'helm-previous-line
          "C-u"      #'helm-delete-minibuffer-contents
          "C-s"      #'helm-minibuffer-history
          ;; Swap TAB and C-z
          "TAB"      #'helm-execute-persistent-action
          [tab]      #'helm-execute-persistent-action
          "C-z"      #'helm-select-action)
        (:after helm-ag :map helm-ag-map
          "C--"      #'+helm-do-ag-decrease-context
          "C-="      #'+helm-do-ag-increase-context
          [left]     nil
          [right]    nil)
        (:after helm-files :map (helm-find-files-map helm-read-file-map)
          [C-return] #'helm-ff-run-switch-other-window
          "C-w"      #'helm-find-files-up-one-level)
        (:after helm-locate :map helm-generic-files-map
          [C-return] #'helm-ff-run-switch-other-window)
        (:after helm-buffers :map helm-buffer-map
          [C-return] #'helm-buffer-switch-other-window)
        (:after helm-occur :map helm-occur-map
          [C-return] #'helm-occur-run-goto-line-ow)
        (:after helm-grep :map helm-grep-map
          [C-return] #'helm-grep-run-other-window-action)))

;;; :ui
(map! (:when (featurep! :ui popup)
        :n "C-~"   #'+popup/toggle)

      (:when (featurep! :ui workspaces)
        :n "C-t"   #'+workspace/new
        :g "M-1"   (lambda! (persp-switch "peregrine"))
        :g "M-2"   #'+workspace/switch-to-1
        :g "M-3"   #'+workspace/switch-to-2
        :g "M-4"   #'+workspace/switch-to-3
        :g "M-5"   #'+workspace/switch-to-4
        :g "M-6"   #'+workspace/switch-to-5
        :g "M-7"   #'+workspace/switch-to-6
        :g "M-8"   #'+workspace/switch-to-7
        :g "M-9"   #'+workspace/switch-to-8
        :g "M-0"   (lambda! (persp-switch "others"))))

;;; :editor
(map! (:when (featurep! :editor format)
        :n "gQ" #'+format:region)

      (:when (featurep! :editor rotate-text)
        :n "!"  #'rotate-text)

      (:when (featurep! :editor multiple-cursors)
        ;; evil-multiedit
        :v  "R"     #'evil-multiedit-match-all
        :n  "M-n"   #'evil-multiedit-match-symbol-and-next
        :n  "M-N"   #'evil-multiedit-match-symbol-and-prev
        :v  "M-n"   #'evil-multiedit-match-and-next
        :v  "M-N"   #'evil-multiedit-match-and-prev
        :nv "C-M-n" #'evil-multiedit-restore
        (:after evil-multiedit
          (:map evil-multiedit-state-map
            "M-n"    #'evil-multiedit-match-and-next
            "M-N"    #'evil-multiedit-match-and-prev
            "RET"    #'evil-multiedit-toggle-or-restrict-region
            [return] #'evil-multiedit-toggle-or-restrict-region)))

      (:when (featurep! :editor snippets)
        ;; auto-yasnippet
        :i  [C-tab] #'aya-expand
        :nv [C-tab] #'aya-create))

;;; :tools
(when (featurep! :tools eval)
  (map! "M-r" #'+eval/buffer))


;;
;;; <leader>

(map! :leader
      (:desc "Other buffer" :n [tab] #'projectile-project-buffers-other-buffer)
      (:desc "Switch workspace buffer" :n "SPC" #'+ivy/switch-workspace-buffer)

      :desc "Eval expression"       ";"    #'pp-eval-expression
      :desc "M-x"                   ":"    #'execute-extended-command
      :desc "Pop up scratch buffer" "x"    #'doom/open-scratch-buffer
      :desc "Org Capture"           "X"    #'org-capture

      ;; C-u is used by evil
      :desc "Universal argument"    "u"    #'universal-argument
      :desc "window"                "w"    evil-window-map
      :desc "help"                  "h"    help-map

      (:when (featurep! :ui popup)
        :desc "Toggle last popup"     "~"    #'+popup/toggle)

      :desc "Resume last search"    "'"
      (cond ((featurep! :completion ivy)   #'ivy-resume)
            ((featurep! :completion helm)  #'helm-resume))

      :desc "Search for symbol in project" "/" #'+default/search-project-for-symbol-at-point

      :desc "Find file in project"  "SPC"  #'projectile-find-file
      :desc "Jump to bookmark"      "RET"  #'bookmark-jump

      ;;; <leader> TAB --- workspace
      (:when (featurep! :ui workspaces)
        (:prefix-map ("l" . "workspace")
          :desc "Switch workspace"          "."   #'+workspace/switch-to
          :desc "New workspace"             "n"   #'+workspace/new
          :desc "Load workspace from file"  "l"   #'+workspace/load
          :desc "Save workspace to file"    "s"   #'+workspace/save
          :desc "Delete session"            "x"   #'+workspace/kill-session
          :desc "Delete this workspace"     "d"   #'+workspace/delete
          :desc "Rename workspace"          "r"   #'+workspace/rename
          :desc "Restore last session"      "R"   #'+workspace/restore-last-session))

      ;;; <leader> b --- buffer
      (:prefix-map ("b" . "buffer")
        :desc "Toggle narrowing"            "-"   #'doom/toggle-narrow-buffer
        :desc "Previous buffer"             "["   #'previous-buffer
        :desc "Next buffer"                 "]"   #'next-buffer
        (:when (featurep! :ui workspaces)
          :desc "Switch workspace buffer" "b" #'persp-switch-to-buffer
          :desc "Switch buffer"           "B" #'switch-to-buffer)
        (:unless (featurep! :ui workspaces)
          :desc "Switch buffer"           "b" #'switch-to-buffer)
        :desc "Kill buffer"                 "d"   #'kill-current-buffer
        :desc "ibuffer"                     "i"   #'ibuffer
        :desc "Kill buffer"                 "k"   #'kill-current-buffer
        :desc "Kill all buffers"            "K"   #'doom/kill-all-buffers
        :desc "Switch to last buffer"       "l"   #'evil-switch-to-windows-last-buffer
        :desc "Set bookmark"                "m"   #'bookmark-set
        :desc "Delete bookmark"             "M"   #'bookmark-delete
        :desc "Next buffer"                 "n"   #'next-buffer
        :desc "New empty buffer"            "N"   #'evil-buffer-new
        :desc "Kill other buffers"          "O"   #'doom/kill-other-buffers
        :desc "Previous buffer"             "p"   #'previous-buffer
        :desc "Revert buffer"               "r"   #'revert-buffer
        :desc "Save buffer"                 "s"   #'basic-save-buffer
        :desc "Save all buffers"            "S"   #'evil-write-all
        :desc "Save buffer as root"         "u"   #'doom/sudo-save-buffer
        :desc "Pop up scratch buffer"       "x"   #'doom/open-scratch-buffer
        :desc "Switch to scratch buffer"    "X"   #'doom/switch-to-scratch-buffer
        :desc "Bury buffer"                 "z"   #'bury-buffer
        :desc "Kill buried buffers"         "Z"   #'doom/kill-buried-buffers)

      ;;; <leader> c --- code
      (:prefix-map ("c" . "code")
        :desc "LSP Execute code action"               "a"   #'lsp-execute-code-action
        :desc "Compile"                               "c"   #'compile
        :desc "Recompile"                             "C"   #'recompile
        :desc "Jump to definition"                    "d"   #'+lookup/definition
        :desc "Jump to references"                    "D"   #'+lookup/references
        :desc "Evaluate buffer/region"                "e"   #'+eval/buffer-or-region
        :desc "Evaluate & replace region"             "E"   #'+eval:replace-region
        :desc "Format buffer/region"                  "f"   #'+format/region-or-buffer
        :desc "LSP Format buffer/region"              "F"   #'+default/lsp-format-region-or-buffer
        :desc "LSP Organize imports"                  "i"   #'lsp-organize-imports
        (:when (featurep! :completion ivy)
          :desc "Jump to symbol in current workspace" "j"   #'lsp-ivy-workspace-symbol
          :desc "Jump to symbol in any workspace"     "J"   #'lsp-ivy-global-workspace-symbol)
        (:when (featurep! :completion helm)
          :desc "Jump to symbol in current workspace" "j"   #'helm-lsp-workspace-symbol
          :desc "Jump to symbol in any workspace"     "J"   #'helm-lsp-global-workspace-symbol)
        :desc "Jump to documentation"                 "k"   #'+lookup/documentation
        :desc "LSP Rename"                            "r"   #'lsp-rename
        :desc "Send to repl"                          "s"   #'+eval/send-region-to-repl
        :desc "Delete trailing whitespace"            "w"   #'delete-trailing-whitespace
        :desc "Delete trailing newlines"              "W"   #'doom/delete-trailing-newlines
        :desc "List errors"                           "x"   #'flymake-show-diagnostics-buffer
        (:when (featurep! :checkers syntax)
          :desc "List errors"                         "x"   #'flycheck-list-errors))

      ;;; <leader> f --- file
      (:prefix-map ("f" . "file")
        :desc "Open project editorconfig"   "c"   #'editorconfig-find-current-editorconfig
        :desc "Copy this file"              "C"   #'doom/copy-this-file
        :desc "Find directory"              "d"   #'dired
        :desc "Delete this file"            "D"   #'doom/delete-this-file
        :desc "Find file in emacs.d"        "e"   #'+default/find-in-emacsd
        :desc "Browse emacs.d"              "E"   #'+default/browse-emacsd
        :desc "Find file"                   "f"   #'find-file
        :desc "Find file from here"         "F"   #'+default/find-file-under-here
        :desc "Locate file"                 "l"   #'locate
        :desc "Find file in private config" "p"   #'doom/find-file-in-private-config
        :desc "Browse private config"       "P"   #'doom/open-private-config
        :desc "Recent files"                "r"   #'recentf-open-files
        :desc "Rename/move file"            "R"   #'doom/move-this-file
        :desc "Save file"                   "s"   #'save-buffer
        :desc "Save file as..."             "S"   #'write-file
        :desc "Sudo find file"              "u"   #'doom/sudo-find-file
        :desc "Sudo this file"              "U"   #'doom/sudo-this-file
        :desc "Yank filename"               "y"   #'+default/yank-buffer-filename)

      ;;; <leader> g --- git/version control
      (:prefix-map ("g" . "git")
        :desc "Revert file"                 "R"   #'vc-revert
        :desc "Copy link to remote"         "y"   #'browse-at-remote-kill
        :desc "Copy link to homepage"       "Y"   #'+vc/browse-at-remote-kill-homepage
        (:when (featurep! :ui hydra)
          :desc "SMerge"                    "m"   #'+vc/smerge-hydra/body)
        (:when (featurep! :ui vc-gutter)
          (:when (featurep! :ui hydra)
            :desc "VCGutter"                "."   #'+vc/gutter-hydra/body)
          :desc "Revert hunk"               "r"   #'git-gutter:revert-hunk
          :desc "Git stage hunk"            "s"   #'git-gutter:stage-hunk
          :desc "Git time machine"          "t"   #'git-timemachine-toggle
          :desc "Jump to next hunk"         "]"   #'git-gutter:next-hunk
          :desc "Jump to previous hunk"     "["   #'git-gutter:previous-hunk)
        (:when (featurep! :tools magit)
          :desc "Magit dispatch"            "/"   #'magit-dispatch
          :desc "Forge dispatch"            "'"   #'forge-dispatch
          :desc "Magit switch branch"       "b"   #'magit-branch-checkout
          :desc "Magit status"              "g"   #'magit-status
          :desc "Magit file delete"         "D"   #'magit-file-delete
          :desc "Magit blame"               "B"   #'magit-blame-addition
          :desc "Magit clone"               "C"   #'magit-clone
          :desc "Magit fetch"               "F"   #'magit-fetch
          :desc "Magit buffer log"          "L"   #'magit-log
          :desc "Git stage file"            "S"   #'magit-stage-file
          :desc "Git unstage file"          "U"   #'magit-unstage-file
          (:prefix ("f" . "find")
            :desc "Find file"                 "f"   #'magit-find-file
            :desc "Find gitconfig file"       "g"   #'magit-find-git-config-file
            :desc "Find commit"               "c"   #'magit-show-commit
            :desc "Find issue"                "i"   #'forge-visit-issue
            :desc "Find pull request"         "p"   #'forge-visit-pullreq)
          (:prefix ("o" . "open in browser")
            :desc "Browse file or region"     "o"   #'browse-at-remote
            :desc "Browse homepage"           "h"   #'+vc/browse-at-remote-homepage
            :desc "Browse remote"             "r"   #'forge-browse-remote
            :desc "Browse commit"             "c"   #'forge-browse-commit
            :desc "Browse an issue"           "i"   #'forge-browse-issue
            :desc "Browse a pull request"     "p"   #'forge-browse-pullreq
            :desc "Browse issues"             "I"   #'forge-browse-issues
            :desc "Browse pull requests"      "P"   #'forge-browse-pullreqs)
          (:prefix ("l" . "list")
            (:when (featurep! :tools gist)
              :desc "List gists"              "g"   #'+gist:list)
            :desc "List repositories"         "r"   #'magit-list-repositories
            :desc "List submodules"           "s"   #'magit-list-submodules
            :desc "List issues"               "i"   #'forge-list-issues
            :desc "List pull requests"        "p"   #'forge-list-pullreqs
            :desc "List notifications"        "n"   #'forge-list-notifications)
          (:prefix ("c" . "create")
            :desc "Initialize repo"           "r"   #'magit-init
            :desc "Clone repo"                "R"   #'magit-clone
            :desc "Commit"                    "c"   #'magit-commit-create
            :desc "Fixup"                     "f"   #'magit-commit-fixup
            :desc "Branch"                    "b"   #'magit-branch-and-checkout
            :desc "Issue"                     "i"   #'forge-create-issue
            :desc "Pull request"              "p"   #'forge-create-pullreq)))

      ;;; <leader> i --- insert
      (:prefix-map ("i" . "insert")
        :desc "Current file name"             "f"   #'+default/insert-file-path
        :desc "Current file path"             "F"   (λ!! #'+default/insert-file-path t)
        :desc "Evil ex path"                  "p"   (λ! (evil-ex "R!echo "))
        :desc "From evil register"            "r"   #'evil-ex-registers
        :desc "Snippet"                       "s"   #'yas-insert-snippet
        :desc "Unicode"                       "u"   #'unicode-chars-list-chars
        :desc "From clipboard"                "y"   #'+default/yank-pop)

      ;;; <leader> n --- notes
      (:prefix-map ("n" . "notes")
        :desc "Search notes for symbol"      "*" #'+default/search-notes-for-symbol-at-point
        :desc "Org agenda"                   "a" #'org-agenda
        :desc "Toggle org-clock"             "c" #'+org/toggle-clock
        :desc "Cancel org-clock"             "C" #'org-clock-cancel
        :desc "Open deft"                    "d" #'deft
        :desc "Find file in notes"           "f" #'+default/find-in-notes
        :desc "Browse notes"                 "F" #'+default/browse-notes
        :desc "Org store link"               "l" #'org-store-link
        :desc "Tags search"                  "m" #'org-tags-view
        :desc "Org capture"                  "n" #'org-capture
        :desc "Active org-clock"             "o" #'org-clock-goto
        :desc "Todo list"                    "t" #'org-todo-list
        :desc "Search notes"                 "s" #'+default/org-notes-search
        :desc "Search org agenda headlines"  "S" #'+default/org-notes-headlines
        :desc "View search"                  "v" #'org-search-view
        :desc "Org export to clipboard"        "y" #'+org/export-to-clipboard
        :desc "Org export to clipboard as RTF" "Y" #'+org/export-to-clipboard-as-rich-text

        (:when (featurep! :lang org +journal)
          (:prefix ("j" . "journal")
            :desc "New Entry"      "j" #'org-journal-new-entry
            :desc "Search Forever" "s" #'org-journal-search-forever)))

      ;;; <leader> o --- open
      (:prefix-map ("o" . "open")
        :desc "Org agenda"       "A"  #'org-agenda
        (:prefix ("a" . "org agenda")
          :desc "Agenda"         "a"  #'org-agenda
          :desc "Todo list"      "t"  #'org-todo-list
          :desc "Tags search"    "m"  #'org-tags-view
          :desc "View search"    "v"  #'org-search-view)
        :desc "Default browser"    "b"  #'browse-url-of-file
        :desc "Start debugger"     "d"  #'+debugger/start
        :desc "New frame"          "f"  #'make-frame
        :desc "REPL"               "r"  #'+eval/open-repl-other-window
        :desc "REPL (same window)" "R"  #'+eval/open-repl-same-window
        :desc "Dired"              "-"  #'dired-jump
        (:when (featurep! :ui neotree)
          :desc "Project sidebar"              "p" #'+neotree/open
          :desc "Find file in project sidebar" "P" #'+neotree/find-this-file)
        (:when (featurep! :ui treemacs)
          :desc "Project sidebar" "p" #'+treemacs/toggle
          :desc "Find file in project sidebar" "P" #'+treemacs/find-file)
        (:when (featurep! :term shell)
          :desc "Toggle shell popup"    "t" #'+shell/toggle
          :desc "Open shell here"       "T" #'+shell/here)
        (:when (featurep! :term term)
          :desc "Toggle terminal popup" "t" #'+term/toggle
          :desc "Open terminal here"    "T" #'+term/here)
        (:when (featurep! :term vterm)
          :desc "Toggle vterm popup"    "t" #'+vterm/toggle
          :desc "Open vterm here"       "T" #'+vterm/here)
        (:when (featurep! :term eshell)
          :desc "Toggle eshell popup"   "e" #'+eshell/toggle
          :desc "Open eshell here"      "E" #'+eshell/here)
        (:when (featurep! :tools macos)
          :desc "Reveal in Finder"           "o" #'+macos/reveal-in-finder
          :desc "Reveal project in Finder"   "O" #'+macos/reveal-project-in-finder
          :desc "Send to Transmit"           "u" #'+macos/send-to-transmit
          :desc "Send project to Transmit"   "U" #'+macos/send-project-to-transmit
          :desc "Send to Launchbar"          "l" #'+macos/send-to-launchbar
          :desc "Send project to Launchbar"  "L" #'+macos/send-project-to-launchbar)
        (:when (featurep! :tools docker)
          :desc "Docker" "D" #'docker))

      ;;; <leader> p --- project
      (:prefix-map ("p" . "project")
        :desc "Browse project"               "." #'+default/browse-project
        :desc "Browse other project"         ">" #'doom/browse-in-other-project
        :desc "Run cmd in project root"      "!" #'projectile-run-shell-command-in-root
        :desc "Add new project"              "a" #'projectile-add-known-project
        :desc "Switch to project buffer"     "b" #'projectile-switch-to-buffer
        :desc "Compile in project"           "c" #'projectile-compile-project
        :desc "Repeat last command"          "C" #'projectile-repeat-last-command
        :desc "Remove known project"         "d" #'projectile-remove-known-project
        :desc "Discover projects in folder"  "D" #'+default/discover-projects
        :desc "Edit project .dir-locals"     "e" #'projectile-edit-dir-locals
        :desc "Find file in project"         "f" #'projectile-find-file
        :desc "Find file in other project"   "F" #'doom/find-file-in-other-project
        :desc "Configure project"            "g" #'projectile-configure-project
        :desc "Invalidate project cache"     "i" #'projectile-invalidate-cache
        :desc "Kill project buffers"         "k" #'projectile-kill-buffers
        :desc "Find other file"              "o" #'projectile-find-other-file
        :desc "Switch project"               "p" #'projectile-switch-project
        :desc "Find recent project files"    "r" #'projectile-recentf
        :desc "Run project"                  "R" #'projectile-run-project
        :desc "Save project files"           "s" #'projectile-save-project-buffers
        :desc "Pop up scratch buffer"        "x" #'doom/open-project-scratch-buffer
        :desc "Switch to scratch buffer"     "X" #'doom/switch-to-project-scratch-buffer
        :desc "List project tasks"           "t" #'magit-todos-list
        :desc "Test project"                 "T" #'projectile-test-project)

      ;;; <leader> q --- quit/session
      (:prefix-map ("q" . "quit/session")
        :desc "Restart emacs server"         "d" #'+default/restart-server
        :desc "Delete frame"                 "f" #'delete-frame
        :desc "Clear current frame"          "F" #'doom/kill-all-buffers
        :desc "Kill Emacs (and daemon)"      "K" #'save-buffers-kill-emacs
        :desc "Quit Emacs"                   "q" #'save-buffers-kill-terminal
        :desc "Quit Emacs without saving"    "Q" #'evil-quit-all-with-error-code
        :desc "Quick save current session"   "s" #'doom/quicksave-session
        :desc "Restore last session"         "l" #'doom/quickload-session
        :desc "Save session to file"         "S" #'doom/save-session
        :desc "Restore session from file"    "L" #'doom/load-session
        :desc "Restart & restore Emacs"      "r" #'doom/restart-and-restore
        :desc "Restart Emacs"                "R" #'doom/restart)

      ;;; <leader> r --- remote
      (:when (featurep! :tools upload)
        (:prefix-map ("r" . "remote")
          :desc "Upload local"               "u" #'ssh-deploy-upload-handler
          :desc "Upload local (force)"       "U" #'ssh-deploy-upload-handler-forced
          :desc "Download remote"            "d" #'ssh-deploy-download-handler
          :desc "Diff local & remote"        "D" #'ssh-deploy-diff-handler
          :desc "Browse remote files"        "." #'ssh-deploy-browse-remote-handler
          :desc "Detect remote changes"      ">" #'ssh-deploy-remote-changes-handler))

      ;;; <leader> s --- search
      (:prefix-map ("s" . "search")
        :desc "Search buffer"                "b" #'swiper
        :desc "Search current directory"     "d" #'+default/search-cwd
        :desc "Search other directory"       "D" #'+default/search-other-cwd
        :desc "Locate file"                  "f" #'locate
        :desc "Jump to symbol"               "i" #'imenu
        :desc "Jump to visible link"         "l" #'link-hint-open-link
        :desc "Jump to link"                 "L" #'ffap-menu
        :desc "Jump list"                    "j" #'evil-show-jumps
        :desc "Jump to bookmark"             "m" #'bookmark-jump
        :desc "Look up online"               "o" #'+lookup/online
        :desc "Look up online (w/ prompt)"   "O" #'+lookup/online-select
        :desc "Look up in local docsets"     "k" #'+lookup/in-docsets
        :desc "Look up in all docsets"       "K" #'+lookup/in-all-docsets
        :desc "Search project"               "p" #'+default/search-project
        :desc "Search other project"         "P" #'+default/search-other-project
        :desc "Jump to mark"                 "r" #'evil-show-marks
        :desc "Search buffer"                "s" #'swiper-isearch
        :desc "Search buffer for thing at point" "S" #'swiper-isearch-thing-at-point
        :desc "Dictionary"                   "t" #'+lookup/dictionary-definition
        :desc "Thesaurus"                    "T" #'+lookup/synonyms)

      ;;; <leader> t --- toggle
      (:prefix-map ("t" . "toggle")
        :desc "Big mode"                     "b" #'doom-big-font-mode
        :desc "Flymake"                      "f" #'flymake-mode
        (:when (featurep! :checkers syntax)
          :desc "Flycheck"                   "f" #'flycheck-mode)
        :desc "Frame fullscreen"             "F" #'toggle-frame-fullscreen
        :desc "Evil goggles"                 "g" #'evil-goggles-mode
        (:when (featurep! :ui indent-guides)
          :desc "Indent guides"              "i" #'highlight-indent-guides-mode)
        :desc "Indent style"                 "I" #'doom/toggle-indent-style
        :desc "Line numbers"                 "l" #'doom/toggle-line-numbers
        (:when (featurep! :lang org +present)
          :desc "org-tree-slide mode"        "p" #'org-tree-slide-mode)
        :desc "Read-only mode"               "r" #'read-only-mode
        (:when (featurep! :checkers spell)
          :desc "Flyspell"                   "s" #'flyspell-mode)
        (:when (featurep! :lang org +pomodoro)
          :desc "Pomodoro timer"             "t" #'org-pomodoro)
        :desc "Soft line wrapping"           "w" #'visual-line-mode
        (:when (featurep! :ui word-wrap)
          :desc "Soft line wrapping"         "w" #'+word-wrap-mode)
        :desc "Zen mode"                     "z" #'writeroom-mode))

(after! which-key
  (let ((prefix-re (regexp-opt (list doom-leader-key doom-leader-alt-key))))
    (cl-pushnew `((,(format "\\`\\(?:C-w\\|%s w\\) m\\'" prefix-re))
                  nil . "maximize")
                which-key-replacement-alist)))
