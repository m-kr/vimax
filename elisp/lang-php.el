(use-package ac-php)

(use-package php-mode
  :mode
  (("\\.php\\'" . php-mode))
  :config
  (add-hook 'php-mode-hook
  	    '(lambda ()
  	       (require 'company-php)
  	       (company-mode t)
  	       (add-to-list 'company-backends 'company-ac-php-backend))))

;; (use-package phpunit
  ;; :mode
  ;; (("\\.php\\'" . phpunit-mode)))

;; (add-to-list ‘auto-mode-alist ‘(“\\.php$” . php-mode))

;;(use-package phpunit
 ;;:ensure t)

;; (use-package php-mode
;;   :hook (XXX-mode . lsp)
;;   :commands lsp)

(provide 'lang-php)
