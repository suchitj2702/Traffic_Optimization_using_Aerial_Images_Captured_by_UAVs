import matlab.engine
import numpy as np
from PIL import Image, ImageSequence
eng = matlab.engine.start_matlab()
import time

#eng.gpuDevice(1)

vid = Image.open("dataset_vids/vid1.mp4")

for frame in ImageSequence.Iterator(vid):
    start = time.time()
    I = matlab.uint8(list(frame.getdata()))
    I.reshape((img.size[0], img.size[1], 3))
    intance_count = eng.testFRCNN(I)
    end = time.time()
    print('Took '+str(round(((end - start)/60), 2))+' mins to process')
    print(intance_count)
