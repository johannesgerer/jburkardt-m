function r8lib_test152 ( )

%*****************************************************************************80
%
%% R8LIB_TEST152 tests R8VEC_NORMALIZE_L1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST152\n' );
  fprintf ( 1, '  For an R8VEC:\n' );
  fprintf ( 1, '  R8VEC_NORMALIZE_L1:  make unit sum;\n' );
 
  b = - n;
  c = n;

  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print ( n, a, '  Input vector:' );

  a = r8vec_normalize_l1 ( n, a );

  r8vec_print ( n, a, '  After calling R8VEC_NORMALIZE_L1:' );

  return
end
