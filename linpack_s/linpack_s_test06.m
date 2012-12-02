function linpack_s_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests SGBFA and SGBDI.
%
%  Discussion:
%
%    Matrix A is ( 2 -1  0  0  0)
%                (-1  2 -1  0  0)
%                ( 0 -1  2 -1  0)
%                ( 0  0 -1  2 -1)
%                ( 0  0  0 -1  2)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Local Parameters:
%
%    N is the number of equations.
%
%    ML is the number of subdiagonals,
%    MU the number of superdiagonals.
%
%    LDA is the leading dimension of the array used to store the
%    matrix, which must be at least 2*ML+MU+1.
%
  n_max = 128;
  ml = 1;
  mu = 1;
  lda = 2*ml+mu+1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  SGBFA factors the matrix,\n' );
  fprintf ( 1, '  SGBDI computes the determinant as\n' );
  fprintf ( 1, '    det = MANTISSA * 10^EXPONENT\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Find the determinant of the -1,2,-1 matrix\n' );
  fprintf ( 1, '  for N = 2, 4, 8, 16, 32, 64, 128.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (For this matrix, det ( A ) = N + 1.)\n' );
%
%  Set the matrix A.
%
  m = ml + mu + 1;
  fprintf ( 1, '  The bandwidth of the matrix is %d\n', m );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N    Mantissa       Exponent\n' );
  fprintf ( 1, '\n' );

  n = 1;

  for n_log = 1 : 7

    n = 2 * n;

    a(1:lda,1:n) = 0.0;

    for j = 1 : n
      a(m-1,j) = -1.0;
      a(m,j) =    2.0;
      a(m+1,j) = -1.0;
    end

    [ a, ipivot, info ] = sgbfa ( a, lda, n, ml, mu );

    if ( info ~= 0 )
      fprintf ( 1, '  Error!  SGBFA returns INFO = %d\n', info );
      return
    end

    det = sgbdi ( a, lda, n, ml, mu, ipivot );

    fprintf ( 1, '  %6d  %14f  %14f\n', n, det(1), det(2) );

  end

  return
end
