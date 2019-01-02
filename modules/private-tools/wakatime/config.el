(def-package! wakatime-mode
  :init
  (setq wakatime-api-key "6783c0b9-68d0-4527-bd55-b8c5dc02a2ea"
        wakatime-cli-path "/usr/local/bin/wakatime")
  (global-wakatime-mode))
