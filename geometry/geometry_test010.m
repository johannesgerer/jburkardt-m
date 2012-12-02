function geometry_test010 ( )

%*****************************************************************************80
%
%% TEST010 tests BOX_RAY_INT_2D.
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

  p1(1:2,1) = [ 0.0; 0.0 ];
  p2(1:2,1) = [ 5.0; 3.0 ];
%
%  Coordinates of the test points.
%
  pa_test(1:2,1:ntest) = [ ...
    3.0, 1.0; ...
    4.0, 1.0; ...
    3.0, 1.0 ]';

  pb_test(1:2,1:ntest) = [ ...
    5.0, 5.0; ...
    3.0, 1.0; ...
    4.0, 2.0 ]';

  pc_test(1:2,1:ntest) = [ ...
    4.0, 3.0; ...
    0.0, 1.0; ...
    5.0, 3.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST010\n' );
  fprintf ( 1, '  For a box with coordinate line sides in 2D,\n' );
  fprintf ( 1, '  BOX_RAY_INT_2D computes the intersection of\n' );
  fprintf ( 1, '    the box and a ray whose origin is within\n' );
  fprintf ( 1, '    the box.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lower left box corner:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8f  %8f\n', p1(1:2,1) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Upper right box corner:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8f  %8f\n', p2(1:2,1) );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    pa(1:2,1) = pa_test(1:2,i);
    pb(1:2,1) = pb_test(1:2,i);

    pint(1:2,1) = box_ray_int_2d ( p1, p2, pa, pb );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Origin:       %8f  %8f\n', pa(1:2,1) );
    fprintf ( 1, '  Point 2:      %8f  %8f\n', pb(1:2,1) );
    fprintf ( 1, '  Intersection: %8f  %8f\n', pint(1:2,1) );
    fprintf ( 1, '  Correct:      %8f  %8f\n', pc_test(1:2,i) );

  end

  return
end
