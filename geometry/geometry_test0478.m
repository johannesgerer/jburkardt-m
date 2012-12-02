function test0478 ( )

%*****************************************************************************80
%
%% TEST0478 tests PARALLELOGRAM_AREA_3D.
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
    1.0,       2.0,       3.0; ...
    2.4142137, 3.4142137, 3.0; ...
    1.7071068, 2.7071068, 4.0; ...
    0.2928931, 0.2928931, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0478\n' );
  fprintf ( 1, '  PARALLELOGRAM_AREA_3D finds the area of a\n' );
  fprintf ( 1,'  parallelogram in 3D.\n' );

  r8mat_transpose_print ( 3, 4, p, '  Vertices:' );

  area = parallelogram_area_3d ( p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  AREA = %f\n', area );

  return
end
