(define (domain taquin)
  (:requirements :strips :typing)
  (:types tile position)

  (:predicates
    (at ?t - tile ?p - position)  ; La tuile ?t est à la position ?p
    (empty ?p - position)         ; La position ?p est vide
    (adjacent ?p1 - position ?p2 - position) ; Les positions sont adjacentes
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
