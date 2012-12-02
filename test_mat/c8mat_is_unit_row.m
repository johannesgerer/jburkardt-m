function ival = c8mat_is_unit_row ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_IS_UNIT_ROW checks whether A has rows of unit Euclidean norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the row and column dimensions 
%    of the matrix.  M and N must be positive.
%
%    Input, complex A(M,N), the matrix.
%
%    Output, integer IVAL:
%    -1, the matrix is not row normalized.
%    1, the matrix is row normalized.
%
  tol = 0.0001;

  for i = 1 : m

    if ( tol < abs ( 1.0 - norm ( a(i,1:n) ) ) )
      ival = -1;
      return
    end

  end

  ival = 1;

  return
end
