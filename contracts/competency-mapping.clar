;; Competency Mapping Contract
;; Maps and manages required competencies for different roles and skills

(define-constant ERR-NOT-AUTHORIZED (err u200))
(define-constant ERR-COMPETENCY-EXISTS (err u201))
(define-constant ERR-COMPETENCY-NOT-FOUND (err u202))

;; Data maps
(define-map competencies
  { competency-id: uint }
  {
    name: (string-ascii 100),
    description: (string-ascii 500),
    category: (string-ascii 50),
    difficulty-level: uint,
    prerequisites: (list 10 uint),
    created-by: principal,
    created-at: uint
  }
)

(define-map role-competencies
  { role: (string-ascii 50) }
  {
    required-competencies: (list 20 uint),
    optional-competencies: (list 10 uint)
  }
)

;; Data variables
(define-data-var next-competency-id uint u1)

;; Public functions
(define-public (create-competency
  (name (string-ascii 100))
  (description (string-ascii 500))
  (category (string-ascii 50))
  (difficulty-level uint)
  (prerequisites (list 10 uint))
)
  (let ((competency-id (var-get next-competency-id)))
    (map-set competencies
      { competency-id: competency-id }
      {
        name: name,
        description: description,
        category: category,
        difficulty-level: difficulty-level,
        prerequisites: prerequisites,
        created-by: tx-sender,
        created-at: block-height
      }
    )
    (var-set next-competency-id (+ competency-id u1))
    (ok competency-id)
  )
)

(define-public (map-role-competencies
  (role (string-ascii 50))
  (required-competencies (list 20 uint))
  (optional-competencies (list 10 uint))
)
  (begin
    (map-set role-competencies
      { role: role }
      {
        required-competencies: required-competencies,
        optional-competencies: optional-competencies
      }
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-competency (competency-id uint))
  (map-get? competencies { competency-id: competency-id })
)

(define-read-only (get-role-competencies (role (string-ascii 50)))
  (map-get? role-competencies { role: role })
)

(define-read-only (get-next-competency-id)
  (var-get next-competency-id)
)
