extends Node

# Global variables.

## Overall game score.
var score = 0

## Current level.
var level = 1

## Current lines cleared count.
var lines = 0


func Global_resetScores():
    score = 0
    level = 1
    lines = 0
# TODO(nkuang): add a updateScore(score, lines) function that will automatically
# update the level.
