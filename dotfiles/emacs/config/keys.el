;; --------- keys

(use-package which-key
  :ensure t
  :config (which-key-mode))


(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "M-a"))
(global-unset-key (kbd "C-e"))
(global-set-key (kbd "C-S-t") 'vterm-toggle)
(global-set-key (kbd "C-e") 'eval-buffer)
(global-set-key (kbd "C-M-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-<down>") 'enlarge-window)
(global-set-key (kbd "M-S-<up>") 'shrink-window)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-l") 'select-line)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)
(global-set-key (kbd "M-b") 'split-window-right)
(global-set-key "\C-a" 'mark-whole-buffer)
(global-set-key "\C-n" 'new-empty-buffer)
(global-set-key "\C-k" (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key "\C-c\C-v" 'duplicate-line)
(global-set-key (kbd "C-t") 'projectile-run-vterm)
(global-set-key (kbd "C-c C-<up>") 'hs-hide-all)
(global-set-key (kbd "C-c C-<down>") 'hs-show-all)
(global-set-key (kbd "C-c C-<right>") 'hs-show-block)
(global-set-key (kbd "C-c C-<left>") 'hs-hide-block)
(global-set-key (kbd "C-r") 'replace-all-in-buffer)


(global-set-key (kbd "C-+")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (+ old-face-attribute 5)))))


(global-set-key (kbd "C--")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (- old-face-attribute 5)))))


(provide 'keys)
