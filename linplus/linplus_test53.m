function linplus_test53 ( )

%*****************************************************************************80
%
%% TEST53 tests R8PP_RANDOM.
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
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST53\n' );
  fprintf ( 1, '  R8PP_RANDOM, compute a random positive definite\n' );
  fprintf ( 1, '    symmetric packed matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ a, seed ] = r8pp_random ( n, seed );

  r8pp_print ( n, a, '  The matrix (printed by R8PP_PRINT):' );
 
  b = r8pp_to_r8ge ( n, a );

  r8ge_print ( n, n, b, '  The random R8PP matrix (printed by R8GE_PRINT):' );

  return
end
