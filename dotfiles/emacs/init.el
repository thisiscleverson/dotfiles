;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MY GNU EMACS CONFIGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'load-path "~/.emacs.d/config/")


;; Load my splited configuration
(require 'melpa)
(require 'gui)
(require 'git)
(require 'code)
(require 'functions)
(require 'terminal)
(require 'hooks)
(require 'markdown)
(require 'html)
(require 'keys)



;; --------------------------------------[GLobal Configs]-----------------------------------------

(yas-global-mode 1)


(use-package try
  :ensure t)


(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))


(use-package counsel
  :ensure t)


(use-package swiper
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-f" 'swiper)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176"
	 "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9"
	 "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e"
	 "09b833239444ac3230f591e35e3c28a4d78f1556b107bafe0eb32b5977204d93"
	 "36d4b9573ed57b3c53261cb517eef2353058b7cf95b957f691f5ad066933ae84"
	 "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af"
	 "c46651ab216eb31e699be1bd5e6df8229b08005b534194c1ea92519b09661d71"
	 "b49f66a2e1724db880692485a5d5bcb9baf28ed2a3a05c7a799fa091f24321da"
	 "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757"
	 "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
	 "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d"
	 "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3"
	 "7bcbee7c5eaef0eca0dad6c5ec0ee8f665efd857be421a67be1ce84003d71417"
	 "53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf"
	 "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf"
	 "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7"
	 "7fea145741b3ca719ae45e6533ad1f49b2a43bf199d9afaee5b6135fd9e6f9b8"
	 "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1"
	 "2b0fcc7cc9be4c09ec5c75405260a85e41691abb1ee28d29fcd5521e4fca575b"
	 default))
 '(package-selected-packages nil))

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:background "#00000000"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8 :foreground "#A3BE8C" :weight extra-bold))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4 :foreground "#EBCB8B" :weight extra-bold))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2 :foreground "#D08770" :weight extra-bold))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.15 :foreground "#BF616A" :weight extra-bold))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.11 :foreground "#b48ead" :weight extra-bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.06 :foreground "#5e81ac" :weight extra-bold)))))
