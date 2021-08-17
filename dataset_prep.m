close all;
clear all;

img_count = 9;
for i = 4:5
    video_filename = strcat('dataset_vids/vid',num2str(i),'.mp4');
    disp(video_filename)
    vR = VideoReader(video_filename);
    j = 0;
    while(hasFrame(vR))
        I = readFrame(vR);
        if mod(j, 10800) == 0
            filename = strcat('simulation_data/180sec_vid',num2str(i),'/img',num2str(img_count),'.png');
            disp(filename)
            imwrite(I, filename);
            img_count = img_count + 1;
        end
        j = j + 1;
    end
end

