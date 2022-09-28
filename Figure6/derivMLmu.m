function dm = derivMLmu(t, m, a, b, mu)

n = length(m);
A3 = [1 a b;b 1 a;a b 1];
K = -n*eye(n) + ones(n);

dm = m.*(1 - A3*m) + mu*K*m;
