(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  
  (:predicates
    (neighbor ?from ?to ?dir)  ; La position 'to' est voisine de 'from' dans la direction 'dir'
    (opposite ?dir1 ?dir2)     ; Les directions dir1 et dir2 sont opposées
    (at-player ?pos)           ; Le joueur est à la position pos
    (at-box ?box ?pos)         ; La boîte box est à la position pos
    (is-goal ?pos)             ; La position pos est une cible
    (on-goal ?box)             ; La boîte box est sur une cible
  )

  ; Action pour déplacer le joueur d'une position à une autre
  (:action move
    :parameters (?from ?to ?dir)
    :precondition (and
      (at-player ?from)
      (neighbor ?from ?to ?dir)
      (not (exists (?b) (at-box ?b ?to)))
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
    )
  )

  ; Action pour pousser une boîte
  (:action push
    :parameters (?ppos ?bpos ?tpos ?dir ?box)
    :precondition (and
      (at-player ?ppos)
      (at-box ?box ?bpos)
      (neighbor ?ppos ?bpos ?dir)      ; La boîte est dans la direction 'dir' par rapport au joueur
      (neighbor ?bpos ?tpos ?dir)      ; La case cible est dans la même direction
      (not (exists (?b) (at-box ?b ?tpos)))  ; Pas de boîte à la position cible
    )
    :effect (and
      (not (at-player ?ppos))
      (at-player ?bpos)
      (not (at-box ?box ?bpos))
      (at-box ?box ?tpos)
      (when (is-goal ?tpos)            ; Si la nouvelle position est une cible
        (on-goal ?box)
      )
      (when (and (is-goal ?bpos) (not (is-goal ?tpos)))  ; Si on quitte une cible
        (not (on-goal ?box))
      )
    )
  )
)
