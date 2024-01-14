import cv2
import math
import numpy as np


def transform():
    image = cv2.imread('image/12.JPG')
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # height = image.shape[0]
    # width = image.shape[1]
    # Img = np.zeros([height//2, width//2, 3], dtype=np.uint8)
    # for x in range(height//2):
    #     for y in range(width//2):
    #         Img[x][y] = image[2*x][2*y]

    Img = image[::2, ::2]

    # bit = 7
    # Img1 = gray // 2 * 2
    # Img2 = gray // 4 * 4
    # Img3 = gray // 16 * 16
    # Img4 = (gray // 128) * 255
    # """  """
    cv2.imshow("Image", Img)
    # cv2.imshow("Created 1 Image", Img1)
    # cv2.imshow("Created 2 Image", Img2)
    # cv2.imshow("Created 3 Image", Img3)
    # cv2.imshow("Created 4 Image", Img4)
    cv2.waitKey(0)


transform()
