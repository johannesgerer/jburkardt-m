function subset_test0685 ( )

%*****************************************************************************80
%
%% TEST0685 tests I4VEC_MAXLOC_LAST;
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
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0685\n' );
  fprintf ( 1, '  I4VEC_MAXLOC_LAST: index of the last maximal\n' );
  fprintf ( 1, '  entry in an integer vector.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 1, n/4, seed );

  i4vec_print ( n, a, '  The integer array to search:' );
 
  last = i4vec_maxloc_last ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index of last maximal entry is %d\n', last );

  return
end
