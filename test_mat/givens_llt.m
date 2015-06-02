function a = givens_llt ( n )

%*****************************************************************************80
%
%% GIVENS_LLT returns the Cholesky factor of the GIVENS matrix.
%
%  Example:
%
%    N = 5
%
%    1    0        0        0       0
%    1  sqrt(2)    0        0       0
%    1  sqrt(2)  sqrt(2)    0       0
%    1  sqrt(2)  sqrt(2)  sqrt(2)   0
%    1  sqrt(2)  sqrt(2)  sqrt(2) sqrt(2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  a(1:n,1) = 1.0;

  for i = 1 : n
    a(i,2:i) = sqrt ( 2.0 );
  end

  return
end