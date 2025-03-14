(define (problem hanoi-4-disks)
  (:domain hanoi)
  (:objects 
    d1 d2 d3 d4 - disk  ; 4 disques (d1 le plus petit, d4 le plus grand)
    t1 t2 t3 - tower
  )
  (:init
    (on-tower d4 t1)
    (on-disk d3 d4) (on-disk d2 d3) (on-disk d1 d2)
    (on-top d1)
    (clear t2) (clear t3)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal (and
    (on-tower d4 t3)
    (on-disk d3 d4) (on-disk d2 d3) (on-disk d1 d2)
    (on-top d1)
    (clear t1) (clear t2) 
  ))
)
