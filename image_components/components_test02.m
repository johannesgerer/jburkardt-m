function components_test02 ( )

%*****************************************************************************80
%
%% COMPONENTS_TEST02 tests I4MAT_COMPONENTS on a simple case.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2011
%
%  Author:
%
%    John Burkardt
%
  m = 9;
  n = 17;

  a = [ ...
    0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 0, 1, 0, 0, 1, 0, 0, 0; ...
    0, 1, 1, 0, 1, 1, 1, 0, 0; ...
    0, 1, 1, 1, 1, 1, 1, 0, 0; ...
    0, 0, 1, 1, 1, 0, 0, 0, 0; ...
    0, 0, 1, 1, 1, 0, 0, 0, 0; ...
    0, 1, 1, 1, 0, 1, 0, 1, 0; ...
    0, 1, 1, 0, 0, 1, 0, 1, 0; ...
    0, 0, 1, 0, 0, 0, 0, 1, 0; ...
    0, 0, 0, 0, 1, 0, 1, 1, 0; ...
    0, 1, 0, 1, 1, 0, 1, 0, 0; ...
    0, 1, 1, 1, 1, 1, 0, 0, 0; ...
    0, 0, 1, 1, 0, 1, 0, 1, 0; ...
    0, 0, 1, 1, 0, 1, 0, 1, 0; ...
    0, 1, 1, 0, 1, 0, 1, 1, 0; ...
    0, 1, 0, 0, 1, 0, 1, 1, 0; ...
    0, 0, 0, 0, 0, 0, 0, 0, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPONENTS_TEST02\n' );
  fprintf ( 1, '  I4MAT_COMPONENTS finds and labels connected\n' );
  fprintf ( 1, '  components in a 2D integer array.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '    ' );
    for j = 1 : n
      fprintf ( 1, '%d', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  [ component_num, c ] = i4mat_components ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of components = %d\n', component_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  C:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '    ' );
    for j = 1 : n
      fprintf ( 1, '%d', c(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
