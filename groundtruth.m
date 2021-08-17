
data = load('train_82.mat');
trainingData = data.train_82;

for i = 1:82
    I = imread(trainingData.imageFilename{i});
    I = insertShape(I, 'Rectangle', trainingData.vehicle{i}, 'color', 'blue', 'LineWidth',5);
    imwrite(I, strcat('grnd_truth/img',num2str(i),'.png'));
end