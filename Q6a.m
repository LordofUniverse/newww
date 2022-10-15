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

%plot the 5 figures together on a single figure
subplot(4,2,1), image(rescale(reshape(M, [80, 80, 3])));
subplot(4,2,2), image(rescale(reshape(V1, [80, 80, 3])));
subplot(4,2,3), image(rescale(reshape(V2, [80, 80, 3])));
subplot(4,2,4), image(rescale(reshape(V3, [80, 80, 3])));
subplot(4,2,5), image(rescale(reshape(V4, [80, 80, 3])));

Eigv = zeros(10, 1);
for i = 1:10
    Eigv(i, 1) = D(i, i);
end
Eigv = sort(Eigv, 'descend');

%subplot(2,3,6), plot(Eigv, '-o');