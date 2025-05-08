(define (problem test19)
  (:domain sokoban)
  (:objects
    pos-0-5
    pos-0-6
    pos-1-1
    pos-1-2
    pos-1-3
    pos-1-5
    pos-1-6
    pos-2-1
    pos-2-3
    pos-3-1
    pos-3-2
    pos-3-3
    pos-3-4
    pos-3-5
    pos-4-1
    pos-4-2
    pos-4-3
    pos-4-4
    pos-4-5
    pos-5-2
    pos-5-3
    pos-6-1
    pos-6-2
    pos-6-3
    pos-6-5
    pos-6-6
    pos-7-1
    pos-7-2
    pos-7-3
    pos-7-5
    pos-7-6
    pos-8-1
    pos-8-2
    pos-8-3
    pos-8-5
    pos-8-6
    pos-9-5
    pos-9-6
    box1
    box2
    box3
    box4
    up
    down
    left
    right
  )
  (:init
    (opposite up down)
    (opposite down up)
    (opposite left right)
    (opposite right left)
    (neighbor pos-0-5 pos-0-6 down)
    (neighbor pos-0-5 pos-1-5 right)
    (neighbor pos-0-6 pos-0-5 up)
    (neighbor pos-0-6 pos-1-6 right)
    (neighbor pos-1-1 pos-1-2 down)
    (neighbor pos-1-1 pos-2-1 right)
    (neighbor pos-1-2 pos-1-1 up)
    (neighbor pos-1-2 pos-1-3 down)
    (neighbor pos-1-3 pos-1-2 up)
    (neighbor pos-1-3 pos-2-3 right)
    (neighbor pos-1-5 pos-1-6 down)
    (neighbor pos-1-5 pos-0-5 left)
    (neighbor pos-1-6 pos-1-5 up)
    (neighbor pos-1-6 pos-0-6 left)
    (neighbor pos-2-1 pos-1-1 left)
    (neighbor pos-2-1 pos-3-1 right)
    (neighbor pos-2-3 pos-1-3 left)
    (neighbor pos-2-3 pos-3-3 right)
    (neighbor pos-3-1 pos-3-2 down)
    (neighbor pos-3-1 pos-2-1 left)
    (neighbor pos-3-1 pos-4-1 right)
    (neighbor pos-3-2 pos-3-1 up)
    (neighbor pos-3-2 pos-3-3 down)
    (neighbor pos-3-2 pos-4-2 right)
    (neighbor pos-3-3 pos-3-2 up)
    (neighbor pos-3-3 pos-3-4 down)
    (neighbor pos-3-3 pos-2-3 left)
    (neighbor pos-3-3 pos-4-3 right)
    (neighbor pos-3-4 pos-3-3 up)
    (neighbor pos-3-4 pos-3-5 down)
    (neighbor pos-3-4 pos-4-4 right)
    (neighbor pos-3-5 pos-3-4 up)
    (neighbor pos-3-5 pos-4-5 right)
    (neighbor pos-4-1 pos-4-2 down)
    (neighbor pos-4-1 pos-3-1 left)
    (neighbor pos-4-2 pos-4-1 up)
    (neighbor pos-4-2 pos-4-3 down)
    (neighbor pos-4-2 pos-3-2 left)
    (neighbor pos-4-2 pos-5-2 right)
    (neighbor pos-4-3 pos-4-2 up)
    (neighbor pos-4-3 pos-4-4 down)
    (neighbor pos-4-3 pos-3-3 left)
    (neighbor pos-4-3 pos-5-3 right)
    (neighbor pos-4-4 pos-4-3 up)
    (neighbor pos-4-4 pos-4-5 down)
    (neighbor pos-4-4 pos-3-4 left)
    (neighbor pos-4-5 pos-4-4 up)
    (neighbor pos-4-5 pos-3-5 left)
    (neighbor pos-5-2 pos-5-3 down)
    (neighbor pos-5-2 pos-4-2 left)
    (neighbor pos-5-2 pos-6-2 right)
    (neighbor pos-5-3 pos-5-2 up)
    (neighbor pos-5-3 pos-4-3 left)
    (neighbor pos-5-3 pos-6-3 right)
    (neighbor pos-6-1 pos-6-2 down)
    (neighbor pos-6-1 pos-7-1 right)
    (neighbor pos-6-2 pos-6-1 up)
    (neighbor pos-6-2 pos-6-3 down)
    (neighbor pos-6-2 pos-5-2 left)
    (neighbor pos-6-2 pos-7-2 right)
    (neighbor pos-6-3 pos-6-2 up)
    (neighbor pos-6-3 pos-5-3 left)
    (neighbor pos-6-3 pos-7-3 right)
    (neighbor pos-6-5 pos-6-6 down)
    (neighbor pos-6-5 pos-7-5 right)
    (neighbor pos-6-6 pos-6-5 up)
    (neighbor pos-6-6 pos-7-6 right)
    (neighbor pos-7-1 pos-7-2 down)
    (neighbor pos-7-1 pos-6-1 left)
    (neighbor pos-7-1 pos-8-1 right)
    (neighbor pos-7-2 pos-7-1 up)
    (neighbor pos-7-2 pos-7-3 down)
    (neighbor pos-7-2 pos-6-2 left)
    (neighbor pos-7-2 pos-8-2 right)
    (neighbor pos-7-3 pos-7-2 up)
    (neighbor pos-7-3 pos-6-3 left)
    (neighbor pos-7-3 pos-8-3 right)
    (neighbor pos-7-5 pos-7-6 down)
    (neighbor pos-7-5 pos-6-5 left)
    (neighbor pos-7-5 pos-8-5 right)
    (neighbor pos-7-6 pos-7-5 up)
    (neighbor pos-7-6 pos-6-6 left)
    (neighbor pos-7-6 pos-8-6 right)
    (neighbor pos-8-1 pos-8-2 down)
    (neighbor pos-8-1 pos-7-1 left)
    (neighbor pos-8-2 pos-8-1 up)
    (neighbor pos-8-2 pos-8-3 down)
    (neighbor pos-8-2 pos-7-2 left)
    (neighbor pos-8-3 pos-8-2 up)
    (neighbor pos-8-3 pos-7-3 left)
    (neighbor pos-8-5 pos-8-6 down)
    (neighbor pos-8-5 pos-7-5 left)
    (neighbor pos-8-5 pos-9-5 right)
    (neighbor pos-8-6 pos-8-5 up)
    (neighbor pos-8-6 pos-7-6 left)
    (neighbor pos-8-6 pos-9-6 right)
    (neighbor pos-9-5 pos-9-6 down)
    (neighbor pos-9-5 pos-8-5 left)
    (neighbor pos-9-6 pos-9-5 up)
    (neighbor pos-9-6 pos-8-6 left)
    (at-player pos-6-3)
    (at-box box1 pos-5-2)
    (at-box box2 pos-3-3)
    (at-box box3 pos-5-3)
    (at-box box4 pos-3-4)
    (is-goal pos-4-2)
    (is-goal pos-5-2)
    (is-goal pos-4-3)
    (is-goal pos-5-3)
  )
  (:goal
    (and
        (on-goal box1)
        (on-goal box2)
        (on-goal box3)
        (on-goal box4)
    )
  )
)
