% This code tests mgs.m and mgsfact.m and compares results with
% Matlab's qr.
% Four tests are performed.  (More would be desirable.)
%    1.  Input a random 7x5 real matrix, with tests for
%        orthogonality of Q and accuracy of QR.
%    2.  Input a random 3x5 real matrix, with tests for
%        orthogonality of Q and accuracy of QR.
%    3.  Input a random 8x4 complex matrix, with tests for
%        orthogonality of Q and accuracy of QR.
%    4.  Input a string; should produce an error message.
%
% Dianne P. O'Leary 09/2005

disp('Testing the functions on a random 7x5 real matrix C.')

C = rand(7,5);
[m1,n1] = size(C);
[r1,q1] = mgs(C);
[r2,q2] = mgsfact(C);
[q3,r3] = qr(C,0);
c(1) = norm(q1'*q1-eye(n1));
c(2) = norm(q2'*q2-eye(n1));
c(3) = norm(q3'*q3-eye(n1));
c(4) = norm(q1*r1-C,'fro');
c(5) = norm(q2*r2-C,'fro');
c(6) = norm(q3*r3-C,'fro');

disp(' Algorithm     norm(Q^T*Q-I)    norm(Q*R-C)')
disp(sprintf('       mgs           %e     %e',c(1),c(4)))
disp(sprintf('   mgsfact           %e     %e',c(2),c(5)))
disp(sprintf('        qr           %e     %e',c(3),c(6)))

disp(' ')
disp('Testing the functions on a random 3x5 real matrix F.')

F = rand(3,5);
[m2,n2] = size(F);
[r4,q4] = mgs(F);
[r5,q5] = mgsfact(F);
[q6,r6] = qr(F);
f(1) = norm(q4'*q4-eye(n2));
f(2) = norm(q5'*q5-eye(m2));
f(3) = norm(q6'*q6-eye(m2));
f(4) = norm(q4*r4-F,'fro');
f(5) = norm(q5*r5-F,'fro');
f(6) = norm(q6*r6-F,'fro');

disp(' Algorithm     norm(Q*Q^T-I)    norm(Q*R-F)')
disp(sprintf('       mgs           %e     %e',f(1),f(4)))
disp(sprintf('   mgsfact           %e     %e',f(2),f(5)))
disp(sprintf('        qr           %e     %e',f(3),f(6)))

disp(' ')
disp('Testing the functions on a random 8x4 complex matrix G.')

G = rand(8,4)+ i *rand(8,4);
[m3,n3] = size(G);
[r7,q7] = mgs(G);
[r8,q8] = mgsfact(G);
[q9,r9] = qr(G,0);
g(1) = norm(q7'*q7-eye(n3));
g(2) = norm(q8'*q8-eye(n3));
g(3) = norm(q9'*q9-eye(n3));
g(4) = norm(q7*r7-G,'fro');
g(5) = norm(q8*r8-G,'fro');
g(6) = norm(q9*r9-G,'fro');

disp(' Algorithm     norm(Q^T*Q-I)    norm(Q*R-G)')
disp(sprintf('       mgs           %e     %e',g(1),g(4)))
disp(sprintf('   mgsfact           %e     %e',g(2),g(5)))
disp(sprintf('        qr           %e     %e',g(3),g(6)))

disp(' ')
disp('Calling mgsfact with a string or other non-numeric argument')
disp(' should produce an error message:')
G = 'junk';
mgsfact(G)

