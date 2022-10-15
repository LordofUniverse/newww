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

close_repre = zeros(19200, 16);

for i = 1:16
    v1 = dot(allV(:, i), V1);
    v2 = dot(allV(:, i), V2);
    v3 = dot(allV(:, i), V3);
    v4 = dot(allV(:, i), V4);
    m1 = dot(M, V1);
    m2 = dot(M, V2);
    m3 = dot(M, V3);
    m4 = dot(M, V4);
    mm = dot(M, M);
    im = dot(allV(:, i), M);

    k = (im  - v1*m1 - v2*m2 - v3*m3 - v4 * m4) / (mm - m1*m1 - m2*m2 - m3*m3 - m4*m4);
    close_repre(:,i) = k*M + (v1-m1*k)*V1+(v2-m2*k)*V2+(v3-m3*k)*V3+(v4-m4*k)*V4;
end

for i=1:16
    figure(i+2);
    subplot(1,2,1), image(rescale(reshape(allV(:,i), [80,80,3])));
    subplot(1,2,2), image(rescale(reshape(close_repre(:,i), [80,80,3])));
end