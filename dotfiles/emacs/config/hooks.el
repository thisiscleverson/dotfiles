(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook 'enable-hs-minor-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; code hooks
(add-hook 'yaml-mode-hook #'flyspell-prog-mode)
(add-hook 'conf-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'toml-mode-hook #'flyspell-prog-mode)
(add-hook 'dockerfile-mode #'flyspell-prog-mode)
(add-hook 'docker-compose-mode #'flyspell-prog-mode)
(add-hook 'c-mode-hook #'flyspell-prog-mode)
(add-hook 'c++-mode-hook #'flyspell-prog-mode)


(provide 'hooks)
