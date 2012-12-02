function geometry_test2071 ( )

%*****************************************************************************80
%
%% TEST2071 tests TRIANGLE_POINT_DIST_2D;
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
  ntest = 7;

  ptest = [ ...
     0.25,   0.25; ...
     0.75,   0.25; ...
     1.00,   1.00; ...
    11.00,   0.50; ...
     0.00,   1.00; ...
     0.50, -10.00; ...
     0.60,   0.60 ]';
  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2071\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_POINT_DIST_2D computes the distance\n' );
  fprintf ( 1, '  to a point;\n' );

  r8mat_transpose_print ( 2, 3, t, '  Triangle vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       P       DIST\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1:2,1) = ptest(1:2,i);

    dist = triangle_point_dist_2d ( t, p );

    fprintf ( 1, '  %10f  %10f  %10f\n', p(1:2,1), dist );

  end

  return
end
