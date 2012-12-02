function geometry_test0035 ( )

%*****************************************************************************80
%
%% TEST0035 tests ANNULUS_SECTOR_CENTROID_2D.
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

  pc = [ 5.0, 3.0 ];
  r1 = 2.0;
  r2 = 3.0;

  theta1 = degrees_to_radians ( 30.0 );
  theta2 = degrees_to_radians ( 60.0 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0035\n' );
  fprintf ( 1, '  ANNULUS_SECTOR_CENTROID_2D computes the centroid of a\n' );
  fprintf ( 1, '    circular annulus.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The circle has center        %f  %f\n', pc(1:2) );
  fprintf ( 1, '  The inner radius is R1 =     %f\n', r1 );
  fprintf ( 1, '  The outer radius is R2 =     %f\n', r2 );
  fprintf ( 1, '  The first angle is THETA1 =  %f\n', theta1 );
  fprintf ( 1, '  The second angle is THETA2 = %f\n', theta2 );

  centroid = annulus_sector_centroid_2d ( pc, r1, r2, theta1, theta2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Centroid: %f  %f\n', centroid(1:2) );

  return
end
