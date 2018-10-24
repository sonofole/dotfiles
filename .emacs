;; list all packages here so they will be automatically installed if missing
(setq package-list '(evil key-chord helm powerline dtrt-indent yasnippet hc-zenburn-theme google-this typescript-mode tss web-mode))

(require 'package)
(add-to-list 'package-archives
	     	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
      (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages")))
(package-initialize)

(or (file-exists-p package-user-dir)
        (package-refresh-contents))

(dolist (package package-list)
    (unless (package-installed-p package)
          (package-install package)))

(custom-set-variables
   ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
      ;; If there is more than one, they won't work right.
       '(evil-search-module (quote evil-search))
        '(show-paren-mode t))
(custom-set-faces
   ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
      ;; If there is more than one, they won't work right.
       )

;; copy/paste from external programs
(setq x-select-enable-clipboard t)

(desktop-save-mode 1)
(scroll-bar-mode -1)

(require 'evil)
(evil-mode 1)
(setq evil-move-cursor-back nil)

(require 'key-chord)
(key-chord-mode 1)

(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'powerline)
(powerline-default-theme)

(setq-default tab-width 4 indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'dtrt-indent)
(dtrt-indent-mode 1)

(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'tss)

(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

(tss-config-default)

(setq whitespace-action '(auto-cleanup))
(custom-set-variables '(coffee-tab-width 2))

(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
(yas-global-mode 1)

(load-theme 'hc-zenburn t)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(google-this-mode 1)
(global-set-key (kbd "C-x g") 'google-this-mode-submap)

(define-key evil-normal-state-map (kbd "C-k") (lambda ()
						                    (interactive)
								                        (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
						                        (interactive)
									                        (evil-scroll-down nil)))

(custom-set-variables
   '(initial-frame-alist (quote ((fullscreen . maximized))))) ;; start maximized

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
