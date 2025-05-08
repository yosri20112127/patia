(define (problem test25)
  (:domain sokoban)
  (:objects
    pos-0-8
    pos-0-9
    pos-1-1
    pos-1-2
    pos-1-3
    pos-1-4
    pos-1-5
    pos-1-6
    pos-1-8
    pos-1-9
    pos-2-1
    pos-2-6
    pos-2-8
    pos-2-9
    pos-3-1
    pos-3-3
    pos-3-4
    pos-3-5
    pos-3-6
    pos-4-1
    pos-4-3
    pos-4-5
    pos-4-6
    pos-4-7
    pos-4-8
    pos-5-1
    pos-5-3
    pos-5-4
    pos-5-5
    pos-5-6
    pos-5-7
    pos-5-8
    pos-6-1
    pos-6-5
    pos-6-6
    pos-6-7
    pos-7-1
    pos-7-2
    pos-7-3
    pos-7-4
    pos-7-5
    pos-7-6
    pos-7-9
    pos-8-4
    pos-8-5
    pos-8-6
    pos-8-8
    pos-8-9
    pos-9-0
    pos-9-1
    pos-9-2
    pos-9-8
    pos-9-9
    box1
    box2
    box3
    box4
    box5
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
    (neighbor pos-0-8 pos-0-9 down)
    (neighbor pos-0-8 pos-1-8 right)
    (neighbor pos-0-9 pos-0-8 up)
    (neighbor pos-0-9 pos-1-9 right)
    (neighbor pos-1-1 pos-1-2 down)
    (neighbor pos-1-1 pos-2-1 right)
    (neighbor pos-1-2 pos-1-1 up)
    (neighbor pos-1-2 pos-1-3 down)
    (neighbor pos-1-3 pos-1-2 up)
    (neighbor pos-1-3 pos-1-4 down)
    (neighbor pos-1-4 pos-1-3 up)
    (neighbor pos-1-4 pos-1-5 down)
    (neighbor pos-1-5 pos-1-4 up)
    (neighbor pos-1-5 pos-1-6 down)
    (neighbor pos-1-6 pos-1-5 up)
    (neighbor pos-1-6 pos-2-6 right)
    (neighbor pos-1-8 pos-1-9 down)
    (neighbor pos-1-8 pos-0-8 left)
    (neighbor pos-1-8 pos-2-8 right)
    (neighbor pos-1-9 pos-1-8 up)
    (neighbor pos-1-9 pos-0-9 left)
    (neighbor pos-1-9 pos-2-9 right)
    (neighbor pos-2-1 pos-1-1 left)
    (neighbor pos-2-1 pos-3-1 right)
    (neighbor pos-2-6 pos-1-6 left)
    (neighbor pos-2-6 pos-3-6 right)
    (neighbor pos-2-8 pos-2-9 down)
    (neighbor pos-2-8 pos-1-8 left)
    (neighbor pos-2-9 pos-2-8 up)
    (neighbor pos-2-9 pos-1-9 left)
    (neighbor pos-3-1 pos-2-1 left)
    (neighbor pos-3-1 pos-4-1 right)
    (neighbor pos-3-3 pos-3-4 down)
    (neighbor pos-3-3 pos-4-3 right)
    (neighbor pos-3-4 pos-3-3 up)
    (neighbor pos-3-4 pos-3-5 down)
    (neighbor pos-3-5 pos-3-4 up)
    (neighbor pos-3-5 pos-3-6 down)
    (neighbor pos-3-5 pos-4-5 right)
    (neighbor pos-3-6 pos-3-5 up)
    (neighbor pos-3-6 pos-2-6 left)
    (neighbor pos-3-6 pos-4-6 right)
    (neighbor pos-4-1 pos-3-1 left)
    (neighbor pos-4-1 pos-5-1 right)
    (neighbor pos-4-3 pos-3-3 left)
    (neighbor pos-4-3 pos-5-3 right)
    (neighbor pos-4-5 pos-4-6 down)
    (neighbor pos-4-5 pos-3-5 left)
    (neighbor pos-4-5 pos-5-5 right)
    (neighbor pos-4-6 pos-4-5 up)
    (neighbor pos-4-6 pos-4-7 down)
    (neighbor pos-4-6 pos-3-6 left)
    (neighbor pos-4-6 pos-5-6 right)
    (neighbor pos-4-7 pos-4-6 up)
    (neighbor pos-4-7 pos-4-8 down)
    (neighbor pos-4-7 pos-5-7 right)
    (neighbor pos-4-8 pos-4-7 up)
    (neighbor pos-4-8 pos-5-8 right)
    (neighbor pos-5-1 pos-4-1 left)
    (neighbor pos-5-1 pos-6-1 right)
    (neighbor pos-5-3 pos-5-4 down)
    (neighbor pos-5-3 pos-4-3 left)
    (neighbor pos-5-4 pos-5-3 up)
    (neighbor pos-5-4 pos-5-5 down)
    (neighbor pos-5-5 pos-5-4 up)
    (neighbor pos-5-5 pos-5-6 down)
    (neighbor pos-5-5 pos-4-5 left)
    (neighbor pos-5-5 pos-6-5 right)
    (neighbor pos-5-6 pos-5-5 up)
    (neighbor pos-5-6 pos-5-7 down)
    (neighbor pos-5-6 pos-4-6 left)
    (neighbor pos-5-6 pos-6-6 right)
    (neighbor pos-5-7 pos-5-6 up)
    (neighbor pos-5-7 pos-5-8 down)
    (neighbor pos-5-7 pos-4-7 left)
    (neighbor pos-5-7 pos-6-7 right)
    (neighbor pos-5-8 pos-5-7 up)
    (neighbor pos-5-8 pos-4-8 left)
    (neighbor pos-6-1 pos-5-1 left)
    (neighbor pos-6-1 pos-7-1 right)
    (neighbor pos-6-5 pos-6-6 down)
    (neighbor pos-6-5 pos-5-5 left)
    (neighbor pos-6-5 pos-7-5 right)
    (neighbor pos-6-6 pos-6-5 up)
    (neighbor pos-6-6 pos-6-7 down)
    (neighbor pos-6-6 pos-5-6 left)
    (neighbor pos-6-6 pos-7-6 right)
    (neighbor pos-6-7 pos-6-6 up)
    (neighbor pos-6-7 pos-5-7 left)
    (neighbor pos-7-1 pos-7-2 down)
    (neighbor pos-7-1 pos-6-1 left)
    (neighbor pos-7-2 pos-7-1 up)
    (neighbor pos-7-2 pos-7-3 down)
    (neighbor pos-7-3 pos-7-2 up)
    (neighbor pos-7-3 pos-7-4 down)
    (neighbor pos-7-4 pos-7-3 up)
    (neighbor pos-7-4 pos-7-5 down)
    (neighbor pos-7-4 pos-8-4 right)
    (neighbor pos-7-5 pos-7-4 up)
    (neighbor pos-7-5 pos-7-6 down)
    (neighbor pos-7-5 pos-6-5 left)
    (neighbor pos-7-5 pos-8-5 right)
    (neighbor pos-7-6 pos-7-5 up)
    (neighbor pos-7-6 pos-6-6 left)
    (neighbor pos-7-6 pos-8-6 right)
    (neighbor pos-7-9 pos-8-9 right)
    (neighbor pos-8-4 pos-8-5 down)
    (neighbor pos-8-4 pos-7-4 left)
    (neighbor pos-8-5 pos-8-4 up)
    (neighbor pos-8-5 pos-8-6 down)
    (neighbor pos-8-5 pos-7-5 left)
    (neighbor pos-8-6 pos-8-5 up)
    (neighbor pos-8-6 pos-7-6 left)
    (neighbor pos-8-8 pos-8-9 down)
    (neighbor pos-8-8 pos-9-8 right)
    (neighbor pos-8-9 pos-8-8 up)
    (neighbor pos-8-9 pos-7-9 left)
    (neighbor pos-8-9 pos-9-9 right)
    (neighbor pos-9-0 pos-9-1 down)
    (neighbor pos-9-1 pos-9-0 up)
    (neighbor pos-9-1 pos-9-2 down)
    (neighbor pos-9-2 pos-9-1 up)
    (neighbor pos-9-8 pos-9-9 down)
    (neighbor pos-9-8 pos-8-8 left)
    (neighbor pos-9-9 pos-9-8 up)
    (neighbor pos-9-9 pos-8-9 left)
    (at-player pos-4-8)
    (at-box box1 pos-5-5)
    (at-box box2 pos-2-6)
    (at-box box3 pos-5-6)
    (at-box box4 pos-4-7)
    (at-box box5 pos-5-7)
    (is-goal pos-3-5)
    (is-goal pos-5-5)
    (is-goal pos-6-5)
    (is-goal pos-2-6)
    (is-goal pos-5-7)
  )
  (:goal
    (and
        (on-goal box1)
        (on-goal box2)
        (on-goal box3)
        (on-goal box4)
        (on-goal box5)
    )
  )
)
