clear;
[fileList, index] = getAllFiles('/Users/guichengwu/Desktop/ecs271_assignment 3/Images');
fileList = reshape(fileList, length(fileList), 1);
fileList = fileList(2:length(fileList), 1);

dataMatrix = [];
for i = 1:length(fileList)
    
    sampleData = imread(char(fileList(i)));
    sampleData = (reshape(sampleData, [], 1));  %each column is one image data
    dataMatrix = [dataMatrix(:,:) sampleData];
end

kernelMatrix = PCAKernel(dataMatrix, 'polynomial');
[projectedData, projectionVectors] = PCA(kernelMatrix, 3);

projectionVectors = double(dataMatrix) * projectionVectors;

% convert the PC to 60*64 matrix
PVM1 = reshape(projectionVectors(:, 1), 60, 64);
PVM2 = reshape(projectionVectors(:, 2), 60, 64);
PVM3 = reshape(projectionVectors(:, 3), 60, 64);

figure;
imagesc(PVM1);
colormap(gray);

figure;
imagesc(PVM2);
colormap(gray);

figure;
imagesc(PVM3);
colormap(gray);

figure;
scatter3(projectedData(1,:), projectedData(2,:), projectedData(3,:));
a = ones(size(projectedData(1, :))) * 25;
%scatter matrix figure according to poistion
figure;
scatter3(projectedData(1,:), projectedData(2,:), projectedData(3,:), a, index(2:end, 1));
%scatter matrix figure according to emotion
figure;
scatter3(projectedData(1,:), projectedData(2,:), projectedData(3,:), a, index(2:end, 2));
%scatter matrix figure according to glass
figure;
colormap(lines);
scatter3(projectedData(1,:), projectedData(2,:), projectedData(3,:), a, index(2:end, 3));
%scatter matrix figure according to name
figure;
scatter3(projectedData(1,:), projectedData(2,:), projectedData(3,:), a, index(2:end, 4));
    