(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk tower)
  
  (:predicates
    (on-disk ?x - disk ?y - disk)    ;le dsique x est sur le disque y
    (on-tower ?x - disk ?y - tower)   ;le disque x est sur la tour y
    (clear ?x - tower)              ;la tour est vide
    (smaller ?x - disk ?y - disk)     ;le disque x est plus petit que le disque y
    (on-top ?x - disk)            ;le disque x est en sommet de tour
  )

  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from-disk - disk ?to-disk - disk)
    :precondition (and
      (on-disk ?d ?from-disk) 
      (on-top ?d) 
      (on-top ?to-disk)
      (smaller ?d ?to-disk)
    )
    :effect (and
      (not (on-disk ?d ?from-disk))
      (not (on-top ?to-disk))
      (on-disk ?d ?to-disk)
      (on-top ?d)
      (on-top ?from-disk)
    )
  )

  (:action move-disk-from-tower-to-tower
    :parameters (?d - disk ?from-tower - tower ?to-tower - tower)
    :precondition (and
      (on-tower ?d ?from-tower)
      (on-top ?d)
      (clear ?to-tower)
    )
    :effect (and
      (not (on-tower ?d ?from-tower))
      (on-tower ?d ?to-tower)
      (on-top ?d)
      (not (clear ?to-tower))
      (clear ?from-tower)
    )
  )

  (:action move-disk-from-tower-to-disk
    :parameters (?d - disk ?from-tower - tower ?to-disk - disk)
    :precondition (and
      (on-tower ?d ?from-tower)
      (on-top ?d)
      (on-top ?to-disk)
      (smaller ?d ?to-disk)
    )
    :effect (and
      (not (on-tower ?d ?from-tower))
      (not (on-top ?to-disk))
      (on-disk ?d ?to-disk)
      (on-top ?d)
      (clear ?from-tower)
    )
  )

  (:action move-disk-from-disk-to-tower
    :parameters (?d - disk ?from-disk - disk ?to-tower - tower)
    :precondition (and
      (on-disk ?d ?from-disk)
      (on-top ?d)
      (clear ?to-tower)
    )
    :effect (and
      (not (on-disk ?d ?from-disk))
      (not (on-top ?d))
      (on-tower ?d ?to-tower)
      (on-top ?d)
      (not (clear ?to-tower))
      (on-top ?from-disk)
    )
  )
)
