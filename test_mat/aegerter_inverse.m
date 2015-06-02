function a = aegerter_inverse ( n )

%*****************************************************************************80
%
%% AEGERTER_INVERSE returns the inverse of the AEGERTER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n - 1
    v(i) = i;
  end

  a(1:n-1,1:n-1) = identity ( n - 1, n - 1 ) - v' * v / ( n * n );

  a(1:n-1,n) = v(1:n-1) / ( n * n );
  a(n,1:n-1) = v(1:n-1) / ( n * n );
  a(n,n) = - 1.0 / ( n * n );

  return
end

