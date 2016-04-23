% data - MxN matrix of input data, (M dimensions, N trials).
% dimensionSize is the dimension size we want to project into.
function [projectedData, projectionVectors] = PCA(data, dimensionSize)
% set default value
if ~exist('dimensionSize', 'var')
    dimensionSize = 3;
end

[M,N] = size(data);
% subtract off the mean for each dimension
mn = mean(data,2);
data = double(data) - repmat(mn,1,N);
% calculate the covariance matrix
covariance = 1 / (N-1) * (data * data');
% find the eigenvectors and eigenvalues
[eigVectors, eigValues] = eig(covariance);
% extract diagonal of matrix as vector
eigValues = diag(eigValues);
% sort the variances in decreasing order
[junk, rIndices] = sort(eigValues, 'descend');
eigValues = eigValues(rIndices);
eigValues = eigValues(1:dimensionSize);
eigVectors = eigVectors(:,rIndices);

%get the deimensionSize potential components
projectionVectors = eigVectors(:, 1:dimensionSize);
% project the original data set
projectedData = projectionVectors' * data;