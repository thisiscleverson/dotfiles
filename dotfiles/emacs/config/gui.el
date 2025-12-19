;; --- Emacs GUI config ---

;; dead keys
(require 'iso-transl)


(setq inhibit-startup-message t) ;; Remove welcome message
(setq initial-buffer-choice nil)
(setq initial-scratch-message nil)
(setq use-dialog-box nil)
(setq auto-save-default nil) ;; desativar o auto-save
(setq make-backup-files nil)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;; Remove menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default message-log-max nil)
(kill-buffer "*Messages*")


(ido-mode 1)
(cua-mode 1)


;;indent tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)


;; highlight actual line
(global-hl-line-mode)


;; Font size
(set-face-attribute 'default nil :height 100)


;; flex buffer
(defalias 'list-buffers 'ibuffer-other-window) ;; ibuffer default C-x C-b
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;;theme
(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox-dark-medium t)
  )

;; remover o background no line number por causa do gruvbox theme
(custom-set-faces
 '(line-number ((t (:background "#00000000")))))


;; all the icons
(use-package all-the-icons
  :ensure t)


;;side tree
(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-window-fixed-size nil)
    )
  :bind (("C-b". 'neotree-toggle)))


;; tabs
(global-unset-key (kbd "C-x <prior>"))
(global-unset-key (kbd "C-x <next>"))
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (setq centaur-tabs-style "bar"
	centaur-tabs-set-bar 'over
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "⏺"
	centaur-tabs-set-icons t
	centaur-tabs-height 32)
  (centaur-tabs-change-fonts (face-attribute 'default :font) 120)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  :bind
  ("C-x <prior>" . centaur-tabs-backward)
  ("C-x <next>" . centaur-tabs-forward)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (vterm-mode . centaur-tabs-local-mode))


;;multiple cursors
(use-package multiple-cursors
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-S-<down>") 'mc/edit-lines)
    (global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-S-<down>") 'mc/mark-next-like-this)
    (global-set-key (kbd "M-S-<left>") 'mc/mark-all-like-this)))


;;move-text
(use-package move-text
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-<up>") 'move-text-up)
    (global-set-key (kbd "M-<down>") 'move-text-down)))


;;dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '(
        (recents . 5)
		(projects . 5)
        (bookmarks . 5)))
	(setq dashboard-center-content t)
    (setq dashboard-banner-logo-title "Welcome to GNU Emacs! ❤️")
    (setq dashboard-startup-banner 'logo)
	(setq dashboard-icon-type 'all-the-icons)
    (setq dashboard-set-file-icons t)
    (setq dashboard-heading-icons t)
    (setq dashboard-set-init-info nil)
    )
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-org-agenda-categories '("Tasks"))


(provide 'gui)
