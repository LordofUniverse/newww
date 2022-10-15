rng(0);

i = 1;
xarr = zeros(10^7, 1);
yarr = zeros(10^7, 1);

while i <= 10^7
    xx = rand()*2 - 1;
    yy = rand() - 0.5;

    x= xx(1, 1);
    y= yy(1, 1);

    if x * x + 4 * y * y - 1 <= 0
        xarr(i,1) = x;
        yarr(i,1) = y;
        i = i + 1;
    end
end

histogram2(xarr, yarr, 'DisplayStyle', 'tile')
xlabel('x')
ylabel('y')
title('Histogram of x and y values to generate ellipse')