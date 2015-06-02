function [ l, u ] = l1pp_lu ( n, h )

%*****************************************************************************80
%
%% L1PP_LU computes the LU factors of the 1D PP Laplacian.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%    N must be at least 3.
%
%    Input, real H, the spacing between points.
%
%    Output, real L(N,N), U(N,n), the LU factors.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'L1PP_LU - Fatal error!\n' );
    fprintf ( 1, '  N < 3.\n' );
    error ( 'L1PP_LU - Fatal error!' );
  end

  l = zeros ( n, n );

  for i = 1 : n
    l(i,i) = 1.0;
  end

  for i = 2 : n - 1
    l(i,i-1) = - ( i - 1 ) / i;
    l(n,i-1) =       - 1   / i;
  end
  l(n,n-1) = - 1.0;

  u = zeros ( n, n );

  for i = 1 : n - 2
    u(i,i)   = ( i + 1 ) / i;
    u(i,i+1) = - 1.0;
    u(i,n) =     - 1   / i;
  end

  i = n - 1;
  u(i,i)   =   ( i + 1 ) / i;
  u(i,i+1) = - ( i + 1 ) / i;

  i = n;
  u(i,i) = 0.0;

  u(1:n,1:n) = u(1:n,1:n) / h / h;

  return
end
