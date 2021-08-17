corner1 = [0 530; 740 350; 615 530; 0 670];
corner2 = [810 0; 950 0; 955 315; 800 320];
corner3 = [1000 0; 1130 0; 1130 315; 1000 310];
corner4 = [1270 350; 1920 440;1920 570; 1300 530];
corner5 = [1386 539; 1918 605; 1888 717; 1373 650];
corner6 = [981 702; 1136 686; 1145 1079; 1000 1080];
corner7 = [860 771; 937 792; 965 1080; 882 1074];
corner8 = [1 710; 712 543; 680 700; 0 850];
I = imread('train_imgs/train_img_9.png');
for i = 1:1080
    for j = 1:1920
        bboxes = [i j];
        if (corner1(1, 2) - corner1(4, 2))*bboxes(1, 2) - (corner1(1, 1) - corner1(4, 1))*bboxes(1, 1) + corner1(4, 2)*corner1(1, 1) - corner1(4, 1)*corner1(1, 2) < 0 && (corner1(3, 2) - corner1(2, 2))*bboxes(1, 2) - (corner1(3, 1) - corner1(2, 1))*bboxes(1, 1) + corner1(2, 2)*corner1(3, 1) - corner1(2, 1)*corner1(3, 2) < 0 && (corner1(1, 2) - corner1(2, 2))*bboxes(1, 2) - (corner1(1, 1) - corner1(2, 1))*bboxes(1, 1) + corner1(2, 2)*corner1(1, 1) - corner1(2, 1)*corner1(1, 2) > 0 && (corner1(4, 2) - corner1(3, 2))*bboxes(1, 2) - (corner1(4, 1) - corner1(3, 1))*bboxes(1, 1) + corner1(3, 2)*corner1(4, 1) - corner1(3, 1)*corner1(4, 2) < 0
            I(i, j) = 0;
        end
        if (corner2(1, 2) - corner2(4, 2))*bboxes(1, 2) - (corner2(1, 1) - corner2(4, 1))*bboxes(1, 1) + corner2(4, 2)*corner2(1, 1) - corner2(4, 1)*corner2(1, 2) < 0 && (corner2(3, 2) - corner2(2, 2))*bboxes(1, 2) - (corner2(3, 1) - corner2(2, 1))*bboxes(1, 1) + corner2(2, 2)*corner2(3, 1) - corner2(2, 1)*corner2(3, 2) < 0 && (corner2(1, 2) - corner2(2, 2))*bboxes(1, 2) - (corner2(1, 1) - corner2(2, 1))*bboxes(1, 1) + corner2(2, 2)*corner2(1, 1) - corner2(2, 1)*corner2(1, 2) > 0 && (corner2(4, 2) - corner2(3, 2))*bboxes(1, 2) - (corner2(4, 1) - corner2(3, 1))*bboxes(1, 1) + corner2(3, 2)*corner2(4, 1) - corner2(3, 1)*corner2(4, 2) < 0
            I(i, j) = 30;
        end
        if (corner3(1, 2) - corner3(4, 2))*bboxes(1, 2) - (corner3(1, 1) - corner3(4, 1))*bboxes(1, 1) + corner3(4, 2)*corner3(1, 1) - corner3(4, 1)*corner3(1, 2) < 0 && (corner3(3, 2) - corner3(2, 2))*bboxes(1, 2) - (corner3(3, 1) - corner3(2, 1))*bboxes(1, 1) + corner3(2, 2)*corner3(3, 1) - corner3(2, 1)*corner3(3, 2) < 0 && (corner3(1, 2) - corner3(2, 2))*bboxes(1, 2) - (corner3(1, 1) - corner3(2, 1))*bboxes(1, 1) + corner3(2, 2)*corner3(1, 1) - corner3(2, 1)*corner3(1, 2) > 0 && (corner3(4, 2) - corner3(3, 2))*bboxes(1, 2) - (corner3(4, 1) - corner3(3, 1))*bboxes(1, 1) + corner3(3, 2)*corner3(4, 1) - corner3(3, 1)*corner3(4, 2) < 0
            I(i, j) = 60;
        end
        if (corner4(1, 2) - corner4(4, 2))*bboxes(1, 2) - (corner4(1, 1) - corner4(4, 1))*bboxes(1, 1) + corner4(4, 2)*corner4(1, 1) - corner4(4, 1)*corner4(1, 2) < 0 && (corner4(3, 2) - corner4(2, 2))*bboxes(1, 2) - (corner4(3, 1) - corner4(2, 1))*bboxes(1, 1) + corner4(2, 2)*corner4(3, 1) - corner4(2, 1)*corner4(3, 2) < 0 && (corner4(1, 2) - corner4(2, 2))*bboxes(1, 2) - (corner4(1, 1) - corner4(2, 1))*bboxes(1, 1) + corner4(2, 2)*corner4(1, 1) - corner4(2, 1)*corner4(1, 2) > 0 && (corner4(4, 2) - corner4(3, 2))*bboxes(1, 2) - (corner4(4, 1) - corner4(3, 1))*bboxes(1, 1) + corner4(3, 2)*corner4(4, 1) - corner4(3, 1)*corner4(4, 2) < 0
            I(i, j) = 90;
        end
        if (corner5(1, 2) - corner5(4, 2))*bboxes(1, 2) - (corner5(1, 1) - corner5(4, 1))*bboxes(1, 1) + corner5(4, 2)*corner5(1, 1) - corner5(4, 1)*corner5(1, 2) < 0 && (corner5(3, 2) - corner5(2, 2))*bboxes(1, 2) - (corner5(3, 1) - corner5(2, 1))*bboxes(1, 1) + corner5(2, 2)*corner5(3, 1) - corner5(2, 1)*corner5(3, 2) < 0 && (corner5(1, 2) - corner5(2, 2))*bboxes(1, 2) - (corner5(1, 1) - corner5(2, 1))*bboxes(1, 1) + corner5(2, 2)*corner5(1, 1) - corner5(2, 1)*corner5(1, 2) > 0 && (corner5(4, 2) - corner5(3, 2))*bboxes(1, 2) - (corner5(4, 1) - corner5(3, 1))*bboxes(1, 1) + corner5(3, 2)*corner5(4, 1) - corner5(3, 1)*corner5(4, 2) < 0
            I(i, j) = 120;
        end
        if (corner6(1, 2) - corner6(4, 2))*bboxes(1, 2) - (corner6(1, 1) - corner6(4, 1))*bboxes(1, 1) + corner6(4, 2)*corner6(1, 1) - corner6(4, 1)*corner6(1, 2) < 0 && (corner6(3, 2) - corner6(2, 2))*bboxes(1, 2) - (corner6(3, 1) - corner6(2, 1))*bboxes(1, 1) + corner6(2, 2)*corner6(3, 1) - corner6(2, 1)*corner6(3, 2) < 0 && (corner6(1, 2) - corner6(2, 2))*bboxes(1, 2) - (corner6(1, 1) - corner6(2, 1))*bboxes(1, 1) + corner6(2, 2)*corner6(1, 1) - corner6(2, 1)*corner6(1, 2) > 0 && (corner6(4, 2) - corner6(3, 2))*bboxes(1, 2) - (corner6(4, 1) - corner6(3, 1))*bboxes(1, 1) + corner6(3, 2)*corner6(4, 1) - corner6(3, 1)*corner6(4, 2) < 0
            I(i, j) = 150;
        end
        if (corner7(1, 2) - corner7(4, 2))*bboxes(1, 2) - (corner7(1, 1) - corner7(4, 1))*bboxes(1, 1) + corner7(4, 2)*corner7(1, 1) - corner7(4, 1)*corner7(1, 2) < 0 && (corner7(3, 2) - corner7(2, 2))*bboxes(1, 2) - (corner7(3, 1) - corner7(2, 1))*bboxes(1, 1) + corner7(2, 2)*corner7(3, 1) - corner7(2, 1)*corner7(3, 2) < 0 && (corner7(1, 2) - corner7(2, 2))*bboxes(1, 2) - (corner7(1, 1) - corner7(2, 1))*bboxes(1, 1) + corner7(2, 2)*corner7(1, 1) - corner7(2, 1)*corner7(1, 2) > 0 && (corner7(4, 2) - corner7(3, 2))*bboxes(1, 2) - (corner7(4, 1) - corner7(3, 1))*bboxes(1, 1) + corner7(3, 2)*corner7(4, 1) - corner7(3, 1)*corner7(4, 2) < 0
            I(i, j) = 130;
        end
        if (corner8(1, 2) - corner8(4, 2))*bboxes(1, 2) - (corner8(1, 1) - corner8(4, 1))*bboxes(1, 1) + corner8(4, 2)*corner8(1, 1) - corner8(4, 1)*corner8(1, 2) < 0 && (corner8(3, 2) - corner8(2, 2))*bboxes(1, 2) - (corner8(3, 1) - corner8(2, 1))*bboxes(1, 1) + corner8(2, 2)*corner8(3, 1) - corner8(2, 1)*corner8(3, 2) < 0 && (corner8(1, 2) - corner8(2, 2))*bboxes(1, 2) - (corner8(1, 1) - corner8(2, 1))*bboxes(1, 1) + corner8(2, 2)*corner8(1, 1) - corner8(2, 1)*corner8(1, 2) > 0 && (corner8(4, 2) - corner8(3, 2))*bboxes(1, 2) - (corner8(4, 1) - corner8(3, 1))*bboxes(1, 1) + corner8(3, 2)*corner8(4, 1) - corner8(3, 1)*corner8(4, 2) < 0
            I(i, j) = 210;
        end
    end
end
imwrite(I, 'test.jpg')
        