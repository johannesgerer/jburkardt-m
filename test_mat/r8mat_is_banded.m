function [ ival, jval ] = r8mat_is_band ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_BAND determines whether a matrix is banded.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the row and column dimensions of 
%    the matrix.  M and N must be positive.
%
%    Input, real A(M,N), the matrix.
%
%    Output, integer IVAL, the lower bandwidth, measured as the
%    number of nonzero diagonals, starting with the main diagonal
%    and proceeding down, with values between 0 and M.
%
%    Output, integer JVAL, the upper bandwidth, measured as the
%    number of nonzero diagonals, starting with the main diagonal
%    and proceeding right, with values between 0 and N.
%
  ival = 0;
  jval = 0;

  for i = 1 : m
    for j = 1 : n

      if ( a(i,j) ~= 0.0 )

        if ( i <= j )
          jval = max ( jval, j + 1 - i );
        end

        if ( j <= i )
          ival = max ( ival, i + 1 - j );
        end

      end

    end
  end

  return
end
