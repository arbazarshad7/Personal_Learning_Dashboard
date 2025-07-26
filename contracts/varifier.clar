;; Personal Learning Dashboard_Sync with Blockchain Data
;; Track and retrieve individual learning progress on-chain

;; Error Constants
(define-constant err-invalid-progress (err u100))
(define-constant err-unauthorized (err u101))

;; Track progress of users
(define-map learner-progress principal uint) ;; e.g., number of modules completed

;; Function: Set learning progress
(define-public (set-progress (progress uint))
  (begin
    (asserts! (> progress u0) err-invalid-progress)
    (map-set learner-progress tx-sender progress)
    (ok {user: tx-sender, progress: progress})
  ))

;; Function: Get learning progress
(define-read-only (get-progress (user principal))
  (ok (default-to u0 (map-get? learner-progress user))))
