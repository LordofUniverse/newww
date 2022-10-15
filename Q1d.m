rng(0);

i = 1;
lim = 10^7;
xarr = zeros(lim, 1);
yarr = zeros(lim, 1);

e = exp(1);
% p = vpa(sym(pi), 30);
p = 3.14159265358979323846264338328;

while i <= lim
    xx = rand()*(p);
    yy = rand()*(e);
    x= xx(1, 1);
    y= yy(1, 1);
    if x == p/3 && y <= e
        xarr(i,1) = x;
        yarr(i,1) = y;
        i = i + 1;
    elseif x < p/3 && y <= 3*e*x/p
        xarr(i,1) = x;
        yarr(i,1) = y;
        i = i + 1;
    elseif x > p/3 && y <= 3*e*(p - x)/(2*p)
        xarr(i,1) = x;
        yarr(i,1) = y;
        i = i + 1;
    end
end

histogram2(xarr, yarr,'DisplayStyle','tile')
xlabel('x')
ylabel('y')
title('Histogram of x and y values to generate triangle of given equation')