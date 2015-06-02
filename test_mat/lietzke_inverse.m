function a = lietzke_inverse ( n )

%*****************************************************************************80
%
%% LIETZKE_INVERSE returns the inverse of the LIETZKE matrix.
%
%  Example:
%
%    N = 5
%
%   0.5833   -0.5000         0         0    0.0833
%  -0.5000    1.0000   -0.5000         0         0
%        0   -0.5000    1.0000   -0.5000         0
%        0         0   -0.5000    1.0000   -0.5000
%   0.0833         0         0   -0.5000    0.5833
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
%    Input, integer N, the number of rows and columns 
%    of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  a(1,1) = ( n + 2 ) / ( 2 * n + 2 );
  for i = 2 : n - 1
    a(i,i) = 1.0;
  end
  a(n,n) = ( n + 2 ) / ( 2 * n + 2 );

  if ( n == 2 )

    for i = 1 : n - 1
      a(i,i+1) = - 1.0 / 3.0;
    end

    for i = 2 : n
      a(i,i-1) = - 1.0 / 3.0;
    end

  else

    for i = 1 : n - 1
      a(i,i+1) = - 0.5;
    end

    for i = 2 : n
      a(i,i-1) = - 0.5;
    end

  end

  a(1,n) = 1.0 / ( 2 * n + 2 );
  a(n,1) = 1.0 / ( 2 * n + 2 );

  return
end
