function ival = c8mat_is_row_orthogonal ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_IS_ROW_ORTHOGONAL checks if a complex matrix is row orthogonal.
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
%    -1, the matrix is not row orthogonal.
%    1, the matrix is row orthogonal.
%
  tol = 0.0001;

  for i1 = 1 : m

    for i2 = i1+1 : m

      test = a(i1,1:n) * a(i2,1:n)';

      if ( tol < abs ( test ) )
        ival = -1;
        return
      end

    end

  end

  ival = 1;

  return
end
