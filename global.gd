extends Node

# Global variables.

## Overall game score.
var score = 0

## Current level.
var level = 0

## Current lines cleared count.
var lines = 0

## Maps level to piece drop speed in seconds.
var speed_map = {
    0: 0.50,
    1: 0.48,
    2: 0.45,
    3: 0.41,
    4: 0.36,
    5: 0.30,
    6: 0.23,
    7: 0.16,
    8: 0.10,
    9: 0.05,
    10: 0.02,
}

# Maps level to number of lines required.
var level_map = {
    0: 10,
    1: 30,
    2: 60,
    3: 100,
    4: 150,
    5: 210,
    6: 280,
    7: 360,
    8: 450,
    9: 550,
    10: 650,
}


# Updates all scores accordingly.
func Global_updateScores(input_score: int, input_lines: int):
    score += input_score
    lines += input_lines
    if lines >= level_map[level]:
        level += 1


# Reset game scores.
func Global_resetScores():
    score = 0
    level = 0
    lines = 0
