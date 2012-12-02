function ival = c8mat_is_column_orthogonal ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_IS_COLUMN_ORTHOGONAL checks if a complex matrix is column orthogonal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
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
%    -1, the matrix is not column orthogonal.
%    1, the matrix is column orthogonal.
%
  tol = 0.0001;
  ival = 1;

  for j1 = 1 : n

    for j2 = j1+1 : n

      deviation = abs ( a(1:m,j1)' * a(1:m,j2) );
      deviation_max = max ( deviation_max, deviation );

    end

  end

  if ( deviation_max < tol )
    ival = +1;
  else
    ival = -1;
  end

  return
end
