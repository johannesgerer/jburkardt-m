function geometry_test2070 ( )

%*****************************************************************************80
%
%% TEST2070 tests TRIANGLE_INCIRCLE_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
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
  fprintf ( 1, 'TEST2070\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_INCIRCLE_2D computes the incircle.\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  [ r, center ] = triangle_incircle_2d ( t );

  r8vec_print ( dim_num, center, '  Incenter' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Incircle radius is %f\n', r );

  return
end
