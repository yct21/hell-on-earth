(def-package! wakatime-mode
  :init
  (setq wakatime-api-key "44bcd124-1fb7-44a3-a7b6-aae4fecc969d"
        wakatime-cli-path "/usr/local/bin/wakatime")
  (global-wakatime-mode))
