function a = laguerre_inverse ( n )

%*****************************************************************************80
%
%% LAGUERRE_INVERSE returns the inverse of the LAGUERRE matrix.
%
%  Example:
%
%    N = 9
%
%        1        .       .        .       .        .       .       .     .
%        1       -1       .        .       .        .       .       .     .
%        2       -4       2        .       .        .       .       .     .
%        6      -18      18       -6       .        .       .       .     .
%       24      -96     144      -96      24        .       .       .     .
%      120     -600    1200    -1200     600     -120       .       .     .
%      720    -4320   10800   -14400   10800    -4320     720       .     .
%     5040   -35280  105840  -176400  176400  -105840   35280   -5040     .
%     40320 -322560 1128960 -2257920 2822400 -2257920 1128960 -322560 40320
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is lower triangular.
%
%    The columns of A alternate in sign.
%
%    A(I,1) = (I-1)!
%    A(I,I) = (I-1)! * ( -1 )^(N+1)
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

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,1) = 1.0;
  a(2,2) = -1.0;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) = ( i - 1 ) * ( a(i-1,j)              );
      else
        a(i,j) = ( i - 1 ) * ( a(i-1,j) - a(i-1,j-1) );
      end
    end
  end

  return
end
