function a = lehmer ( n )

%% LEHMER returns the Lehmer matrix.
%
%  Discussion:
%
%    The Lehmer matrix is a symmetric positive definite N by N 
%    matrix with
%
%      A(i,j) = min ( i, j ) / max ( i, j ) 
%
%    A is totally nonnegative.  The inverse of A is tridiagonal, 
%    and explicit formulas are known for its entries.
%
%    The condition number of A satisfies the bounds:
%
%      N <= condition ( A ) <= 4*N*N.
%
%  Reference:
%
%    M. Newman and J. Todd, 
%    The evaluation of matrix inversion programs, 
%    Journal of the Society for Industrial and Applied Mathematics, 
%    Volume 6, 1958, pages 466-476.
%
%    Solutions to problem E710 (proposed by D H Lehmer): 
%    The inverse of a matrix, 
%    American Mathematical Monthly, 
%    Volume 53, 1946, pages 534-535.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = ones ( n, 1 ) * ( 1:n );
  a = a ./ a';
  a = tril ( a ) + tril ( a, -1 )';

  return
end
