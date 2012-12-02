function u = chow_right ( alpha, beta, n )

%*****************************************************************************80
%
%% CHOW_RIGHT returns the right eigenvector matrix for the Chow matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the ALPHA value.  A typical value is 1.0.
%
%    Input, real BETA, the BETA value.  A typical value is 0.0.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real U(N,N), the right eigenvector matrix.
%

  k = n - round ( ( n + 1 ) / 2 );

  for j = 1 : k
    angle = j * pi / ( n + 2 );
    for i = 1 : n
      u(i,j) = alpha^( i - 1 ) * 2.0^( i - 2 ) ...
        * ( cos ( angle ) )^( i - 2 ) ...
        * sin ( ( i + 1 ) * angle ) / sin ( angle );
    end
  end

  for j = k+1 : n
    u(1,j) = 1.0;
    u(2,j) = -alpha;
    u(3:n,j) = 0.0;
  end

  return
end
