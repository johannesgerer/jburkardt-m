function components_test01 ( )

%*****************************************************************************80
%
%% COMPONENTS_TEST01 tests I4VEC_COMPONENTS on a simple case.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2011
%
%  Author:
%
%    John Burkardt
%
  n = 28;

  a = [ ...
    0, 0, 1, 2, 4, 0, 0, 4, 0, 0, ...
    0, 8, 9, 9, 1, 2, 3, 0, 0, 5, ...
    0, 1, 6, 0, 0, 0, 4, 0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPONENTS_TEST01\n' );
  fprintf ( 1, '  I4VEC_COMPONENTS finds and labels connected\n' );
  fprintf ( 1, '  components in a 1D integer vector.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : n
    fprintf ( 1, '%d', a(i) );
  end
  fprintf ( 1, '\n' );

  [ component_num, c ] = i4vec_components ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of components = %d\n', component_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : n
    fprintf ( 1, '%d', c(i) );
  end
  fprintf ( 1, '\n' );

  return
end
