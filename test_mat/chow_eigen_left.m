function v = chow_eigen_left ( alpha, beta, n )

%*****************************************************************************80
%
%% CHOW_EIGEN_LEFT returns the left eigenvector matrix for the CHOW matrix.
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
%    Output, real V(N,N), the left eigenvector matrix.
%
  v = zeros ( n, n );

  k = n - round ( ( n + 1 ) / 2 );

  for i = 1 : k
    angle = i * pi / ( n + 2 );
    for j = 1 : n
      v(i,j) = alpha^( n - j ) * 2.0^( n - j - 1 ) ...
        * ( cos ( angle ) )^( n - j + 1 ) ...
        * sin ( ( n - j + 2 ) * angle ) / sin ( angle );
    end
  end

  for i = k+1 : n
    v(i,1:n-2) = 0.0;
    v(i,n-1) = -alpha;
    v(i,n) = 1.0;
  end

  return
end
