(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'scheme)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/repos/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(geiser-guile geiser-racket geiser-mit evil org-contrib wolfram-mode marginalia orderless vertico projectile use-package org-roam))
 '(scheme-program-name "mit-scheme"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
	 :map minibuffer-local-map
	 ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Load mathematica from contrib
(org-babel-do-load-languages 'org-babel-load-languages
			     '((mathematica -t)
			       (scheme . -t))) 

;; Sanitize output and deal with paths
(setq org-babel-mathematica-command "~/.local/bin/mash")
;; Font-locking
(add-to-list 'org-src-lang-modes '("mathematica" . wolfram))
;; For wolfram-mode
(setq mathematica-command-line "~/.local/bin/mash")

;;use larger font
(setq default-frame-alist '((font . "Source Code Pro-14")))

(setq geiser-active-implementations '(guile))
(setq geiser-guile-binary "guile2.2")


