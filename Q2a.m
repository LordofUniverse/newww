rng(0);

% C = root(C) * Transpose(root(C)) => A = root(C)
C = [1.6250, -1.9486; -1.9486, 3.8750];
myu = [1; 2];
[V, D] = eig(C);
sqrtD = [sqrt(D(1, 1)), D(2, 1); D(1, 2), sqrt(D(2, 2))];
A = V * sqrtD;

for i = 1:5
    lim = 10^i;

    x1points = randn([lim, 1]);
    x2points = randn([lim, 1]);
    
    res = zeros(2, lim);
    
    for j = 1:lim
        x1 = x1points(j, 1);
        x2 = x2points(j, 1);
        X = A * [x1; x2] + myu;
        res(1, j) = X(1, 1);
        res(2, j) = X(2, 1);
    end
    % subplot(2,3,i), histogram2(res(1, :), res(2, :), 'DisplayStyle','tile');
    subplot(2,3,i), histogram2(res(1, :), res(2, :), 'DisplayStyle','tile', 'BinWidth', [0.2, 0.2]);
    xlabel('x1')
    ylabel('x2')
    title('Multivariate Gaussian')
end