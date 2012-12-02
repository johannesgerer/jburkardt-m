function ival = r8mat_is_anticirculant ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_ANTICIRCULANT checks whether A is an anticirculant matrix.
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
%    -1, the matrix is not anticirculant.
%    1, the matrix is anticirculant.
%
  ival = 1;

  for i = 2 : m
    for j = 1 : n

      k = 1 + mod ( j + i - 2, n );

      if ( a(i,j) ~= a(1,k) )
        ival = -1;
        return
      end

    end
  end

  return
end
