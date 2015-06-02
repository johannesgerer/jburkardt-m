function [ l, u ] = l1dn_lu ( n, h )

%*****************************************************************************80
%
%% L1DN_LU computes the LU factors of the 1D DN Laplacian.
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
    fprintf ( 1, 'L1DN_LU - Fatal error!\n' );
    fprintf ( 1, '  N < 3.\n' );
    error ( 'L1DN_LU - Fatal error!' );
  end

  l = zeros ( n, n );

  for i = 1 : n
    l(i,i) = 1.0;
  end

  for i = 2 : n
    l(i,i-1) = - ( i - 1 ) / i;
  end

  u = zeros ( n, n );

  for i = 1 : n - 1
    u(i,i) = ( i + 1 ) / i;
  end
  i = n;
  u(i,i) = 1.0 / i;

  for i = 1 : n - 1
    u(i,i+1) = - 1.0;
  end

  u(1:n,1:n) = u(1:n,1:n) / h / h;

  return
end
