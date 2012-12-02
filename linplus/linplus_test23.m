function linplus_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests R8GB_FA, R8GB_TRF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = m;
  ml = 1;
  mu = 1;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  For a general banded matrix,\n' );
  fprintf ( 1, '  R8GB_FA factors, using LINPACK conventions;\n' );
  fprintf ( 1, '  R8GB_TRF factors, using LAPACK conventions;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M              = %d\n', m );
  fprintf ( 1, '  Matrix columns N           = %d\n', n );
  fprintf ( 1, '  Lower bandwidth ML         = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU         = %d\n', mu );
%
%  Set the matrix.
%
  [ a, seed ] = r8gb_random ( m, n, ml, mu, seed );
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8gb_fa ( n, ml, mu, a );

  r8gb_print ( m, n, ml, mu, a_lu, '  The R8GB_FA factors:' );
%
%  Set the matrix.
%
  seed = 123456789;
  [ a, seed ] = r8gb_random ( m, n, ml, mu, seed );
%
%  Factor the matrix.
%
  [ a_lu, pivot, info ] = r8gb_trf ( m, n, ml, mu, a );

  r8gb_print ( m, n, ml, mu, a_lu, '  The R8GB_TRF factors:');

  return
end
