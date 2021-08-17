close all;
clear all;

%% Testing the model on a video
% Calling the GPU object to train on onboard GPU's
gpuDevice();

% Loading the trained model
trained = load('matlab_rcnn.mat');
detector = trained.frcnn;

% Loading the video to process on
video_filename = 'dataset_vids/vid1.mp4';
vR = VideoReader(video_filename);

% Video to write into mp4
vW = VideoWriter('ProcessedVid','MPEG-4');
open(vW);
i = 0;
j = 1;
corner1 = [0 650; 650 450; 650 585; 0 770];
corner2 = [680, 400; 660 0; 780 0; 810 380];
corner3 = [860 380; 830 0; 960 0; 985 380];
corner4 = [1200 425; 1920 480; 1920 605; 1230 560];
corner5 = [1230 590; 1920 640; 1920 750;1230 700];
corner6 = [1000 700; 1050 1080; 890 1080; 850 700];
corner7 = [830 750; 870 1080; 790 1080; 740 770];
corner8 = [0 780; 660 600; 590 790; 0 950];

while(hasFrame(vR))
    if mod(i,300) == 0
        % Loading frames as images
        I = readFrame(vR);

        % Detecting classes in the frame
        [bboxes,scores,label] = detect(detector,I);
        % ignoring if no label is found in a frame
        if ~isempty(label)
            % Showing labels with score greater that 0.6(model is 60% sure)
            [scores, idx] = scorethreshold(scores, 0.1);
            newlabel=[];
            newbbox=[];
            for r = idx
                newbbox = [newbbox; bboxes(r, :)];
                newlabel = [newlabel label(r, :)];
            end
            corner1_bbox = [];
            corner1_label = [];
            for c = 1:size(newbbox, 1)
                if (corner1(1, 2) - corner1(4, 2))*newbbox(c, 1) - (corner1(1, 1) - corner1(4, 1))*newbbox(c, 2) + corner1(4, 2)*corner1(1, 1) - corner1(4, 1)*corner1(1, 2) < 0 && (corner1(3, 2) - corner1(2, 2))*newbbox(c, 1) - (corner1(3, 1) - corner1(2, 1))*newbbox(c, 2) + corner1(2, 2)*corner1(3, 1) - corner1(2, 1)*corner1(3, 2) < 0 && (corner1(1, 2) - corner1(2, 2))*newbbox(c, 1) - (corner1(1, 1) - corner1(2, 1))*newbbox(c, 2) + corner1(2, 2)*corner1(1, 1) - corner1(2, 1)*corner1(1, 2) > 0 && (corner1(4, 2) - corner1(3, 2))*newbbox(c, 1) - (corner1(4, 1) - corner1(3, 1))*newbbox(c, 2) + corner1(3, 2)*corner1(4, 1) - corner1(3, 1)*corner1(4, 2) < 0 || (corner2(1, 2) - corner2(4, 2))*bboxes(i, 1) - (corner2(1, 1) - corner2(4, 1))*bboxes(i, 2) + corner2(4, 2)*corner2(1, 1) - corner2(4, 1)*corner2(1, 2) < 0 && (corner2(3, 2) - corner2(2, 2))*bboxes(i, 1) - (corner2(3, 1) - corner2(2, 1))*bboxes(i, 2) + corner2(2, 2)*corner2(3, 1) - corner2(2, 1)*corner2(3, 2) < 0 && (corner2(1, 2) - corner2(2, 2))*bboxes(i, 1) - (corner2(1, 1) - corner2(2, 1))*bboxes(i, 2) + corner2(2, 2)*corner2(1, 1) - corner2(2, 1)*corner2(1, 2) > 0 && (corner2(4, 2) - corner2(3, 2))*bboxes(i, 1) - (corner2(4, 1) - corner2(3, 1))*bboxes(i, 2) + corner2(3, 2)*corner2(4, 1) - corner2(3, 1)*corner2(4, 2) < 0 || (corner3(1, 2) - corner3(4, 2))*bboxes(i, 1) - (corner3(1, 1) - corner3(4, 1))*bboxes(i, 2) + corner3(4, 2)*corner3(1, 1) - corner3(4, 1)*corner3(1, 2) < 0 && (corner3(3, 2) - corner3(2, 2))*bboxes(i, 1) - (corner3(3, 1) - corner3(2, 1))*bboxes(i, 2) + corner3(2, 2)*corner3(3, 1) - corner3(2, 1)*corner3(3, 2) < 0 && (corner3(1, 2) - corner3(2, 2))*bboxes(i, 1) - (corner3(1, 1) - corner3(2, 1))*bboxes(i, 2) + corner3(2, 2)*corner3(1, 1) - corner3(2, 1)*corner3(1, 2) > 0 && (corner3(4, 2) - corner3(3, 2))*bboxes(i, 1) - (corner3(4, 1) - corner3(3, 1))*bboxes(i, 2) + corner3(3, 2)*corner3(4, 1) - corner3(3, 1)*corner3(4, 2) < 0 || (corner4(1, 2) - corner4(4, 2))*bboxes(i, 1) - (corner4(1, 1) - corner4(4, 1))*bboxes(i, 2) + corner4(4, 2)*corner4(1, 1) - corner4(4, 1)*corner4(1, 2) < 0 && (corner4(3, 2) - corner4(2, 2))*bboxes(i, 1) - (corner4(3, 1) - corner4(2, 1))*bboxes(i, 2) + corner4(2, 2)*corner4(3, 1) - corner4(2, 1)*corner4(3, 2) < 0 && (corner4(1, 2) - corner4(2, 2))*bboxes(i, 1) - (corner4(1, 1) - corner4(2, 1))*bboxes(i, 2) + corner4(2, 2)*corner4(1, 1) - corner4(2, 1)*corner4(1, 2) > 0 && (corner4(4, 2) - corner4(3, 2))*bboxes(i, 1) - (corner4(4, 1) - corner4(3, 1))*bboxes(i, 2) + corner4(3, 2)*corner4(4, 1) - corner4(3, 1)*corner4(4, 2) < 0 || (corner5(1, 2) - corner5(4, 2))*bboxes(i, 1) - (corner5(1, 1) - corner5(4, 1))*bboxes(i, 2) + corner5(4, 2)*corner5(1, 1) - corner5(4, 1)*corner5(1, 2) < 0 && (corner5(3, 2) - corner5(2, 2))*bboxes(i, 1) - (corner5(3, 1) - corner5(2, 1))*bboxes(i, 2) + corner5(2, 2)*corner5(3, 1) - corner5(2, 1)*corner5(3, 2) < 0 && (corner5(1, 2) - corner5(2, 2))*bboxes(i, 1) - (corner5(1, 1) - corner5(2, 1))*bboxes(i, 2) + corner5(2, 2)*corner5(1, 1) - corner5(2, 1)*corner5(1, 2) > 0 && (corner5(4, 2) - corner5(3, 2))*bboxes(i, 1) - (corner5(4, 1) - corner5(3, 1))*bboxes(i, 2) + corner5(3, 2)*corner5(4, 1) - corner5(3, 1)*corner5(4, 2) < 0 || (corner6(1, 2) - corner6(4, 2))*bboxes(i, 1) - (corner6(1, 1) - corner6(4, 1))*bboxes(i, 2) + corner6(4, 2)*corner6(1, 1) - corner6(4, 1)*corner6(1, 2) < 0 && (corner6(3, 2) - corner6(2, 2))*bboxes(i, 1) - (corner6(3, 1) - corner6(2, 1))*bboxes(i, 2) + corner6(2, 2)*corner6(3, 1) - corner6(2, 1)*corner6(3, 2) < 0 && (corner6(1, 2) - corner6(2, 2))*bboxes(i, 1) - (corner6(1, 1) - corner6(2, 1))*bboxes(i, 2) + corner6(2, 2)*corner6(1, 1) - corner6(2, 1)*corner6(1, 2) > 0 && (corner6(4, 2) - corner6(3, 2))*bboxes(i, 1) - (corner6(4, 1) - corner6(3, 1))*bboxes(i, 2) + corner6(3, 2)*corner6(4, 1) - corner6(3, 1)*corner6(4, 2) < 0 || (corner7(1, 2) - corner7(4, 2))*bboxes(i, 1) - (corner7(1, 1) - corner7(4, 1))*bboxes(i, 2) + corner7(4, 2)*corner7(1, 1) - corner7(4, 1)*corner7(1, 2) < 0 && (corner7(3, 2) - corner7(2, 2))*bboxes(i, 1) - (corner7(3, 1) - corner7(2, 1))*bboxes(i, 2) + corner7(2, 2)*corner7(3, 1) - corner7(2, 1)*corner7(3, 2) < 0 && (corner7(1, 2) - corner7(2, 2))*bboxes(i, 1) - (corner7(1, 1) - corner7(2, 1))*bboxes(i, 2) + corner7(2, 2)*corner7(1, 1) - corner7(2, 1)*corner7(1, 2) > 0 && (corner7(4, 2) - corner7(3, 2))*bboxes(i, 1) - (corner7(4, 1) - corner7(3, 1))*bboxes(i, 2) + corner7(3, 2)*corner7(4, 1) - corner7(3, 1)*corner7(4, 2) < 0 || (corner8(1, 2) - corner8(4, 2))*bboxes(i, 1) - (corner8(1, 1) - corner8(4, 1))*bboxes(i, 2) + corner8(4, 2)*corner8(1, 1) - corner8(4, 1)*corner8(1, 2) < 0 && (corner8(3, 2) - corner8(2, 2))*bboxes(i, 1) - (corner8(3, 1) - corner8(2, 1))*bboxes(i, 2) + corner8(2, 2)*corner8(3, 1) - corner8(2, 1)*corner8(3, 2) < 0 && (corner8(1, 2) - corner8(2, 2))*bboxes(i, 1) - (corner8(1, 1) - corner8(2, 1))*bboxes(i, 2) + corner8(2, 2)*corner8(1, 1) - corner8(2, 1)*corner8(1, 2) > 0 && (corner8(4, 2) - corner8(3, 2))*bboxes(i, 1) - (corner8(4, 1) - corner8(3, 1))*bboxes(i, 2) + corner8(3, 2)*corner8(4, 1) - corner8(3, 1)*corner8(4, 2) < 0
                    corner1_bbox = [corner1_bbox; newbbox(c, :)];
                    corner1_label = [corner1_label newlabel(c, :)];
                end
            end
            % inserting bounding boxes and labels
            if ~isempty(corner1_label)
                I = insertObjectAnnotation(I,'rectangle',corner1_bbox, cellstr(corner1_label), 'color', 'blue', 'LineWidth',2,'TextColor','white', 'TextBoxOpacity',0.2,'FontSize',8);
            end
        end
        % writing the frame into the video
        file_name = strcat('test_img/test_infer_vid1',num2str(j),'.jpg');
        imwrite(I , file_name);
        disp(j)
        j = j + 1;
    end
    i = i + 1;
end

close(vW);