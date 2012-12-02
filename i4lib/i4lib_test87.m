function i4lib_test87 ( )

%*****************************************************************************80
%
%% TEST87 tests I4VEC_UNIQUE_INDEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  n = 20;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST87\n' );
  fprintf ( 1, '  I4VEC_UNIQUE_INDEX, for each entry in an I4VEC\n' );
  fprintf ( 1, '  indexes the unique elements.\n' );

  b = 1;
  c = 5;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  unique_index = i4vec_unique_index ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         I      A(I)    UNIQUE\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %8d\n', i, a(i), unique_index(i) );
  end

  return
end
