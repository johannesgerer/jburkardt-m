function test0477 ( )

%*****************************************************************************80
%
%% TEST0477 tests PARALLELOGRAM_AREA_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2010
%
%  Author:
%
%    John Burkardt
%
  p = [ ...
    2.0, 7.0; ...
    5.0, 7.0; ...
    6.0, 9.0; ...
    3.0, 9.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0477\n' );
  fprintf ( 1, '  PARALLELOGRAM_AREA_2D finds the area of a\n' );
  fprintf ( 1, '  parallelogram in 2D.\n' );

  r8mat_transpose_print ( 2, 4, p, '  Vertices:' );

  area = parallelogram_area_2d ( p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  AREA = %f\n', area );

  return
end
