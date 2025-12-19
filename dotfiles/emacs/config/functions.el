;; --- My Functions ---

(defun select-line ()
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))


(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))


(defun new-empty-buffer ()
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))


(defun enable-hs-minor-mode ()
  "Ativa `hs-minor-mode` para linguagens suportadas."
  (hs-minor-mode t))


;; test --------------------------------------------

(defun replace-all-in-buffer ()
  "Substitui todas as ocorrências de uma palavra por outra em todo o buffer."
  (interactive)
  (let ((old-word (read-string "Replace all: "))
        (new-word (read-string "to: ")))
    (when (and old-word new-word (not (string-empty-p old-word)))
      (save-excursion
        (goto-char (point-min))
        (let ((case-fold-search nil)  ; Busca case-sensitive
              (count 0))
          (while (search-forward old-word nil t)
            (replace-match new-word nil t)
            (setq count (1+ count)))
          (message "Substituídas %d ocorrências de '%s' por '%s'" 
                   count old-word new-word))))))


(provide 'functions)
