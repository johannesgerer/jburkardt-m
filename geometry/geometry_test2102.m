function geometry_test2102 ( )

%*****************************************************************************80
%
%% TEST2102 tests TRIANGLE_INCENTER_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2102\n' );
  fprintf ( 1, '  For a triangle in 2D:\n' );
  fprintf ( 1, '  TRIANGLE_INCENTER_2D computes the incenter.\n' );

  t(1:dim_num,1:3) = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    0.0, 1.0 ]';

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  center = triangle_incenter_2d ( t );

  r8vec_print ( dim_num, center, '  Incenter' );

  t(1:dim_num,1:3) = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    0.5, 0.86602539 ]';

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  center = triangle_incenter_2d ( t );

  r8vec_print ( dim_num, center, '  Incenter' );

  t(1:dim_num,1:3) = [ ...
    0.0,  0.0; ...
    1.0,  0.0; ...
    0.5, 10.0 ]';

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  center = triangle_incenter_2d ( t );

  r8vec_print ( dim_num, center, '  Incenter' );

  t(1:dim_num,1:3) = [ ...
     0.0, 0.0; ...
     1.0, 0.0; ...
    10.0, 2.0 ]';

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  center = triangle_incenter_2d ( t );

  r8vec_print ( dim_num, center, '  Incenter' );

  return
end
