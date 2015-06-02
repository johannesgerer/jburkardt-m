function a = lehmer_inverse ( n )

%*****************************************************************************80
%
%% LEHMER_INVERSE returns the inverse of the LEHMER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n - 1
    a(i,i) = ( 4 * i * i * i ) / ( 4 * i * i - 1 );
  end
  a(n,n) = ( n * n ) / ( 2 * n - 1 );

  for i = 1 : n - 1
    a(i,i+1) = - ( i * ( i + 1 ) ) / ( 2 * i + 1 );
    a(i+1,i) = - ( i * ( i + 1 ) ) / ( 2 * i + 1 );
  end

  return
end
