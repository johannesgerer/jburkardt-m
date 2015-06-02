function a = skew_circulant ( m, n, x )

%*****************************************************************************80
%
%% SKEW_CIRCULANT returns a SKEW_CIRCULANT matrix.
%
%  Formula:
%
%    K = 1 + mod ( J - I, N )
%
%    if ( I <= J ) then
%      A(I,J) = +X(K)
%    else
%      A(I,J) = -X(K)
%
%  Example:
%
%    M = 4, N = 4, X = ( 1, 2, 3, 4 )
%
%    1  2  3  4
%   -4  1  2  3
%   -3 -4  1  2
%   -2 -3 -4  1
%
%    M = 4, N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    1  2  3  4  5
%   -5  1  2  3  4
%   -4 -5  1  2  3
%   -3 -4 -5  1  2
%
%    M = 5, N = 4, X = ( 1, 2, 3, 4 )
%
%    1  2  3  4
%   -5  1  2  3
%   -4 -5  1  2
%   -3 -4 -5  1
%   -1 -2 -3 -4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, real X(N), the values in the first row of A.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      k = 1 + i4_modp ( j - i, n );

      if ( i <= j )
        a(i,j) = + x(k);
      else
        a(i,j) = - x(k);
      end

    end
  end

  return
end
