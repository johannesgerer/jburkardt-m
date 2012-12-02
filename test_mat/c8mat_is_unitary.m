function ival = c8mat_is_unitary ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_IS_UNITARY checks whether a complex matrix is unitary.
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
%    -1, the matrix is not unitary; M /= N.
%    -2, the matrix is not unitary; row I * column I /= 1;
%    -3, the matrix is not unitary; row I * column J /= 0;
%    1, the matrix is unitary.
%
  tol = 0.0001;

  if ( m ~= n )
    ival = -1;
    return
  end

  for i = 1 : n

    test = a(i,1:n) * conj ( a(1:n,i) ) - 1.0;

    if ( tol < abs ( test ) )
      ival = -2;
      return
    end

    for j = i + 1 : n

      test = a(i,1:n ) * conj ( a(1:n,j) );

      if ( tol < abs ( test ) )
        ival = -3;
        return
      end

    end

  end

  ival = 1;

  return
end
