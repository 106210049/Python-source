import cv2
from matplotlib import pyplot as plt
import numpy as np

Img = cv2.imread('image/34.jpg')
gray = cv2.cvtColor(Img, cv2.COLOR_BGR2GRAY)
[h, w] = gray.shape
sigma = 10
print(int(np.round(sigma * np.random.rand(h, w))))
# H1 = np.ones((3, 3), dtype=float)/9
# H2 = np.ones((5, 5), dtype=float)/25
# H3 = np.ones((9, 9), dtype=float)/81
# I1 = cv2.filter2D(gray, ddepth=-1, kernel=H1)
# cv2.imshow('Original', gray)
# cv2.imshow('Identity', I1)
cv2.waitKey(0)
