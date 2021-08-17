warning off
clear all
close all

fname = 'train_imgs/annotation.csv';
data = readtable(fname);
num_inst = size(data, 1);

imageFilename = cellstr(string('text'));
vehicle = mat2cell([], 0, 0);
train_82 = table(imageFilename,vehicle);
i = 1;
n = 1;
temp_name = strcat('train_imgs/', data.filename(1));
while(true)
    name = strcat('train_imgs/', data.filename(i));
    vehicle_inst = 1;
    while(string(temp_name) == string(name))
        shape_att = cell2mat(data.region_shape_attributes(i));
        comm = strfind(shape_att, ',');
        brack = strfind(shape_att, '}');
        indx = strfind(shape_att, 'x');
        indy = strfind(shape_att, 'y');
        indwidth = strfind(shape_att, 'width');
        indheight = strfind(shape_att, 'height');
        x = str2double(shape_att(indx + 2 + length('x'):comm(2) - 1));
        y = str2double(shape_att(indy + 2 + length('y'):comm(3) - 1));
        width = str2double(shape_att(indwidth + 2 + length('width'):comm(4) - 1));
        height = str2double(shape_att(indheight + 2 + length('height'):brack - 1));
        if vehicle_inst == 1
            vehicle_locations = [x y width height];
        else
            vehicle_locations = [vehicle_locations; x y width height];
        end
        vehicle_inst = vehicle_inst + 1;
        i = i + 1;
        if i >= size(data, 1)
            break;
        end
        temp_name = strcat('train_imgs/', data.filename(i));
    end
    train_82.vehicle(n) = mat2cell(vehicle_locations, vehicle_inst - 1, 4);
    train_82.imageFilename(n) = name;
    if i >= num_inst
        break;
    end
    n = n + 1;
end

imgno = 82;
I = imread(train_82.imageFilename{imgno});
I = insertShape(I, 'Rectangle', train_82.vehicle{imgno}, 'color', 'blue', 'LineWidth',5);
I = imresize(I,3);
figure;
title('Training Example')
imshow(I)