(define (problem blocks-7-2)
(:domain blocks)
(:objects e g c d f a b - block)
(:init (clear b) (clear a) (ontable f) (ontable d) (on b c) (on c g) (on g e)
 (on e f) (on a d) (handempty))
(:goal (and (on e b) (on b f) (on f d) (on d a) (on a c) (on c g)))
)
