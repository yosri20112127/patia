(define (problem test13)
  (:domain sokoban)
  (:objects
    pos-0-6
    pos-0-7
    pos-1-2
    pos-1-3
    pos-1-4
    pos-1-6
    pos-1-7
    pos-2-1
    pos-2-2
    pos-2-4
    pos-3-1
    pos-3-2
    pos-3-3
    pos-3-4
    pos-3-5
    pos-3-6
    pos-4-1
    pos-4-2
    pos-4-3
    pos-4-4
    pos-4-5
    pos-4-6
    pos-5-0
    pos-5-2
    pos-5-4
    pos-6-0
    pos-6-2
    pos-6-3
    pos-6-4
    pos-6-6
    pos-6-7
    pos-7-0
    pos-7-6
    pos-7-7
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
    (neighbor pos-0-6 pos-0-7 down)
    (neighbor pos-0-6 pos-1-6 right)
    (neighbor pos-0-7 pos-0-6 up)
    (neighbor pos-0-7 pos-1-7 right)
    (neighbor pos-1-2 pos-1-3 down)
    (neighbor pos-1-2 pos-2-2 right)
    (neighbor pos-1-3 pos-1-2 up)
    (neighbor pos-1-3 pos-1-4 down)
    (neighbor pos-1-4 pos-1-3 up)
    (neighbor pos-1-4 pos-2-4 right)
    (neighbor pos-1-6 pos-1-7 down)
    (neighbor pos-1-6 pos-0-6 left)
    (neighbor pos-1-7 pos-1-6 up)
    (neighbor pos-1-7 pos-0-7 left)
    (neighbor pos-2-1 pos-2-2 down)
    (neighbor pos-2-1 pos-3-1 right)
    (neighbor pos-2-2 pos-2-1 up)
    (neighbor pos-2-2 pos-1-2 left)
    (neighbor pos-2-2 pos-3-2 right)
    (neighbor pos-2-4 pos-1-4 left)
    (neighbor pos-2-4 pos-3-4 right)
    (neighbor pos-3-1 pos-3-2 down)
    (neighbor pos-3-1 pos-2-1 left)
    (neighbor pos-3-1 pos-4-1 right)
    (neighbor pos-3-2 pos-3-1 up)
    (neighbor pos-3-2 pos-3-3 down)
    (neighbor pos-3-2 pos-2-2 left)
    (neighbor pos-3-2 pos-4-2 right)
    (neighbor pos-3-3 pos-3-2 up)
    (neighbor pos-3-3 pos-3-4 down)
    (neighbor pos-3-3 pos-4-3 right)
    (neighbor pos-3-4 pos-3-3 up)
    (neighbor pos-3-4 pos-3-5 down)
    (neighbor pos-3-4 pos-2-4 left)
    (neighbor pos-3-4 pos-4-4 right)
    (neighbor pos-3-5 pos-3-4 up)
    (neighbor pos-3-5 pos-3-6 down)
    (neighbor pos-3-5 pos-4-5 right)
    (neighbor pos-3-6 pos-3-5 up)
    (neighbor pos-3-6 pos-4-6 right)
    (neighbor pos-4-1 pos-4-2 down)
    (neighbor pos-4-1 pos-3-1 left)
    (neighbor pos-4-2 pos-4-1 up)
    (neighbor pos-4-2 pos-4-3 down)
    (neighbor pos-4-2 pos-3-2 left)
    (neighbor pos-4-2 pos-5-2 right)
    (neighbor pos-4-3 pos-4-2 up)
    (neighbor pos-4-3 pos-4-4 down)
    (neighbor pos-4-3 pos-3-3 left)
    (neighbor pos-4-4 pos-4-3 up)
    (neighbor pos-4-4 pos-4-5 down)
    (neighbor pos-4-4 pos-3-4 left)
    (neighbor pos-4-4 pos-5-4 right)
    (neighbor pos-4-5 pos-4-4 up)
    (neighbor pos-4-5 pos-4-6 down)
    (neighbor pos-4-5 pos-3-5 left)
    (neighbor pos-4-6 pos-4-5 up)
    (neighbor pos-4-6 pos-3-6 left)
    (neighbor pos-5-0 pos-6-0 right)
    (neighbor pos-5-2 pos-4-2 left)
    (neighbor pos-5-2 pos-6-2 right)
    (neighbor pos-5-4 pos-4-4 left)
    (neighbor pos-5-4 pos-6-4 right)
    (neighbor pos-6-0 pos-5-0 left)
    (neighbor pos-6-0 pos-7-0 right)
    (neighbor pos-6-2 pos-6-3 down)
    (neighbor pos-6-2 pos-5-2 left)
    (neighbor pos-6-3 pos-6-2 up)
    (neighbor pos-6-3 pos-6-4 down)
    (neighbor pos-6-4 pos-6-3 up)
    (neighbor pos-6-4 pos-5-4 left)
    (neighbor pos-6-6 pos-6-7 down)
    (neighbor pos-6-6 pos-7-6 right)
    (neighbor pos-6-7 pos-6-6 up)
    (neighbor pos-6-7 pos-7-7 right)
    (neighbor pos-7-0 pos-6-0 left)
    (neighbor pos-7-6 pos-7-7 down)
    (neighbor pos-7-6 pos-6-6 left)
    (neighbor pos-7-7 pos-7-6 up)
    (neighbor pos-7-7 pos-6-7 left)
    (at-player pos-3-6)
    (at-box box1 pos-4-3)
    (at-box box2 pos-4-4)
    (at-box box3 pos-3-5)
    (at-box box4 pos-4-5)
    (is-goal pos-3-2)
    (is-goal pos-4-2)
    (is-goal pos-3-3)
    (is-goal pos-4-4)
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
