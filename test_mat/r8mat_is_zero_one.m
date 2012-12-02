function ival = r8mat_is_zero_one ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_ZERO_ONE checks whether A is a zero/one matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2007
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
%    Output, integer IVAL:
%    -1, the matrix is not a zero/one matrix.
%    1, the matrix is a zero/one matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( a(i,j) ~= 0.0 & a(i,j) ~= 1.0 )
        ival = -1;
        return
      end

    end
  end

  ival = 1;

  return
end
