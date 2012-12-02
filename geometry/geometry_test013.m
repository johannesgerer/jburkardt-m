function geometry_test013 ( )

%*****************************************************************************80
%
%% TEST013 tests CIRCLE_LUNE_CENTROID_2D, CIRCLE_SECTOR_CENTROID_2D.
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
  n_test = 12;

  r = 2.0;
  center(1:2,1) = [ 5.0; 3.0 ];
  theta1 = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST013\n' );
  fprintf ( 1, '  CIRCLE_LUNE_CENTROID_2D computes the centroid of a\n' );
  fprintf ( 1, '    circular lune, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc.\n' );
  fprintf ( 1, '  CIRCLE_SECTOR_CENTROID_2D computes the centroid of a\n' );
  fprintf ( 1, '    circular sector, defined by joining the endpoints\n' );
  fprintf ( 1, '    of a circular arc to the center.\n' );

  circle_imp_print_2d ( r, center, '  The implicit circle:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first angle of our lune and sector is always 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                         Lune                       Sector\n' );
  fprintf ( 1, '  THETA2           X             Y             X             Y\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n_test

    theta2 = i * 2.0 * pi / n_test;

    centroid1(1:2,1) = circle_lune_centroid_2d ( r, center, theta1, theta2 );

    centroid2(1:2,1) = circle_sector_centroid_2d ( r, center, theta1, theta2 );

    fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', ...
      theta2, centroid1(1:2,1), centroid2(1:2,1) );

  end

  return
end
