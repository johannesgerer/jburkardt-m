function linpack_s_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests SPBCO.
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
  n = 10;
  lda = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  For a positive definite symmetric band matrix,\n' );
  fprintf ( 1, '  SPBCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '  The matrix size is N = %d\n', n );
%
%  Set the number of nonzero diagonals.
%
  m = 1;
%
%  Set the value of the superdiagonal and diagonal.
%
  a(1,1)   =  0.0;
  a(1,2:n) = -1.0;
  a(2,1:n) =  2.0;
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition.\n' );

  [ a, rcond, z, info ] = spbco ( a, lda, n, m );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reciprocal condition  = %f\n', rcond );

  return
end
