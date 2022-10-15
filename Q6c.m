imagefiles = dir('data_fruit/*.png');      
% nfiles = length(imagefiles);

allV = zeros(19200, 16);
M = zeros(19200, 1);

for i=1:16
   currentfilename = imagefiles(i).name;
   Im = imread("data_fruit/" + currentfilename);
   
   %80x80x3 -> 19200x1
   imageLineVector = double(reshape(Im, 19200, 1));
   allV(:, i) = imageLineVector;
   M = M + imageLineVector;

   %reshape
   % R = rescale(reshape(imageLineVector, [80, 80, 3]));
   % image(R);
end

% mean
M = M / 16;
C = (allV - M)*((allV - M).');

% Get maximum 4 eigenvectors
[V, D] = eigs(C, 10);
V1 = V(:, 1);
V2 = V(:, 2);
V3 = V(:, 3);
V4 = V(:, 4);
VV = [V1, V2, V3, V4];

S = D(1:4,1:4) ^ 0.5;
A = VV * S * VV.';
    
for i = 1:3
    W = randn(19200, 1);
    Xvar = M + A*W;
    subplot(3,3,i), image(rescale(reshape(Xvar, [80,80,3])));
end