function geometry_test2095 ( )

%*****************************************************************************80
%
%% TEST2095 tests TRIANGLE_POINT_DIST_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  ntest = 3;

  ptest = [ ...
    1.0,       2.0,       3.0; ...
    1.3535534, 2.3535534, 3.0; ...
    0.0,       0.0,       0.0 ]';
  t = [ ...
    1.0,       2.0,       3.0; ...
    2.4142137, 3.4142137, 3.0; ...
    1.7071068, 2.7071068, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2095\n' );
  fprintf ( 1, '  For a triangle in 3D:\n' );
  fprintf ( 1, '  TRIANGLE_POINT_DIST_3D computes the distance\n' );
  fprintf ( 1, '  to a point;\n' );

  r8mat_transpose_print ( 3, 3, t, '  Triangle vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '                   P                          DIST\n' );
  fprintf ( 1, '\n' );

  for j = 1 : ntest

    p(1:3,1) = ptest(1:3,j);

    dist = triangle_point_dist_3d ( t, p );

    fprintf ( 1, '  %10f  %10f  %10f  %14f\n', p(1:3,1), dist );

  end

  return
end
