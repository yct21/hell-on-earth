(after! hydra
  (defhydra hoe*hydra-hotspots (:hint true :color: red)
    "hot spots"
    ("g" #'(switch-to-buffer "~/orlog/gtd.org"))

    ))
