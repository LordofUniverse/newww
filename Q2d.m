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

    resC1 = zeros(2, lim);
    resC2 = zeros(2, lim);

    for i = 1:lim
        x1 = x1points(i, 1);
        x2 = x2points(i, 1);
        X = A * [x1; x2] + myu;
        diff = X - S;
        difft = transpose(diff);
        mult = diff * difft;
        resC1(1, i) = mult(1, 1);
        resC1(2, i) = mult(2, 1);
        resC2(1, i) = mult(1, 2);
        resC2(2, i) = mult(2, 2);
    end

    S1 = sum(resC1, 2) / lim;
    S2 = sum(resC2, 2) / lim;
    C = [S1, S2];
    p0 = S;
    
    [V, D] = eig(C);
    p1 = p0 + (V(:,1)).*sqrt(D(1,1));
    p2 = p0 + (V(:,2)).*sqrt(D(2,2));
    % subplot(2,3,k), scatter(res(1, :), res(2, :));
    figure(log10(i));
    scatter(res(1, :), res(2, :));
    hold on
    % subplot(2,3,k), plot([p1(1) p0(1)], [p1(2) p0(2)], 'r-');
    plot([p1(1) p0(1)], [p1(2) p0(2)], 'r-');
    % subplot(2,3,k), plot([p2(1) p0(1)], [p2(2) p0(2)], 'r-');
    plot([p2(1) p0(1)], [p2(2) p0(2)], 'r-');
    title(sprintf('principal mode of variation for n = %d', i));
    hold off
   
end