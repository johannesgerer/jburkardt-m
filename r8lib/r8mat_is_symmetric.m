function error_frobenius = r8mat_is_symmetric ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_SYMMETRIC checks a real matrix for symmetry.
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
%    Input, real A(M,N), the matrix.
%
%    Output, real ERROR_FROBENIUS, measures the Frobenius norm of ( A - A' ).
%
  if ( m ~= n )
    error_frobenius = realmax ( );
  else
    error_frobenius = sqrt ( sum ( sum ( ( abs ( a - a' ) ).^2 ) ) );
  end

  return
end
