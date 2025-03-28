(define (domain sokoban)
  (:requirements :strips :typing)
  
  (:types
    location - object
    agent - object
    box - object
    direction - object
  )

  (:predicates
    (at ?e - (either agent box) ?l - location)
    (wall ?l - location)
    (is-goal ?l - location)
    (move-dir ?d - direction ?from - location ?to - location)
  )

  (:action move
    :parameters (?d - direction ?from - location ?to - location ?p - agent)
    :precondition (and 
                    (at ?p ?from)
                    (move-dir ?d ?from ?to)
                    (not (wall ?to)))
    :effect (and 
              (not (at ?p ?from))
              (at ?p ?to))
  )

  (:action push
    :parameters (?d - direction ?player-pos - location ?box-pos - location 
                 ?target-pos - location ?p - agent ?b - box)
    :precondition (and 
                    (at ?p ?player-pos)
                    (at ?b ?box-pos)
                    (move-dir ?d ?player-pos ?box-pos)
                    (move-dir ?d ?box-pos ?target-pos)
                    (not (wall ?target-pos)))
    :effect (and 
              (not (at ?p ?player-pos))
              (not (at ?b ?box-pos))
              (at ?p ?box-pos)
              (at ?b ?target-pos))
  )
)