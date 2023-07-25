# This script clears pixels randomly from a given PNG.
# Usage: python sprite_generator.py

from PIL import Image
import numpy as np
import ipdb
import random

BLACK_PIXEL = np.array([0, 0, 0, 0]).astype(np.uint8)
PIXEL_WIDTH = 32
PIXEL_LENGTH = 32
PIXELS_CLEARED_PER_ROUND = 120
TOTAL_NUM_PIXELS = PIXEL_WIDTH * PIXEL_LENGTH
RESULT_PATH = 'sprite_images/sprite_{}.png'

path = 'cleared-block.png'
image = Image.open(path)
image = np.asarray(image)

# ipdb.set_trace()

# Test: Set to all black.
resulting_image_arr = np.array(image, dtype=np.uint8)

pixel_processed = np.zeros((PIXEL_WIDTH, PIXEL_LENGTH)).astype(np.uint8)
num_pixels_processed = 0
num_round = 0

# Implement set to prevent coordinates collision.
coordinates = set()

for px_x in range(PIXEL_WIDTH):
    for px_y in range(PIXEL_LENGTH):
        coordinates.add((px_x, px_y))

# First try 5 rounds
while num_pixels_processed < TOTAL_NUM_PIXELS:
    #pixels_to_clear = np.random.uniform(low=0, high=PIXEL_WIDTH-1, size=(PIXELS_CLEARED_PER_ROUND,2)).astype(np.uint8)
    for j in range(PIXELS_CLEARED_PER_ROUND):
        if not coordinates:
            break
        pixels_to_clear = random.choice(tuple(coordinates))
        px_x = pixels_to_clear[0]
        px_y = pixels_to_clear[1]
        
        # If this pixel is already processed, skip it.
        if (pixel_processed[px_x][px_y]):
            continue
        else:
            resulting_image_arr[px_x][px_y] = BLACK_PIXEL
            num_pixels_processed += 1
            pixel_processed[px_x][px_y] = 1

            coordinates.remove(pixels_to_clear)


    resulting_image = Image.fromarray(resulting_image_arr)
    resulting_image.save(RESULT_PATH.format(num_round))

    num_round +=1
    print(f'Number of pixels processed: {num_pixels_processed}')

print(f'Finished generating sprites. Total rounds: {num_round}')

