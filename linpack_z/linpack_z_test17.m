function linpack_z_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests ZPBCO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  m = 1;
  n = 3;
  lda = m + 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  positive definite hermitian band matrix (PB),\n' );
  fprintf ( 1, '  ZPBCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the value of the superdiagonal and diagonal.
%
  a(1,1) = complex ( 0.0000,  0.0000 );
  a(1,2) = complex ( 2.1341, -0.2147 );
  a(1,3) = complex ( 2.0905,  1.1505 );

  a(2,1) = complex ( 4.5281,  0.0000 );
  a(2,2) = complex ( 5.0371,  0.0000 );
  a(2,3) = complex ( 4.7638,  0.0000 );
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );

  [ a, rcond, info ] = zpbco ( a, lda, n, m );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ZPBCO returned INFO = %d\n', info );
    fprintf ( 1, '  The factorization was not completed.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reciprocal condition  = %f\n', rcond );

  return
end
