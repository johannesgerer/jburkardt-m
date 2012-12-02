function subset_test0687 ( )

%*****************************************************************************80
%
%% TEST0687 tests I4VEC_REVERSE;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0687\n' );
  fprintf ( 1, '  I4VEC_REVERSE reverses an integer vector.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 1, n, seed );

  i4vec_print ( n, a, '  The integer array:' );
 
  a = i4vec_reverse ( n, a );

  i4vec_print ( n, a, '  The reversed integer array:' );

  return
end
