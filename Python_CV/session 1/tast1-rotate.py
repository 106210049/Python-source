import cv2
import math
import numpy as np


def rotateOpenCV(image, anfa):
    height = image.shape[0]
    width = image.shape[1]
    cX = width // 2
    cY = height // 2
    M = cv2.getRotationMatrix2D((cX, cY), anfa, 1.0)
    rotated = cv2.warpAffine(image, M, (width, height))
    return rotated


def rotate(image, anfa):
    height = image.shape[0]
    width = image.shape[1]
    x0 = height // 2
    y0 = width // 2
    anfa = anfa*(math.pi)/180
    imageRotated = np.zeros([height, width, 3], dtype=np.uint8)
    for x in range(height):
        for y in range(width):
            xx = round(x0 + (x-x0)*math.cos(anfa) - (y-y0)*math.sin(anfa))
            yy = round(y0 + (x-x0)*math.sin(anfa) + (y-y0)*math.cos(anfa))
            for k in range(3):
                if 0 <= xx < height and 0 <= yy < width:
                    imageRotated[xx][yy][k] = image[x][y][k]
    return imageRotated


def rotateUpdate(image, anfa):
    height = image.shape[0]
    width = image.shape[1]
    x0 = height // 2
    y0 = width // 2
    anfa = anfa*(math.pi)/180
    imageRotated = np.zeros([height, width, 3], dtype=np.uint8)
    for x in range(height):
        for y in range(width):
            xx = x0 + (x-x0)*math.cos(anfa) - (y-y0)*math.sin(anfa)
            yy = y0 + (x-x0)*math.sin(anfa) + (y-y0)*math.cos(anfa)
            xxx = round(xx)
            yyy = round(yy)
            if abs(xxx-xx) <= 0.1:
                x1 = xxx
                x2 = xxx
                x3 = xxx
                x4 = xxx
            else:
                x1 = math.floor(xx)
                x2 = math.floor(xx)
                x3 = math.ceil(xx)
                x4 = math.ceil(xx)
            if abs(yyy-yy) <= 0.1:
                y1 = yyy
                y2 = yyy
                y3 = yyy
                y4 = yyy
            else:
                y1 = math.floor(yy)
                y2 = math.ceil(yy)
                y3 = math.floor(yy)
                y4 = math.ceil(yy)
            for k in range(3):
                if 0 <= x1 < height and 0 <= y1 < width:
                    imageRotated[x1][y1][k] = image[x][y][k]
                if 0 <= x2 < height and 0 <= y2 < width:
                    imageRotated[x2][y2][k] = image[x][y][k]
                if 0 <= x3 < height and 0 <= y3 < width:
                    imageRotated[x3][y3][k] = image[x][y][k]
                if 0 <= x4 < height and 0 <= y4 < width:
                    imageRotated[x4][y4][k] = image[x][y][k]
    return imageRotated


angle = 26
img = cv2.imread('fig-1.png')
a = rotateOpenCV(img, angle)
cv2.imshow("Rotated by OpenCV", a)
k = rotate(img, angle)
cv2.imshow("Rotate by formula", k)
k2 = rotateUpdate(img, angle)
cv2.imshow("Rotate by formula (Updated)", k2)
cv2.waitKey(0)
