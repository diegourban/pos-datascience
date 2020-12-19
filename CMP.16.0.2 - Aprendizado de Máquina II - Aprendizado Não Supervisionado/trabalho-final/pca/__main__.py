# -*- coding: UTF-8 -*-
from __init__ import main
from argparse import ArgumentParser

def parse_args():
    ap = ArgumentParser()

    ap.add_argument(
        '--images-path',
        type=str,
        required=True,
        help='Location of the images. For instance "/home/urban/Pictures/ORL"'
    )

    return ap.parse_args()

if __name__ == '__main__':
    main(parse_args())