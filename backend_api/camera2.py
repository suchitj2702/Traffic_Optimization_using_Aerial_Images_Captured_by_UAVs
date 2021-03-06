import cv2

class VideoCamera2(object):
    def __init__(self):
        # Using OpenCV to capture from device 0. If you have trouble capturing
        # from a webcam, comment the line below out and use a video file
        # instead.
        self.video2 = cv2.VideoCapture('vid2.mp4')
        # If you decide to use video.mp4, you must have this file in the folder
        # as the main.py.
        # self.video = cv2.VideoCapture('video.mp4')

    def __del__(self):
        self.video2.release()

    def get_frame(self):
        success2, image2 = self.video2.read()
        # We are using Motion JPEG, but OpenCV defaults to capture raw images,
        # so we must encode it into JPEG in order to correctly display the
        # video stream.
        ret2, jpeg2 = cv2.imencode('.jpg', image2)
        return jpeg2.tobytes()
