function [x, steps, relres] = gauss_seidel( A, b, n, tol, maxit, x0 )

%% GAUSS_SEIDEL solves the (square) system of linear equations A*x = b
%
%  Discussion:
%
%    This is the standard Gauss-Seidel iterative method. 
%    Recall that in the standard Gauss-Seidel method we iterate via
%
%    x_(k+1) = inv(D+L)*(b - U*x_k), k = 0, 1, 2, ...
%
%    where L is the strictly lower triangular part of A, U is the 
%    strictly upper triangular part of A, and inv(D) is the inverse of a 
%    matrix D which is a diagonal matrix whose diagonal is the same as A.  
%
%  Author:
%
%    2006 Marcus R Garvie
%
%  Parameters:
%
%    Input, A(n,n), the square coefficient matrix
%
%    Input, b(n,1), the right-hand-side vector
%
%    Input, n, the dimension of the (square) linear system
%
%    Input, tol, the tolerance for the relative residual norm(b-A*x)/norm(b)
%
%    Input, maxit, the maximum allowable number of iterations 
%
%    Input, x0(n,1), the first 'guess' for the solution of the system
%
%    Output, x(n,1), the approximate solution of the linear systen
%
%    Output, steps, the number of iterations to reach required tolerance
%
%    Output, relres, the relative residual norm(b-A*x)/norm(b)
%  
%  Test Problem:
%
%    A  = [5 -1 -1 -1;-1 10 -1 -1; -1 -1 5 -1; -1 -1 -1 10];
%    b  = [-4;12;8;34];
%    x0 = [0;0;0;0];
%    x  = [1;2;3;4];   % exact solution
%
%  References:
%    
%    (1) Theory and Applications of Numerical Analysis
%        Philips and Taylor (2nd Edit), 1996, Acad Press
%
%    (2) Numerical Analysis, Burden and Faires (6th Edit)
%        1997, Brooks/Cole
%

steps = 0;
relres = 1;
x = zeros(n,1);
while (relres > tol) & (steps <= maxit)
   steps = steps + 1;
   for i = 1:n
       x(i) = (b(i) - (sum(A(i,:)*x0) - A(i,i)*x0(i))) / A(i,i);
       x0(i) = x(i);    % only bit that differs from the Jacobi algorithm
   end
   relres = norm(b - A*x)/norm(b);
   x0=x;
end
if steps > maxit
% If M is sparse norm(M,2) is not available in Matlab
%    Z = Lower\U; 
%    iter_matrix = Upper\Z;     % Iteration matrix; if norm < 1, then
%                               % method converges (true if A Strictly
%                               % Diagonally Dominant)
%    norm_iteration_matrix = norm(iter_matrix), 
   relres,
   error('Gauss-Seidel method did not converge in %d iterations', maxit); 
end

% Note: the term 'sum(A(i,:)*x0) - A(i,i)*x0(i)' takes the inner product of
% row i of A with vector x0, and subtracts the diagonal element in that row