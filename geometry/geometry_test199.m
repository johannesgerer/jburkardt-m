function geometry_test199 ( )

%*****************************************************************************80
%
%% TEST199 tests SHAPE_RAY_INT_2D.
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
  nside = 6;
  ntest = 4;

  center(1:2,1) = [ 3.0; 0.0 ];
  p1(1:2,1) = [ 5.0; 0.0 ];
  pa_test = [ ...
    3.0,  0.0; ...
    3.0,  0.0; ...
    3.0, -1.0; ...
    3.0, -1.0 ]';
  pb_test = [ ...
    4.0,  0.0; ...
    3.0,  1.0; ...
    3.0,  1.0; ...
    7.0,  5.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST199\n' );
  fprintf ( 1, '  For a shape in 2D,\n' );
  fprintf ( 1, '  SHAPE_RAY_INT_2D computes the intersection of\n' );
  fprintf ( 1, '    a shape and a ray whose origin is within\n' );
  fprintf ( 1, '    the shape.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sides:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d\n', nside );

  r8vec_print ( 2, center, '  Hexagon center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hexagon vertex #1:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f\n', p1(1:2,1) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       XA          YA          ' );
  fprintf ( 1, 'XB          YB          XI          YI\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    pa(1:2,1) = pa_test(1:2,i);
    pb(1:2,1) = pb_test(1:2,i);

    pint = shape_ray_int_2d ( center, p1, nside, pa, pb );

    fprintf ( 1, '  %6d  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      i, pa(1:2,1), pb(1:2,1), pint(1:2,1) );

  end

  return
end
