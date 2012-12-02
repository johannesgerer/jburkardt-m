function error_frobenius = c8mat_is_symmetric ( m, n, a )

%*****************************************************************************80
%
%% C8MAT_IS_SYMMETRIC checks a complex matrix for symmetry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
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
%    Output, real ERROR_FROBENIUS, measures the Frobenius norm of ( A - A' ).
%
  if ( m ~= n )
    error_frobenius = r8_huge ( );
    return
  end

  error_frobenius = sqrt ( sum ( sum ( ( abs ( a - a' ) ).^2 ) ) );

  return
end
