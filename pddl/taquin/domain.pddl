(define (domain taquin)
  (:requirements :strips :typing)
  (:types tile position)
  (:constants
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 - position
  )
  (:predicates
    (at ?t - tile ?p - position)
    (empty ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  ;; Déplacer une tuile vers la case vide
  (:action move
    :parameters (?t - tile ?from - position ?to - position)
    :precondition (and
      (at ?t ?from)      ; La tuile ?t est à la position ?from
      (empty ?to)        ; La position cible est vide
      (adjacent ?from ?to) ; Les deux positions sont adjacentes
    )
    :effect (and
      (not (at ?t ?from)) ; Enlever la tuile de la position initiale
      (at ?t ?to)         ; Mettre la tuile à la nouvelle position
      (not (empty ?to))   ; La position cible n'est plus vide
      (empty ?from)       ; L'ancienne position devient vide
    )
  )
)
