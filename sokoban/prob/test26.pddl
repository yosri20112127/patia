(define (problem test26)
  (:domain sokoban)
  (:objects
    pos-0-1
    pos-0-6
    pos-0-7
    pos-0-8
    pos-1-1
    pos-1-3
    pos-1-4
    pos-1-6
    pos-1-7
    pos-1-8
    pos-2-3
    pos-2-4
    pos-3-1
    pos-3-2
    pos-3-3
    pos-3-4
    pos-3-5
    pos-3-6
    pos-3-7
    pos-4-0
    pos-4-1
    pos-4-2
    pos-4-3
    pos-4-4
    pos-4-5
    pos-4-6
    pos-4-7
    pos-5-0
    pos-5-2
    pos-5-4
    pos-6-0
    pos-6-2
    pos-6-3
    pos-6-4
    pos-6-6
    pos-6-7
    pos-6-8
    pos-7-0
    pos-7-3
    pos-7-4
    pos-7-6
    pos-7-7
    pos-7-8
    pos-8-0
    pos-8-1
    pos-8-3
    pos-8-4
    pos-8-6
    pos-8-7
    pos-8-8
    pos-9-0
    pos-9-1
    pos-9-3
    pos-9-4
    pos-9-6
    pos-9-7
    pos-9-8
    pos-10-0
    pos-10-1
    pos-10-6
    pos-10-7
    pos-10-8
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
    (neighbor pos-0-1 pos-1-1 right)
    (neighbor pos-0-6 pos-0-7 down)
    (neighbor pos-0-6 pos-1-6 right)
    (neighbor pos-0-7 pos-0-6 up)
    (neighbor pos-0-7 pos-0-8 down)
    (neighbor pos-0-7 pos-1-7 right)
    (neighbor pos-0-8 pos-0-7 up)
    (neighbor pos-0-8 pos-1-8 right)
    (neighbor pos-1-1 pos-0-1 left)
    (neighbor pos-1-3 pos-1-4 down)
    (neighbor pos-1-3 pos-2-3 right)
    (neighbor pos-1-4 pos-1-3 up)
    (neighbor pos-1-4 pos-2-4 right)
    (neighbor pos-1-6 pos-1-7 down)
    (neighbor pos-1-6 pos-0-6 left)
    (neighbor pos-1-7 pos-1-6 up)
    (neighbor pos-1-7 pos-1-8 down)
    (neighbor pos-1-7 pos-0-7 left)
    (neighbor pos-1-8 pos-1-7 up)
    (neighbor pos-1-8 pos-0-8 left)
    (neighbor pos-2-3 pos-2-4 down)
    (neighbor pos-2-3 pos-1-3 left)
    (neighbor pos-2-3 pos-3-3 right)
    (neighbor pos-2-4 pos-2-3 up)
    (neighbor pos-2-4 pos-1-4 left)
    (neighbor pos-2-4 pos-3-4 right)
    (neighbor pos-3-1 pos-3-2 down)
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
    (neighbor pos-3-4 pos-2-4 left)
    (neighbor pos-3-4 pos-4-4 right)
    (neighbor pos-3-5 pos-3-4 up)
    (neighbor pos-3-5 pos-3-6 down)
    (neighbor pos-3-5 pos-4-5 right)
    (neighbor pos-3-6 pos-3-5 up)
    (neighbor pos-3-6 pos-3-7 down)
    (neighbor pos-3-6 pos-4-6 right)
    (neighbor pos-3-7 pos-3-6 up)
    (neighbor pos-3-7 pos-4-7 right)
    (neighbor pos-4-0 pos-4-1 down)
    (neighbor pos-4-0 pos-5-0 right)
    (neighbor pos-4-1 pos-4-0 up)
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
    (neighbor pos-4-6 pos-4-7 down)
    (neighbor pos-4-6 pos-3-6 left)
    (neighbor pos-4-7 pos-4-6 up)
    (neighbor pos-4-7 pos-3-7 left)
    (neighbor pos-5-0 pos-4-0 left)
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
    (neighbor pos-6-3 pos-7-3 right)
    (neighbor pos-6-4 pos-6-3 up)
    (neighbor pos-6-4 pos-5-4 left)
    (neighbor pos-6-4 pos-7-4 right)
    (neighbor pos-6-6 pos-6-7 down)
    (neighbor pos-6-6 pos-7-6 right)
    (neighbor pos-6-7 pos-6-6 up)
    (neighbor pos-6-7 pos-6-8 down)
    (neighbor pos-6-7 pos-7-7 right)
    (neighbor pos-6-8 pos-6-7 up)
    (neighbor pos-6-8 pos-7-8 right)
    (neighbor pos-7-0 pos-6-0 left)
    (neighbor pos-7-0 pos-8-0 right)
    (neighbor pos-7-3 pos-7-4 down)
    (neighbor pos-7-3 pos-6-3 left)
    (neighbor pos-7-3 pos-8-3 right)
    (neighbor pos-7-4 pos-7-3 up)
    (neighbor pos-7-4 pos-6-4 left)
    (neighbor pos-7-4 pos-8-4 right)
    (neighbor pos-7-6 pos-7-7 down)
    (neighbor pos-7-6 pos-6-6 left)
    (neighbor pos-7-6 pos-8-6 right)
    (neighbor pos-7-7 pos-7-6 up)
    (neighbor pos-7-7 pos-7-8 down)
    (neighbor pos-7-7 pos-6-7 left)
    (neighbor pos-7-7 pos-8-7 right)
    (neighbor pos-7-8 pos-7-7 up)
    (neighbor pos-7-8 pos-6-8 left)
    (neighbor pos-7-8 pos-8-8 right)
    (neighbor pos-8-0 pos-8-1 down)
    (neighbor pos-8-0 pos-7-0 left)
    (neighbor pos-8-0 pos-9-0 right)
    (neighbor pos-8-1 pos-8-0 up)
    (neighbor pos-8-1 pos-9-1 right)
    (neighbor pos-8-3 pos-8-4 down)
    (neighbor pos-8-3 pos-7-3 left)
    (neighbor pos-8-3 pos-9-3 right)
    (neighbor pos-8-4 pos-8-3 up)
    (neighbor pos-8-4 pos-7-4 left)
    (neighbor pos-8-4 pos-9-4 right)
    (neighbor pos-8-6 pos-8-7 down)
    (neighbor pos-8-6 pos-7-6 left)
    (neighbor pos-8-6 pos-9-6 right)
    (neighbor pos-8-7 pos-8-6 up)
    (neighbor pos-8-7 pos-8-8 down)
    (neighbor pos-8-7 pos-7-7 left)
    (neighbor pos-8-7 pos-9-7 right)
    (neighbor pos-8-8 pos-8-7 up)
    (neighbor pos-8-8 pos-7-8 left)
    (neighbor pos-8-8 pos-9-8 right)
    (neighbor pos-9-0 pos-9-1 down)
    (neighbor pos-9-0 pos-8-0 left)
    (neighbor pos-9-0 pos-10-0 right)
    (neighbor pos-9-1 pos-9-0 up)
    (neighbor pos-9-1 pos-8-1 left)
    (neighbor pos-9-1 pos-10-1 right)
    (neighbor pos-9-3 pos-9-4 down)
    (neighbor pos-9-3 pos-8-3 left)
    (neighbor pos-9-4 pos-9-3 up)
    (neighbor pos-9-4 pos-8-4 left)
    (neighbor pos-9-6 pos-9-7 down)
    (neighbor pos-9-6 pos-8-6 left)
    (neighbor pos-9-6 pos-10-6 right)
    (neighbor pos-9-7 pos-9-6 up)
    (neighbor pos-9-7 pos-9-8 down)
    (neighbor pos-9-7 pos-8-7 left)
    (neighbor pos-9-7 pos-10-7 right)
    (neighbor pos-9-8 pos-9-7 up)
    (neighbor pos-9-8 pos-8-8 left)
    (neighbor pos-9-8 pos-10-8 right)
    (neighbor pos-10-0 pos-10-1 down)
    (neighbor pos-10-0 pos-9-0 left)
    (neighbor pos-10-1 pos-10-0 up)
    (neighbor pos-10-1 pos-9-1 left)
    (neighbor pos-10-6 pos-10-7 down)
    (neighbor pos-10-6 pos-9-6 left)
    (neighbor pos-10-7 pos-10-6 up)
    (neighbor pos-10-7 pos-10-8 down)
    (neighbor pos-10-7 pos-9-7 left)
    (neighbor pos-10-8 pos-10-7 up)
    (neighbor pos-10-8 pos-9-8 left)
    (at-player pos-4-6)
    (at-box box1 pos-4-2)
    (at-box box2 pos-7-3)
    (at-box box3 pos-3-4)
    (at-box box4 pos-6-4)
    (at-box box5 pos-3-5)
    (is-goal pos-4-2)
    (is-goal pos-5-2)
    (is-goal pos-3-3)
    (is-goal pos-3-4)
    (is-goal pos-3-5)
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
