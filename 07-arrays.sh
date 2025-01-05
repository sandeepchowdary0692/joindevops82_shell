#!/bin/bash

MOVIES[0]="Pushpa" 
MOVIES[1]="RRR" 
MOVIES[2]="Devara"

#index starts from 0, size is 3

echo "First movie:${MOVIES[0]}"
echo "Second movie:${MOVIES[1]}"
echo "Thried movie:${MOVIES[2]}"

echo "All movie: ${MOVIES[@]}"