import cv2
import cv2
from matplotlib import pyplot as plt
import numpy as np
from scipy import signal
Img = cv2.imread('image/34.jpg')
gray = cv2.cvtColor(Img, cv2.COLOR_BGR2GRAY)

H1 = np.ones((3, 3), dtype=float)/9
H2 = np.ones((5, 5), dtype=float)/25
H3 = np.ones((9, 9), dtype=float)/81
I1 = cv2.filter2D(gray, ddepth=-1, kernel=H1)
I2 = cv2.filter2D(gray, ddepth=-1, kernel=H2)
I3 = cv2.filter2D(gray, ddepth=-1, kernel=H3)
print(I1)
cv2.imshow('Original', gray)
cv2.imshow('Filter 1', I1)
cv2.imshow('Filter 2', I2)
cv2.imshow('Filter 3', I3)
cv2.waitKey(0)
