import os
import random

i = 0
im_list = random.sample(range(1, 83), 82)
for filename in os.listdir("train_imgs"):
    os.rename("train_imgs" + "/" + filename, "train_imgs" + "/train_img_" + str(im_list[i]) + ".png")
    i = i + 1
    print(i)
