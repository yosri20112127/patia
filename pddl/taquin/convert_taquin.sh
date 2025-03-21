#!/bin/bash
#écrit les problèmes pddl correspondant aux taquins générés en python
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dossier_source> <dossier_cible>"
    exit 1
fi

SOURCE_DIR="$1"
TARGET_DIR="$2"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Le dossier source n'existe pas."
    exit 1
fi

mkdir -p "$TARGET_DIR"

generate_pddl() {
    local file="$1"
    local output_file="$2"

    read -r line < "$file"
    IFS=' ' read -r -a tiles <<< "$line"

    if [ "${#tiles[@]}" -ne 16 ]; then
        echo "Le fichier $file ne contient pas une configuration valide."
        return
    fi

    empty_pos=""
    for i in "${!tiles[@]}"; do
        if [ "${tiles[i]}" -eq 0 ]; then
            empty_pos="p$((i+1))"
            break
        fi
    done

    cat <<EOF > "$output_file"
(define (problem taquin-$(basename "$file" .txt))
  (:domain taquin)
  (:objects 
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - tile
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 - position
  )

  (:init
EOF

    for i in "${!tiles[@]}"; do
        if [ "${tiles[i]}" -ne 0 ]; then
            echo "    (at t${tiles[i]} p$((i+1)))" >> "$output_file"
        fi
    done

    echo "    (empty $empty_pos)" >> "$output_file"

    cat <<EOF >> "$output_file"

    (adjacent p1 p2) (adjacent p2 p3) (adjacent p3 p4)
    (adjacent p5 p6) (adjacent p6 p7) (adjacent p7 p8)
    (adjacent p9 p10) (adjacent p10 p11) (adjacent p11 p12)
    (adjacent p13 p14) (adjacent p14 p15) (adjacent p15 p16)
    
    (adjacent p1 p5) (adjacent p2 p6) (adjacent p3 p7) (adjacent p4 p8)
    (adjacent p5 p9) (adjacent p6 p10) (adjacent p7 p11) (adjacent p8 p12)
    (adjacent p9 p13) (adjacent p10 p14) (adjacent p11 p15) (adjacent p12 p16)

    (adjacent p2 p1) (adjacent p3 p2) (adjacent p4 p3)
    (adjacent p6 p5) (adjacent p7 p6) (adjacent p8 p7)
    (adjacent p10 p9) (adjacent p11 p10) (adjacent p12 p11)
    (adjacent p14 p13) (adjacent p15 p14) (adjacent p16 p15)
    
    (adjacent p5 p1) (adjacent p6 p2) (adjacent p7 p3) (adjacent p8 p4)
    (adjacent p9 p5) (adjacent p10 p6) (adjacent p11 p7) (adjacent p12 p8)
    (adjacent p13 p9) (adjacent p14 p10) (adjacent p15 p11) (adjacent p16 p12)
  )

  (:goal (and
    (at t1 p2) (at t2 p3) (at t3 p4)
    (at t4 p5) (at t5 p6) (at t6 p7) (at t7 p8)
    (at t8 p9) (at t9 p10) (at t10 p11) (at t11 p12)
    (at t12 p13) (at t13 p14) (at t14 p15) (at t15 p16)
    (empty p1)
  ))
)
EOF
}

for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        output_file="$TARGET_DIR/$(basename "$file" .txt).pddl"
        generate_pddl "$file" "$output_file"
        echo "Fichier généré : $output_file"
    fi
done
