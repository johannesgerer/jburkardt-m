function [ b, l, d, u ] = bandwidth ( m, n, a )

%*****************************************************************************80
%
%% BANDWIDTH returns the bandwidth of a matrix.
%
%  Discussion:
%
%    If the nonzeros of a matrix only occur in entries that are "close"
%    to the main diagonal, we say the matrix is banded.
%
%    Roughly speaking, the bandwidth B of a matrix is the number of 
%    diagonals containing nonzeros.  More precisely, it is the minimum number
%    of contiguous diagonals that contain all the nonzeros.  It is presumed
%    that the main diagonal is nonzero.
%
%    We can also measure U and L, the upper and lower "half-bandwidths" which
%    count the number of contiguous diagonals above or below the main
%    diagonal.
%
%    We may write
%      B = L + D + U
%    where D is presumably 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Output, integer B, the total bandwidth.
%
%    Output, integer L, D, U, the lower, diagonal, and upper bandwidths.
%
  l = 0;
  d = 0;
  u = 0;

  for i = 1 : n

    j = 1;
    while ( l < i - j )
      if ( a(i,j) ~= 0.0 )
        l = i - j;
        break
      end
      j = j + 1;
    end

    if ( a(i,i) ~= 0.0 )
      d = 1;
    end

    j = n;
    while ( u < j - i )
      if ( a(i,j) ~= 0.0 )
        u = j - i;
        break
      end
      j = j - 1;
    end

  end

  b = l + d + u;

  return
end

