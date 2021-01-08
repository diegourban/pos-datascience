# -*- coding: UTF-8 -*-

import cv2
import numpy as np
from matplotlib import pyplot as plt

def main(args):
    print('Welcome to the PCA Tool!')

    img = cv2.imread('watch.jpeg', cv2.IMREAD_GRAYSCALE)
    cv2.imshow('image', img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()