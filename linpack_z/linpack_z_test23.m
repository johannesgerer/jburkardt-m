function linpack_z_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests ZPPCO.
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  For a double precision complex (C)\n' );
  fprintf ( 1, '  Hermitian positive definite packed matrix (PP),\n' );
  fprintf ( 1, '  ZPPCO estimates the reciprocal condition number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The matrix order is N = %d\n', n );
%
%  Set the values of the matrix A.
%
  a(1) = complex ( 2.5281,  0.0000 );

  a(2) = complex ( 2.1341, -0.2147 );
  a(3) = complex ( 3.0371,  0.0000 );

  a(4) = complex ( 2.4187,  0.2932 );
  a(5) = complex ( 2.0905,  1.1505 );
  a(6) = complex ( 2.7638,  0.0000 );
%
%  Estimate the condition.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the condition number.\n' );

  [ a, rcond, info ] = zppco ( a, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reciprocal condition number = %f\n', rcond );

  return
end
