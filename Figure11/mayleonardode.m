% May Leonard system of equations


function F = mayleonardode(t, M, alpha, beta, mu)

m1= M(1); m2 = M(2); m3 = M(3);

F1 = m1* ( 1- m1 - alpha* m2 - beta*m3) + mu*(-2*m1 +m2 +m3);
F2 = m2* ( 1- beta*m1 -  m2 - alpha*m3) + mu*( m1 -2*m2 + m3);
F3 = m3* ( 1- alpha*m1 - beta* m2 - m3) + mu*(m1 +m2 -2*m3);

F = [F1;F2;F3];

