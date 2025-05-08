(define (problem test27)
  (:domain sokoban)
  (:objects
    pos-0-1
    pos-0-2
    pos-0-3
    pos-0-4
    pos-1-1
    pos-1-2
    pos-1-3
    pos-1-4
    pos-1-6
    pos-1-7
    pos-1-8
    pos-1-9
    pos-2-6
    pos-2-9
    pos-3-1
    pos-3-2
    pos-3-3
    pos-3-4
    pos-3-5
    pos-3-6
    pos-3-7
    pos-3-9
    pos-4-0
    pos-4-1
    pos-4-2
    pos-4-3
    pos-4-4
    pos-4-5
    pos-4-7
    pos-4-9
    pos-5-0
    pos-5-4
    pos-5-5
    pos-5-6
    pos-5-7
    pos-5-9
    pos-6-0
    pos-6-1
    pos-6-4
    pos-6-5
    pos-6-9
    pos-7-0
    pos-7-1
    pos-7-3
    pos-7-4
    pos-7-7
    pos-7-8
    pos-7-9
    pos-8-0
    pos-8-1
    pos-8-3
    pos-8-4
    pos-8-5
    pos-8-6
    pos-8-7
    pos-9-0
    pos-9-1
    pos-9-3
    pos-9-4
    pos-9-9
    pos-9-10
    pos-10-0
    pos-10-1
    pos-10-6
    pos-10-7
    pos-10-8
    pos-10-9
    pos-10-10
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
    (neighbor pos-0-1 pos-0-2 down)
    (neighbor pos-0-1 pos-1-1 right)
    (neighbor pos-0-2 pos-0-1 up)
    (neighbor pos-0-2 pos-0-3 down)
    (neighbor pos-0-2 pos-1-2 right)
    (neighbor pos-0-3 pos-0-2 up)
    (neighbor pos-0-3 pos-0-4 down)
    (neighbor pos-0-3 pos-1-3 right)
    (neighbor pos-0-4 pos-0-3 up)
    (neighbor pos-0-4 pos-1-4 right)
    (neighbor pos-1-1 pos-1-2 down)
    (neighbor pos-1-1 pos-0-1 left)
    (neighbor pos-1-2 pos-1-1 up)
    (neighbor pos-1-2 pos-1-3 down)
    (neighbor pos-1-2 pos-0-2 left)
    (neighbor pos-1-3 pos-1-2 up)
    (neighbor pos-1-3 pos-1-4 down)
    (neighbor pos-1-3 pos-0-3 left)
    (neighbor pos-1-4 pos-1-3 up)
    (neighbor pos-1-4 pos-0-4 left)
    (neighbor pos-1-6 pos-1-7 down)
    (neighbor pos-1-6 pos-2-6 right)
    (neighbor pos-1-7 pos-1-6 up)
    (neighbor pos-1-7 pos-1-8 down)
    (neighbor pos-1-8 pos-1-7 up)
    (neighbor pos-1-8 pos-1-9 down)
    (neighbor pos-1-9 pos-1-8 up)
    (neighbor pos-1-9 pos-2-9 right)
    (neighbor pos-2-6 pos-1-6 left)
    (neighbor pos-2-6 pos-3-6 right)
    (neighbor pos-2-9 pos-1-9 left)
    (neighbor pos-2-9 pos-3-9 right)
    (neighbor pos-3-1 pos-3-2 down)
    (neighbor pos-3-1 pos-4-1 right)
    (neighbor pos-3-2 pos-3-1 up)
    (neighbor pos-3-2 pos-3-3 down)
    (neighbor pos-3-2 pos-4-2 right)
    (neighbor pos-3-3 pos-3-2 up)
    (neighbor pos-3-3 pos-3-4 down)
    (neighbor pos-3-3 pos-4-3 right)
    (neighbor pos-3-4 pos-3-3 up)
    (neighbor pos-3-4 pos-3-5 down)
    (neighbor pos-3-4 pos-4-4 right)
    (neighbor pos-3-5 pos-3-4 up)
    (neighbor pos-3-5 pos-3-6 down)
    (neighbor pos-3-5 pos-4-5 right)
    (neighbor pos-3-6 pos-3-5 up)
    (neighbor pos-3-6 pos-3-7 down)
    (neighbor pos-3-6 pos-2-6 left)
    (neighbor pos-3-7 pos-3-6 up)
    (neighbor pos-3-7 pos-4-7 right)
    (neighbor pos-3-9 pos-2-9 left)
    (neighbor pos-3-9 pos-4-9 right)
    (neighbor pos-4-0 pos-4-1 down)
    (neighbor pos-4-0 pos-5-0 right)
    (neighbor pos-4-1 pos-4-0 up)
    (neighbor pos-4-1 pos-4-2 down)
    (neighbor pos-4-1 pos-3-1 left)
    (neighbor pos-4-2 pos-4-1 up)
    (neighbor pos-4-2 pos-4-3 down)
    (neighbor pos-4-2 pos-3-2 left)
    (neighbor pos-4-3 pos-4-2 up)
    (neighbor pos-4-3 pos-4-4 down)
    (neighbor pos-4-3 pos-3-3 left)
    (neighbor pos-4-4 pos-4-3 up)
    (neighbor pos-4-4 pos-4-5 down)
    (neighbor pos-4-4 pos-3-4 left)
    (neighbor pos-4-4 pos-5-4 right)
    (neighbor pos-4-5 pos-4-4 up)
    (neighbor pos-4-5 pos-3-5 left)
    (neighbor pos-4-5 pos-5-5 right)
    (neighbor pos-4-7 pos-3-7 left)
    (neighbor pos-4-7 pos-5-7 right)
    (neighbor pos-4-9 pos-3-9 left)
    (neighbor pos-4-9 pos-5-9 right)
    (neighbor pos-5-0 pos-4-0 left)
    (neighbor pos-5-0 pos-6-0 right)
    (neighbor pos-5-4 pos-5-5 down)
    (neighbor pos-5-4 pos-4-4 left)
    (neighbor pos-5-4 pos-6-4 right)
    (neighbor pos-5-5 pos-5-4 up)
    (neighbor pos-5-5 pos-5-6 down)
    (neighbor pos-5-5 pos-4-5 left)
    (neighbor pos-5-5 pos-6-5 right)
    (neighbor pos-5-6 pos-5-5 up)
    (neighbor pos-5-6 pos-5-7 down)
    (neighbor pos-5-7 pos-5-6 up)
    (neighbor pos-5-7 pos-4-7 left)
    (neighbor pos-5-9 pos-4-9 left)
    (neighbor pos-5-9 pos-6-9 right)
    (neighbor pos-6-0 pos-6-1 down)
    (neighbor pos-6-0 pos-5-0 left)
    (neighbor pos-6-0 pos-7-0 right)
    (neighbor pos-6-1 pos-6-0 up)
    (neighbor pos-6-1 pos-7-1 right)
    (neighbor pos-6-4 pos-6-5 down)
    (neighbor pos-6-4 pos-5-4 left)
    (neighbor pos-6-4 pos-7-4 right)
    (neighbor pos-6-5 pos-6-4 up)
    (neighbor pos-6-5 pos-5-5 left)
    (neighbor pos-6-9 pos-5-9 left)
    (neighbor pos-6-9 pos-7-9 right)
    (neighbor pos-7-0 pos-7-1 down)
    (neighbor pos-7-0 pos-6-0 left)
    (neighbor pos-7-0 pos-8-0 right)
    (neighbor pos-7-1 pos-7-0 up)
    (neighbor pos-7-1 pos-6-1 left)
    (neighbor pos-7-1 pos-8-1 right)
    (neighbor pos-7-3 pos-7-4 down)
    (neighbor pos-7-3 pos-8-3 right)
    (neighbor pos-7-4 pos-7-3 up)
    (neighbor pos-7-4 pos-6-4 left)
    (neighbor pos-7-4 pos-8-4 right)
    (neighbor pos-7-7 pos-7-8 down)
    (neighbor pos-7-7 pos-8-7 right)
    (neighbor pos-7-8 pos-7-7 up)
    (neighbor pos-7-8 pos-7-9 down)
    (neighbor pos-7-9 pos-7-8 up)
    (neighbor pos-7-9 pos-6-9 left)
    (neighbor pos-8-0 pos-8-1 down)
    (neighbor pos-8-0 pos-7-0 left)
    (neighbor pos-8-0 pos-9-0 right)
    (neighbor pos-8-1 pos-8-0 up)
    (neighbor pos-8-1 pos-7-1 left)
    (neighbor pos-8-1 pos-9-1 right)
    (neighbor pos-8-3 pos-8-4 down)
    (neighbor pos-8-3 pos-7-3 left)
    (neighbor pos-8-3 pos-9-3 right)
    (neighbor pos-8-4 pos-8-3 up)
    (neighbor pos-8-4 pos-8-5 down)
    (neighbor pos-8-4 pos-7-4 left)
    (neighbor pos-8-4 pos-9-4 right)
    (neighbor pos-8-5 pos-8-4 up)
    (neighbor pos-8-5 pos-8-6 down)
    (neighbor pos-8-6 pos-8-5 up)
    (neighbor pos-8-6 pos-8-7 down)
    (neighbor pos-8-7 pos-8-6 up)
    (neighbor pos-8-7 pos-7-7 left)
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
    (neighbor pos-9-9 pos-9-10 down)
    (neighbor pos-9-9 pos-10-9 right)
    (neighbor pos-9-10 pos-9-9 up)
    (neighbor pos-9-10 pos-10-10 right)
    (neighbor pos-10-0 pos-10-1 down)
    (neighbor pos-10-0 pos-9-0 left)
    (neighbor pos-10-1 pos-10-0 up)
    (neighbor pos-10-1 pos-9-1 left)
    (neighbor pos-10-6 pos-10-7 down)
    (neighbor pos-10-7 pos-10-6 up)
    (neighbor pos-10-7 pos-10-8 down)
    (neighbor pos-10-8 pos-10-7 up)
    (neighbor pos-10-8 pos-10-9 down)
    (neighbor pos-10-9 pos-10-8 up)
    (neighbor pos-10-9 pos-10-10 down)
    (neighbor pos-10-9 pos-9-9 left)
    (neighbor pos-10-10 pos-10-9 up)
    (neighbor pos-10-10 pos-9-10 left)
    (at-player pos-3-1)
    (at-box box1 pos-3-2)
    (at-box box2 pos-4-3)
    (at-box box3 pos-4-4)
    (at-box box4 pos-8-4)
    (at-box box5 pos-5-6)
    (is-goal pos-4-2)
    (is-goal pos-3-3)
    (is-goal pos-3-5)
    (is-goal pos-6-5)
    (is-goal pos-3-6)
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
