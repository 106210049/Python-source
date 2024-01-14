import cv2
import math
import numpy as np
import random


def permImg():
    arr = [*range(16)]
    random.shuffle(arr)
    image = cv2.imread('image/12.JPG')
    height = image.shape[0]
    width = image.shape[1]
    w16 = width // 4
    h16 = height // 4
    cnt = 0
    img = np.zeros([16, h16, w16, 3], dtype=np.uint8)
    for k in range(4):
        for h in range(4):
            for x in range(h16):
                for y in range(w16):
                    img[cnt][x][y] = image[h16*k + x][w16 * h+y]
            cnt += 1

    ImgCreated = np.zeros([height, width, 3], dtype=np.uint8)
    i = 0
    for k in range(4):
        for h in range(4):
            for x in range(h16):
                for y in range(w16):
                    ImgCreated[h16*k + x][w16 * h+y] = img[arr[i]][x][y]
            i += 1
    cv2.imshow("Created Image", ImgCreated)
    cv2.waitKey(0)


permImg()
