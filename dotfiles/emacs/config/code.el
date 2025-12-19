;; --- code ---

; snippets from autocomplete
(use-package yasnippet
  :ensure t)


; company: autocomplete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))


; Poetry
(use-package poetry
  :ensure t
  :hook
  ;; activate poetry-tracking-mode when python-mode is active
  (python-mode . poetry-tracking-mode)
  )


;; Configurações para C/C++
(use-package cc-mode
  :ensure nil
  :config
  (setq c-default-style "linux"
        c-basic-offset 4
        tab-width 4
        indent-tabs-mode nil))


;; Syntax checker

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
   (setq flycheck-check-syntax-automatically '(save new-line)
        flycheck-idle-change-delay 5.0
        flycheck-display-errors-delay 0.9
        flycheck-highlighting-mode 'symbols
        flycheck-indication-mode 'left-fringe
        flycheck-standard-error-navigation t
        flycheck-deferred-syntax-check nil)
  :config
  ;; before install flake8 (pip install flake8)
  (setq flycheck-python-flake8-executable "~/.local/bin/flake8")
  ;; before install pylint (pip install pylint)
  ;; after install, create config file (pylint --generate-rcfile > ~/.pylintrc)
  (setq flycheck-python-pylint-executable "~/.local/bin/pylint")
)

(use-package flycheck-inline
  :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))


;; LSP

(use-package lsp-pyright ;; Python LSP
 :ensure t
 :config
 (setq
  lsp-keep-workspace-alive nil
  ;; it sucks!
  ;; https://github.com/emacs-lsp/lsp-mode/issues/4679
  lsp-copilot-applicable-fn (lambda (&rest _) nil))
 :custom (lsp-pyright-langserver-command "basedpyright")
 :hook
 ((python-ts-mode
   .
   (lambda ()
     (require 'lsp-pyright)
     (lsp-deferred)))
  (flycheck-mode
   .
   (lambda ()
     ;; Next checker check the first lsp -> flake8 -> pylint
     ;; Waring clause check the next only if dont have errors
     ;; If lsp dont have errors, check flake8, if lsp and flake8 dont have any error
     ;; check using pylint.
     (flycheck-add-next-checker 'lsp '(warning . python-flake8))
     (flycheck-add-next-checker
      'python-flake8 '(warning . python-pylint))
     (message "Added flycheck checkers.")))))


(setq lsp-auto-guess-root t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config (setq lsp-ui-doc-mode 1))


(require 'lsp-diagnostics)
(lsp-diagnostics-flycheck-enable)


(provide 'code)
