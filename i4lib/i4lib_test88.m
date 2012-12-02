function i4lib_test88 (  )

%*****************************************************************************80
%
%% TEST88 tests I4VEC_VALUE_INDEX.
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
  n = 25;
  seed = 123456789;
  value = 3;
  max_index = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST88\n' );
  fprintf ( 1, '  I4VEC_VALUE_INDEX indexes entries equal to\n' );
  fprintf ( 1, '  a given value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The desired value is ', value );
  fprintf ( 1, '  The maximum number of indices to find is %d\n', max_index );

  b = 1;
  c = 5;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Input vector A:' );

  [ n_index, value_index ] = i4vec_value_index ( n, a, value, max_index );

  i4vec_print ( n_index, value_index, ...
    '  Indices of entries equal to given value: ' );

  return
end
