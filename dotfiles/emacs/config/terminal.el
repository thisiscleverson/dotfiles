;; --- terminal ---


(use-package vterm
  :ensure t
  :bind
  (:map vterm-mode-map
	("C-v" . vterm-yank)
	("C-c" . vterm-copy-mode)))

(use-package vterm-toggle
    :ensure t)


(provide 'terminal)
