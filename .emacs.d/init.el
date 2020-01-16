(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "da538070dddb68d64ef6743271a26efd47fbc17b52cc6526d932b9793f92b718" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "003a9aa9e4acb50001a006cfde61a6c3012d373c4763b48ceb9d523ceba66829" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (helm-ag nyan-mode helm-projectile doom-modeline powerline-evil iasm-mode ## airline-themes linum-relative evil use-package smart-mode-line-powerline-theme monokai-theme magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vnguyen emacs configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; load asl mode
(load "~/.emacs.d/asl-mode.el")

;; Decrease keystroke delay
(setq echo-keystrokes .1)

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; Package Config
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;;;; Appearances
(use-package monokai-theme 
  :ensure t
  :config
  (load-theme 'monokai t))

;; 

(use-package nyan-mode
  :if window-system
  :ensure t
  :config
;  (nyan-mode)
;  (nyan-start-animation)
)

(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
       ))

;; powerline-evil
(use-package powerline-evil
  :ensure t
  :config
  (powerline-evil-vim-color-theme))

;; doom-modeline
(use-package all-the-icons)

;; Show line number
(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%4d ")

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-SPC" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-buffers-list))
  :bind (:map helm-map
	      ("M-i" . helm-previous-line)
	      ("M-k" . helm-next-line)
	      ("M-I" . helm-previous-page)
	      ("M-K" . helm-next-page)
	      ("M-h" . helm-beginning-of-buffer)
	      ("M-H" . helm-end-of-buffer))
  :config (progn
	    (setq helm-buffers-fuzzy-matching t)
            (helm-mode 1)
	    (define-key helm-find-files-map "\t" 'helm-execute-persistent-action)))

(use-package helm-ag
  :ensure t
  :bind ("C-c a g" . helm-do-ag-project-root))

;; Projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  (projectile-mode +1))

;; helm-projectile
(use-package helm-projectile
  :ensure t
  :bind ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))
