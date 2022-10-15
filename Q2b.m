rng(0);

% C = root(C) * Transpose(root(C)) => A = root(C)
C = [1.6250, -1.9486; -1.9486, 3.8750];
myu = [1; 2];
[V, D] = eig(C);
sqrtD = [sqrt(D(1, 1)), D(2, 1); D(1, 2), sqrt(D(2, 2))];
A = V * sqrtD;

x = zeros(100, 5);

for k = 1:5
    lim = 10^k;
    for j = 1:100
        x1points = randn([lim, 1]);
        x2points = randn([lim, 1]);
        res = zeros(2, lim);
    
        for i = 1:lim
            x1 = x1points(i, 1);
            x2 = x2points(i, 1);
            X = A * [x1; x2] + myu;
            res(1, i) = X(1, 1);
            res(2, i) = X(2, 1);
        end
    
        S = sum(res, 2) / lim;
        y = myu - S;
        n = sqrt(y(1, 1) * y(1, 1) + y(2, 1) * y(2, 1)) / sqrt(myu(1, 1) * myu(1, 1) + myu(2, 1) * myu(2, 1));
        x(j, k) = n;
    
    end
end

boxplot(x, [10, 100, 1000, 10000, 100000]);
title('Calculation of Error in mean');
xlabel('N values');
ylabel('Error in ML estimate of mean');