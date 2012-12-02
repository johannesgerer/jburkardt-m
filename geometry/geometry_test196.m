function geometry_test196 ( )

%*****************************************************************************80
%
%% TEST196 tests SHAPE_POINT_DIST_2D.
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
  nside = 4;
  ntest = 9;

  center(1:2,1) = [ 3.0; 0.0 ];
  p1(1:2,1) = [ 5.0; 0.0 ];
  ptest = [ ...
     3.0,  0.0; ...
     5.0,  0.0; ...
     4.0,  0.0; ...
    10.0,  0.0; ...
     8.0,  5.0; ...
     6.0,  6.0; ...
     1.0,  2.0; ...
     2.5, -0.5; ...
     4.0, -1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST196\n' );
  fprintf ( 1, '  For a shape in 2D,\n' );
  fprintf ( 1, '  SHAPE_POINT_DIST_2D computes the distance\n' );
  fprintf ( 1, '  to a point;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sides:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %6d\n', nside );

  r8vec_print ( 2, center, '  Center of square:' );

  r8vec_print ( 2, p1, '  Square vertex #1' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       X            Y            DIST\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1:2,1) = ptest(1:2,i);

    dist = shape_point_dist_2d ( center, p1, nside, p ) ;

    fprintf ( 1, '  %6d  %12f  %12f %12f\n', i, p(1:2,1), dist );

  end

  return
end
