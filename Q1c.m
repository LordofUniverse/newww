rng(0);

e = exp(1);
% p = vpa(sym(pi), 30);
p = 3.14159265358979323846264338328;

while 1
    xx = rand*(p);
    yy = rand*(e);
    x= xx(1, 1);
    y= yy(1, 1);
    if x == p/3 && y <= e
        disp(x);
        disp(y);
        break;
    elseif x < p/3 && y <= 3*e*x/p
        disp(x);
        disp(y);
        break;
    elseif x > p/3 && y <= 3*e*(p - x)/(2*p)
        disp(x);
        disp(y);
        break;
    end
end