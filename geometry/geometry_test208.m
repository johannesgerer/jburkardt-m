function geometry_test208 ( )

%*****************************************************************************80
%
%% TEST208 tests TRIANGLE_GRIDPOINTS_2D;
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
  dim_num = 2;
  maxgrid = 50;

  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  nsub = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST208\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_GRIDPOINTS_2D produces a set of\n' );
  fprintf ( 1, '  gridpoints in or on the triangle.\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  [ ngrid, g ] = triangle_gridpoints_2d ( t, nsub, maxgrid );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of grid points is %d\n', ngrid );

  r8mat_print ( dim_num, ngrid, g, '  Grid points: ' );

  return
end
