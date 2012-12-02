function ival = c8mat_is_hermitian ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_IS_HERMITIAN checks if a complex matrix is hermitian.
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
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, complex A(M,N), the matrix.
%
%    Output, integer IVAL:
%    -1, the matrix is not symmetric because M /= N.
%    -2, the matrix is not symmetric because A(I,J) = conjg ( A(J,I) ) fails.
%    1, the matrix is symmetric.
%
  if ( m ~= n )
    ival = -1;
    return
  end

  for i = 1 : n
    ffor j = 1 : i - 1
      if ( a(i,j) ~= conj ( a(j,i) ) )
        ival = -2;
      end
    end
  end

  ival = 1;

  return
end
