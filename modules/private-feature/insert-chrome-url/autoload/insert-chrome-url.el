;;; private-feature/insert-chrome-url/autoload/insert-chrome-url.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +insert-chrome-url/insert-chrome-current-tab-url ()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (+insert-chrome-url/retrieve-chrome-current-tab-url)))

;;;###autoload
(defun +insert-chrome-url/retrieve-chrome-current-tab-url ()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

;;;###autoload
(defun +insert-chrome-url/insert-chrome-current-tab-url-in-org (link-description)
  "Insert current chrome tab url in org mode"
  (interactive "sLink description: ")
  (insert (format "[[%s][%s]]"
                  (+insert-chrome-url/retrieve-chrome-current-tab-url)
                  link-description)))

;;;###autoload
(defun +insert-chrome-url/insert-chrome-current-tab-url-in-md (link-description)
  "Insert current chrome tab url in markdown mode"
  (interactive "sLink description: ")
  (insert (format "[%s](%s)"
                  link-description
                  (+insert-chrome-url/retrieve-chrome-current-tab-url))))
