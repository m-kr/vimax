;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

;; projectile
;; (projectile-mode +1)
(define-key evil-normal-state-map (kbd "SPC p") 'projectile-switch-project)
(define-key evil-normal-state-map (kbd "SPC SPC") 'projectile-find-file)

(provide 'base-global-keys)
