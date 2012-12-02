function d = rgf_g_enum ( m, mmax )

%*****************************************************************************80
%
%% RGF_G_ENUM enumerates the generalized restricted growth functions.
%
%  Example:
%
%    M = 6
%
%    D =  1    1    1    1    1    1    1
%         1    2    3    4    5    6    0
%         2    5   10   17   26    0    0
%         5   15   37   77    0    0    0
%        15   52  151    0    0    0    0
%        52  203    0    0    0    0    0
%       203    0    0    0    0    0    0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer M, indicates how many rows and columns are to
%    be computed.  M must be nonnegative.
%
%    Output, integer D(1:M+1,1:M+1), the first M+1 rows and
%    M+1 columns of the table of the number of generalized restricted growth
%    functions.  D(I+1,J+1) is the number of GRGF's of length I with restriction
%    parameter J.
%
  offset = 1;

  d = zeros ( m + 1, m + 1 );

  d(0+offset,0+offset:m+offset) = 1;

  for i = 1 : m
    for j = 0 : m
      if ( j <= m - i )
        d(i+offset,j+offset) = j * d(i-1+offset,j+offset) ...
          + d(i-1+offset,j+1+offset);
      else
        d(i+offset,j+offset) = 0;
      end
    end
  end

  return
end
