function dataMatrix = PCAKernel(dataMatrix, kernelName)
% polynomial kernel (x' * y)^d 
% Gaussian kernel 
% Gram matrix gram_k = k - 1_n k - k 1_n + 1_n k 1_n

% k(i, j) = \kappa(x_i, x_j)
% parameter d for polynomial kernel
d = 4;
% parameter sigma for gaussian
sigma =2500;
% 1000 is acceptable
[row, col] = size(dataMatrix);
data = zeros(row, col);
for i = 1 : row
    data(i,:) = dataMatrix(i,:);
end
kernelMatrix = zeros(col, col);
for i = 1 : col %%%%%% attention here, don't know the 
    for j = 1 : col %%%%% representation
        if strcmp(kernelName,'polynomial')
            kernelMatrix(i, j) = (data(:,i)' * data(:,j))^d;
        end
        if strcmp(kernelName,'guassian')
            kernelMatrix(i, j) = exp(-norm(data(:,i) -data(:,j),2)^2/2/sigma^2);
        end
    end
end

% build 1_n matrix
% n should be 624
oneN = ones(col,col)/col;
gramMatrix = kernelMatrix - oneN * kernelMatrix - kernelMatrix * oneN + ...
    oneN * kernelMatrix * oneN;
dataMatrix = gramMatrix;