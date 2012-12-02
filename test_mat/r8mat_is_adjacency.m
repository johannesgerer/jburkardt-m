function ival = r8mat_is_adjacency ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_ADJACENCY checks whether A is an adjacency matrix.
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
%    -1, the matrix is not an adjacency matrix.
%    1, the matrix is an adjacency matrix.
%
  tol = 0.00001;

  if ( m ~= n )
    ival = -1;
    return
  end

  error_frobenius = r8mat_is_symmetric ( m, n, a );

  if ( tol < error_frobenius )
    ival = -1;
    return
  end

  jval = r8mat_is_zero_one ( m, n, a );

  if ( jval ~= 1 )
    ival = -1;
    return
  end

  return
end
