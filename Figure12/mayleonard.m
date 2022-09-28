% May Leonard system of equations


function [F J] = mayleonard(M, alpha, beta, mu)

m1= M(1); m2 = M(2); m3 = M(3);

F1 = m1* ( 1- m1 - alpha* m2 - beta*m3) + mu*(-2*m1 +m2 +m3);
F2 = m2* ( 1- beta*m1 -  m2 - alpha*m3) + mu*( m1 -2*m2 + m3);
F3 = m3* ( 1- alpha*m1 - beta* m2 - m3) + mu*(m1 +m2 -2*m3);

F = [F1;F2;F3];

j11 = ( 1- m1 - alpha* m2 - beta*m3) -m1 ;
j12 = -alpha*m1;
j13 = -beta*m1;

j21 = -beta*m2;
j22 = ( 1- beta*m1 -  m2 - alpha*m3) -m2;
j23 = -alpha*m2;

j31 = -alpha*m3;
j32 = - beta*m3;
j33 = ( 1- alpha*m1 - beta* m2 - m3) - m3;

A = [ -2, 1,1; 1, -2, 1; 1, 1, -2];

J = [j11,j12,j13; j21, j22, j23; j31, j32, j33] + mu*A;