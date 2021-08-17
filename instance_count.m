function n_instances = instance_count(I, vid)
    trained = load('matlab_rcnn.mat');
    detector = trained.frcnn;
    [bboxes,scores,label] = detect(detector,I);
    if vid == 1 % img_2
        corner1 = [0 650; 650 450; 650 585; 0 770];
        corner2 = [680, 400; 660 0; 780 0; 810 380];
        corner3 = [860 380; 830 0; 960 0; 985 380];
        corner4 = [1200 425; 1920 480; 1920 605; 1230 560];
        corner5 = [1230 590; 1920 640; 1920 750;1230 700];
        corner6 = [1000 700; 1050 1080; 890 1080; 850 700];
        corner7 = [830 750; 870 1080; 790 1080; 740 770];
        corner8 = [0 780; 660 600; 590 790; 0 950];
    elseif vid == 2 % img_6
        corner1 = [0 412; 866 450; 908 540; 80 504];
        corner2 = [1068 0; 1157 0; 1109 399; 1013 384];
        corner3 = [1190 2; 1281 0; 1224 399; 1148 333];
        corner4 = [1308 470; 1919 468; 1913 572; 1420 581];
        corner5 = [1424 626; 1919 594; 1917 681; 1392 687];
        corner6 = [1130 791; 1268 774; 1332 1077; 1187 1077];
        corner7 = [987 797; 1086 774; 1155 1077; 1050 1076];
        corner8 = [0 560; 900 600; 928 720; 0 684];
    elseif vid == 3
        corner1 = [0 650; 650 450; 650 585; 0 770];
        corner2 = [680, 400; 660 0; 780 0; 810 380];
        corner3 = [860 380; 830 0; 960 0; 985 380];
        corner4 = [1200 425; 1920 480; 1920 605; 1230 560];
        corner5 = [1230 590; 1920 640; 1920 750;1230 700];
        corner6 = [1000 700; 1050 1080; 890 1080; 850 700];
        corner7 = [830 750; 870 1080; 790 1080; 740 770];
        corner8 = [0 810; 660 610; 590 790; 0 950];
    elseif vid == 4 % img_6
        corner1 = [0 412; 866 450; 908 540; 80 504];
        corner2 = [1068 0; 1157 0; 1109 399; 1013 384];
        corner3 = [1190 2; 1281 0; 1224 399; 1148 333];
        corner4 = [1308 470; 1919 468; 1913 572; 1420 581];
        corner5 = [1424 626; 1919 594; 1917 681; 1392 687];
        corner6 = [1130 791; 1268 774; 1332 1077; 1187 1077];
        corner7 = [987 797; 1086 774; 1155 1077; 1050 1076];
        corner8 = [0 560; 900 600; 928 720; 0 684];
    elseif vid == 5 % img_9
        corner1 = [0 520; 740 340; 615 530; 0 670];
        corner2 = [810 0; 950 0; 955 315; 800 320];
        corner3 = [1000 0; 1130 0; 1130 315; 1000 310];
        corner4 = [1270 340; 1920 440;1920 550; 1300 530];
        corner5 = [1386 530; 1918 590; 1888 717; 1373 650];
        corner6 = [981 702; 1136 686; 1145 1079; 1000 1080];
        corner7 = [860 771; 937 792; 965 1080; 882 1074];
        corner8 = [0 680; 712 515; 680 700; 0 850];
    end
    n_instances = zeros(1, 8);
    for i = 1:length(bboxes)
        if (corner1(1, 2) - corner1(4, 2))*bboxes(i, 1) - (corner1(1, 1) - corner1(4, 1))*bboxes(i, 2) + corner1(4, 2)*corner1(1, 1) - corner1(4, 1)*corner1(1, 2) < 0 && (corner1(3, 2) - corner1(2, 2))*bboxes(i, 1) - (corner1(3, 1) - corner1(2, 1))*bboxes(i, 2) + corner1(2, 2)*corner1(3, 1) - corner1(2, 1)*corner1(3, 2) < 0 && (corner1(1, 2) - corner1(2, 2))*bboxes(i, 1) - (corner1(1, 1) - corner1(2, 1))*bboxes(i, 2) + corner1(2, 2)*corner1(1, 1) - corner1(2, 1)*corner1(1, 2) > 0 && (corner1(4, 2) - corner1(3, 2))*bboxes(i, 1) - (corner1(4, 1) - corner1(3, 1))*bboxes(i, 2) + corner1(3, 2)*corner1(4, 1) - corner1(3, 1)*corner1(4, 2) < 0 
            n_instances(1) = n_instances(1) + 1;
        end
        if (corner2(1, 2) - corner2(4, 2))*bboxes(i, 1) - (corner2(1, 1) - corner2(4, 1))*bboxes(i, 2) + corner2(4, 2)*corner2(1, 1) - corner2(4, 1)*corner2(1, 2) < 0 && (corner2(3, 2) - corner2(2, 2))*bboxes(i, 1) - (corner2(3, 1) - corner2(2, 1))*bboxes(i, 2) + corner2(2, 2)*corner2(3, 1) - corner2(2, 1)*corner2(3, 2) < 0 && (corner2(1, 2) - corner2(2, 2))*bboxes(i, 1) - (corner2(1, 1) - corner2(2, 1))*bboxes(i, 2) + corner2(2, 2)*corner2(1, 1) - corner2(2, 1)*corner2(1, 2) > 0 && (corner2(4, 2) - corner2(3, 2))*bboxes(i, 1) - (corner2(4, 1) - corner2(3, 1))*bboxes(i, 2) + corner2(3, 2)*corner2(4, 1) - corner2(3, 1)*corner2(4, 2) < 0
            n_instances(2) = n_instances(2) + 1;
        end
        if (corner3(1, 2) - corner3(4, 2))*bboxes(i, 1) - (corner3(1, 1) - corner3(4, 1))*bboxes(i, 2) + corner3(4, 2)*corner3(1, 1) - corner3(4, 1)*corner3(1, 2) < 0 && (corner3(3, 2) - corner3(2, 2))*bboxes(i, 1) - (corner3(3, 1) - corner3(2, 1))*bboxes(i, 2) + corner3(2, 2)*corner3(3, 1) - corner3(2, 1)*corner3(3, 2) < 0 && (corner3(1, 2) - corner3(2, 2))*bboxes(i, 1) - (corner3(1, 1) - corner3(2, 1))*bboxes(i, 2) + corner3(2, 2)*corner3(1, 1) - corner3(2, 1)*corner3(1, 2) > 0 && (corner3(4, 2) - corner3(3, 2))*bboxes(i, 1) - (corner3(4, 1) - corner3(3, 1))*bboxes(i, 2) + corner3(3, 2)*corner3(4, 1) - corner3(3, 1)*corner3(4, 2) < 0 
            n_instances(3) = n_instances(3) + 1;
        end
        if (corner4(1, 2) - corner4(4, 2))*bboxes(i, 1) - (corner4(1, 1) - corner4(4, 1))*bboxes(i, 2) + corner4(4, 2)*corner4(1, 1) - corner4(4, 1)*corner4(1, 2) < 0 && (corner4(3, 2) - corner4(2, 2))*bboxes(i, 1) - (corner4(3, 1) - corner4(2, 1))*bboxes(i, 2) + corner4(2, 2)*corner4(3, 1) - corner4(2, 1)*corner4(3, 2) < 0 && (corner4(1, 2) - corner4(2, 2))*bboxes(i, 1) - (corner4(1, 1) - corner4(2, 1))*bboxes(i, 2) + corner4(2, 2)*corner4(1, 1) - corner4(2, 1)*corner4(1, 2) > 0 && (corner4(4, 2) - corner4(3, 2))*bboxes(i, 1) - (corner4(4, 1) - corner4(3, 1))*bboxes(i, 2) + corner4(3, 2)*corner4(4, 1) - corner4(3, 1)*corner4(4, 2) < 0
            n_instances(4) = n_instances(4) + 1;
        end
        if (corner5(1, 2) - corner5(4, 2))*bboxes(i, 1) - (corner5(1, 1) - corner5(4, 1))*bboxes(i, 2) + corner5(4, 2)*corner5(1, 1) - corner5(4, 1)*corner5(1, 2) < 0 && (corner5(3, 2) - corner5(2, 2))*bboxes(i, 1) - (corner5(3, 1) - corner5(2, 1))*bboxes(i, 2) + corner5(2, 2)*corner5(3, 1) - corner5(2, 1)*corner5(3, 2) < 0 && (corner5(1, 2) - corner5(2, 2))*bboxes(i, 1) - (corner5(1, 1) - corner5(2, 1))*bboxes(i, 2) + corner5(2, 2)*corner5(1, 1) - corner5(2, 1)*corner5(1, 2) > 0 && (corner5(4, 2) - corner5(3, 2))*bboxes(i, 1) - (corner5(4, 1) - corner5(3, 1))*bboxes(i, 2) + corner5(3, 2)*corner5(4, 1) - corner5(3, 1)*corner5(4, 2) < 0
            n_instances(5) = n_instances(5) + 1;
        end
        if (corner6(1, 2) - corner6(4, 2))*bboxes(i, 1) - (corner6(1, 1) - corner6(4, 1))*bboxes(i, 2) + corner6(4, 2)*corner6(1, 1) - corner6(4, 1)*corner6(1, 2) < 0 && (corner6(3, 2) - corner6(2, 2))*bboxes(i, 1) - (corner6(3, 1) - corner6(2, 1))*bboxes(i, 2) + corner6(2, 2)*corner6(3, 1) - corner6(2, 1)*corner6(3, 2) < 0 && (corner6(1, 2) - corner6(2, 2))*bboxes(i, 1) - (corner6(1, 1) - corner6(2, 1))*bboxes(i, 2) + corner6(2, 2)*corner6(1, 1) - corner6(2, 1)*corner6(1, 2) > 0 && (corner6(4, 2) - corner6(3, 2))*bboxes(i, 1) - (corner6(4, 1) - corner6(3, 1))*bboxes(i, 2) + corner6(3, 2)*corner6(4, 1) - corner6(3, 1)*corner6(4, 2) < 0
            n_instances(6) = n_instances(6) + 1;
        end
        if (corner7(1, 2) - corner7(4, 2))*bboxes(i, 1) - (corner7(1, 1) - corner7(4, 1))*bboxes(i, 2) + corner7(4, 2)*corner7(1, 1) - corner7(4, 1)*corner7(1, 2) < 0 && (corner7(3, 2) - corner7(2, 2))*bboxes(i, 1) - (corner7(3, 1) - corner7(2, 1))*bboxes(i, 2) + corner7(2, 2)*corner7(3, 1) - corner7(2, 1)*corner7(3, 2) < 0 && (corner7(1, 2) - corner7(2, 2))*bboxes(i, 1) - (corner7(1, 1) - corner7(2, 1))*bboxes(i, 2) + corner7(2, 2)*corner7(1, 1) - corner7(2, 1)*corner7(1, 2) > 0 && (corner7(4, 2) - corner7(3, 2))*bboxes(i, 1) - (corner7(4, 1) - corner7(3, 1))*bboxes(i, 2) + corner7(3, 2)*corner7(4, 1) - corner7(3, 1)*corner7(4, 2) < 0
            n_instances(7) = n_instances(7) + 1;
        end
        if (corner8(1, 2) - corner8(4, 2))*bboxes(i, 1) - (corner8(1, 1) - corner8(4, 1))*bboxes(i, 2) + corner8(4, 2)*corner8(1, 1) - corner8(4, 1)*corner8(1, 2) < 0 && (corner8(3, 2) - corner8(2, 2))*bboxes(i, 1) - (corner8(3, 1) - corner8(2, 1))*bboxes(i, 2) + corner8(2, 2)*corner8(3, 1) - corner8(2, 1)*corner8(3, 2) < 0 && (corner8(1, 2) - corner8(2, 2))*bboxes(i, 1) - (corner8(1, 1) - corner8(2, 1))*bboxes(i, 2) + corner8(2, 2)*corner8(1, 1) - corner8(2, 1)*corner8(1, 2) > 0 && (corner8(4, 2) - corner8(3, 2))*bboxes(i, 1) - (corner8(4, 1) - corner8(3, 1))*bboxes(i, 2) + corner8(3, 2)*corner8(4, 1) - corner8(3, 1)*corner8(4, 2) < 0
            n_instances(8) = n_instances(8) + 1;
        end
    end
end