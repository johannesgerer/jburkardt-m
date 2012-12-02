function ival = r8mat_is_antisymm ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_ANTISYMM checks for antisymmetry.
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
%    Output, integer IVAL:
%    -1, the matrix is not antisymmetric.
%    1, the matrix is antisymmetric.
%
  ival = 1;

  for i = 1 : min ( m, n )
    for j = 1 : i
      if ( a(i,j) ~= -a(j,i) )
        ival = -1;
        return
      end
    end
  end

  return
end
