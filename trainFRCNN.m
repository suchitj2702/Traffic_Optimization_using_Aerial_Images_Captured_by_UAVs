close all;
clear all;
warning off;

data = load('train_82.mat');
trainingData = data.train_82;

imgno = randi(82, 1, 1);
I = imread(trainingData.imageFilename{imgno});

I = insertShape(I, 'Rectangle', trainingData.vehicle{imgno}, 'color', 'blue', 'LineWidth',5);
I = imresize(I,3);
figure;
title('Training Example')
imshow(I)

% Options for step 1.
optionsStage1 = trainingOptions('sgdm', ...
    'MaxEpochs', 10, ...
    'InitialLearnRate', 1e-3, ...
    'minibatchsize', 64, ...
    'VerboseFrequency', 4, ...
    'CheckpointPath', tempdir);

% Options for step 2.
optionsStage2 = trainingOptions('sgdm', ...
    'MaxEpochs', 10, ...
    'InitialLearnRate', 1e-3, ...
    'minibatchsize', 64, ...
    'VerboseFrequency', 4, ...
    'CheckpointPath', tempdir);

% Options for step 3.
optionsStage3 = trainingOptions('sgdm', ...
    'MaxEpochs', 10, ...
    'InitialLearnRate', 1e-3, ...
    'minibatchsize', 64, ...
    'VerboseFrequency', 4, ...
    'CheckpointPath', tempdir);

% Options for step 4.
optionsStage4 = trainingOptions('sgdm', ...
    'MaxEpochs', 10, ...
    'InitialLearnRate', 1e-3, ...
    'minibatchsize', 64, ...
    'VerboseFrequency', 4, ...
    'CheckpointPath', tempdir);

options = [
    optionsStage1
    optionsStage2
    optionsStage3
    optionsStage4
    ];

%gpuDevice();

net = alexnet;
layers = connectLayers(layers,net.Layer,net.Connections);
figure;
plot(layers);

frcnn = trainFasterRCNNObjectDetector(trainingData, net, options, 'SmallestImageDimension', 600);