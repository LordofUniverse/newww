rng(0);

while 1
    xx = rand*(2) - 1;
    yy = rand* - 0.5;
    x= xx(1, 1);
    y= yy(1, 1);
    if x * x + 4 * y * y - 1 <= 0
        disp(x)
        disp(y)
        break
    end
end