%data is the sample data; k is the k nearest neighbor; d is the required
%dimension; solver the the type of eigvector solver
function [projectedData, eigenVectors] = LLE(data, k, d, solver)

if ~exist('solver', 'var') 
    solver = 'svd';s
end

%Exreact the rows and column number of data
% D is the dimension of the data; N is the sample data size
[D, N] = size(data);

%Compute the euclidian distances
columnDistanceSum = double(sum(data.^2, 1));
distance = repmat(columnDistanceSum, N, 1) + repmat(columnDistanceSum', 1, N) - 2*(double(data'))*(double(data));

%sort distance 
[sortedDistance, index] = sort(distance);
%find k neighbors
neighbors = index(2:(1+k), :);

if (k > d)
    tol = 1e-3;
else
    tol = 0;
end
%define sparse matrix
AW = spalloc(N, N, k*N);
for i =1:N
    z = double(data(:, neighbors(:,i)) - repmat(data(:, i), 1, k));
    C = z'*z;
    C = C + eye(k, k)*tol*trace(C);
    w = C\ones(k, 1);
    AW(i, neighbors(:, i)) = w/sum(w);
end
%compute cost matrix M
WI = spdiags(ones(N, 1), 0, N, N) - AW;
M = (WI)'*WI;
options.disp = 0;
options.isreal = 1;
options.issym = 1;
options.v0 = ones(size(M, 1), 1);
% select eignesolver
switch solver
    case 'eig'
        [eigenVectors, eigenValues] = eigs(M, d+1, 0, options);
    case 'svd'
        [eigenVectors, S, V] = svds(M, d+1, 0, options);
end

eigenVectors = eigenVectors(:, 1:d)';
projectedData = eigenVectors* sqrt(N);
eigenVectors = double((eigenVectors * double(data'))');
end