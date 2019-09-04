;;; private-tools/leetcode/autoload.el -*- lexical-binding: t; -*-

;;;###autodef
(defconst hoe-leetcode//go-solution-template
  "
package problem%04d

import (
	_ \"fmt\"
)
")

;;;###autodef
(defconst hoe-leetcode//go-test-template
  "
package problem%04d

import (
    _ \"fmt\"
    \"testing\"
    \"github.com/stretchr/testify/assert\"
)

func Test_1(t *testing.T) {
    ast := assert.New(t)
}
")

;;;###autodef
(defconst hoe-leetcode//go-mod-template
  "
module leetcode/problem%04d

go 1.12
")

;;;###autodef
(defun hoe-leetcode/retrieve-chrome-current-tab-problem-title ()
  "Get the URL of the active tab of the first window"
  (let* ((raw-url (do-applescript
                  (concat
                   "set frontmostApplication to path to frontmost application\n"
                   "tell application \"Google Chrome\"\n"
                   "    set theUrl to get URL of active tab of first window\n"
                   "    set theResult to (get theUrl) \n"
                   "end tell\n"
                   "activate application (frontmostApplication as text)\n"
                   "set links to {}\n"
                   "copy theResult to the end of links\n"
                   "return links as string\n")))
         (url (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" raw-url)))))
    (string-match "problems\\/\\(.*\\)\\/$" url)
    (message url)
    (match-string 1 url)
    ))

;;;###autodef
(defun hoe-leetcode/retrieve-chrome-current-tab-problem-id ()
  "Get the title of the active tab of the first window"
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "    set theTitle to get title of active tab of first window\n"
                  "    set theResult to (get theTitle) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (string-match "^[0-9]*" result)
    (string-to-number (match-string 0 result))
     ))

;;;###autoload
(defun hoe-leetcode/new-rust-problem ()
  (interactive)
  (message "Not done yet"))

;;;###autoload
(defun hoe-leetcode/new-go-problem ()
  (interactive)
  (message "new go problem")
  (let* ((root "/Users/yct21/code/playgrounds/leetcode-go")
         (title (hoe-leetcode/retrieve-chrome-current-tab-problem-title))
         (id (hoe-leetcode/retrieve-chrome-current-tab-problem-id))
         (solution-path (format "%s/%04d-%s/solution.go" root id title))
         (solution-text (format hoe-leetcode//go-solution-template id))
         (solution-test-path (format "%s/%04d-%s/solution_test.go" root id title))
         (solution-test-text (format hoe-leetcode//go-test-template id))
         (mod-path (format "%s/%04d-%s/go.mod" root id title))
         (mod-text (format hoe-leetcode//go-mod-template id)))
    (find-file solution-test-path)
    (erase-buffer)
    (insert solution-test-text)
    (save-buffer)
    (find-file mod-path)
    (erase-buffer)
    (insert mod-text)
    (save-buffer)
    (find-file solution-path)
    (erase-buffer)
    (insert solution-text)
    (save-buffer)
    )
  )

;;;###autoload (autoload '+leetcode/new-problem/body "core/autoload/hydras" nil t)
(defhydra hoe-leetcode/new-problem (:hint nil)
  "
  Open new problem
  _r_:rust
  _g_:golang
  "
  ("r" hoe-leetcode/new-rust-problem)
  ("g" hoe-leetcode/new-go-problem)
  )
