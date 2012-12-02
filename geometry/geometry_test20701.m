function geometry_test20701 ( )

%*****************************************************************************80
%
%% TEST20701 tests TRIANGLE_INRADIUS_2D;
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

  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20701\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_INRADIUS_2D computes the inradius.\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  r = triangle_inradius_2d ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Incircle radius is %f\n', r );

  return
end
