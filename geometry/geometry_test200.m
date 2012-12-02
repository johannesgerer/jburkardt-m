function geometry_test200 ( )

%*****************************************************************************80
%
%% TEST200 tests SPHERE_TRIANGLE_SIDES_TO_ANGLES.
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
  r = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST200\n' );
  fprintf ( 1, '  SPHERE_TRIANGLE_SIDES_TO_ANGLES takes the sides of a\n' );
  fprintf ( 1, '  spherical triangle and determines the angles.\n' );

  as = 121.0 + ( 15.4 / 60.0 );
  bs = 104.0 + ( 54.7 / 60.0 );
  cs =  65.0 + ( 42.5 / 60.0 );

  as = degrees_to_radians ( as );
  bs = degrees_to_radians ( bs );
  cs = degrees_to_radians ( cs );

  as = r * as;
  bs = r * bs;
  cs = r * cs;
%
%  Get the spherical angles.
%
  [ a, b, c ] = sphere_triangle_sides_to_angles ( r, as, bs, cs );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A       = %8f (radians)\n', a );
  a = radians_to_degrees ( a );
  fprintf ( 1, '  A       = %8f (degrees)\n', a );
  a = 117.0 + ( 58.0 / 60.0 );
  fprintf ( 1, '  Correct = %8f (radians)\n', a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  B       = %8f (radians)\n', b );
  b = radians_to_degrees ( b );
  fprintf ( 1, '  B       = %8f (degrees)\n', b );
  b = 93.0 + ( 13.8 / 60.0 );
  fprintf ( 1, '  Correct = %8f (radians)\n', b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  C       = %8f (radians)\n', c );
  c = radians_to_degrees ( c );
  fprintf ( 1, '  C       = %8f (degrees)\n', c );
  c = 70.0 + ( 20.6 / 60.0 );
  fprintf ( 1, '  Correct = %8f (radians)\n', c );

  return
end
