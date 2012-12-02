function linpack_s_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests SPBDI.
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
  n_max = 128;
  lda = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  For a positive definite symmetric band matrix,\n' );
  fprintf ( 1, '  SPBDI computes the determinant as\n' );
  fprintf ( 1, '    det = MANTISSA * 10**EXPONENT\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Find the determinant of the -1,2,-1 matrix\n' );
  fprintf ( 1, '  for N = 2, 4, 8, 16, 32, 64, 128.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (For this matrix, det ( A ) = N + 1.)\n' );
  fprintf ( 1, '\n' );
%
%  Set the number of nonzero diagonals.
%
  m = 1;

  fprintf ( 1, '  The bandwidth of the matrix is %d\n', 2 * m + 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N    Mantissa       Exponent\n' );
  fprintf ( 1, '\n' );

  n = 1;

  for n_log = 1 : 7

    n = 2 * n;

    a(1:lda,1:n) = 0.0;

    a(1,1)   =  0.0;
    a(1,2:n) = -1.0;
    a(2,1:n) =  2.0;

    [ a, info ] = spbfa ( a, lda, n, m );

    if ( info ~= 0 )
      fprintf ( 1, '  Error!  SPBFA returns INFO = %d\n', info );
      return
    end

    det = spbdi ( a, lda, n, m );

    fprintf ( 1, '  %6d  %14f  %14f\n', n, det(1), det(2) );

  end

  return
end
