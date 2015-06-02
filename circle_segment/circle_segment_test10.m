function circle_segment_test10 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST10 checks TEST04 by calling MATLAB's QUAD2D().
%
%  Discussion:
%
%    TEST04 applies quadrature formulas from GQCIRCSEGM to a set of
%    test integrands, but I don't have exact values for the results.
%
%    In this function, I call Matlab's QUAD2D function to get a computational
%    estimate of the same integrals, for comparison.
%
%    Note that the tests in TEST04 are carried out on a "vertical" circle
%    segment, with angle -theta/2 to +theta/2, whereas these tests are
%    carried out on a "horizontal" circle segment, whose angles would be
%    pi/2-theta/2 to pi/2+theta/2.
%
%    However, because of symmetries in the integrand and the region, the
%    result will be the same, which is a relief since Matlab's QUAD2D
%    is easier to use with the horizontal circle segment, 
%    GQCIRCSEGM with the vertical one. 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2013
%
%  Author:
%
%    John Burkardt
%
  global test10_k
  global test10_r
  global test10_thetah
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST10\n' );
  fprintf ( 1, '  GQCIRCSEGM computes a Gauss quadrature rule for a\n' );
  fprintf ( 1, '  circle segment with circle of radius R and center (0,0),\n' );
  fprintf ( 1, '  with segment angles in [-theta/2,+theta/2].\n' )
  fprintf ( 1, '\n' );

  theta = pi / 4.0;
  thetah = theta / 2.0;
  r = 1.0;
  x_min = - r * sin ( thetah );
  x_max = + r * sin ( thetah );

  fprintf ( 1, '  Radius R = %g\n', r );
  fprintf ( 1, '  Angle Theta = %g\n', theta );
  fprintf ( 1, '  Estimate the integral of (x+y+2)^k using QUAD2D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   K\n' );

  for k = 0 : 11

    test10_k = k;
    test10_r = r;
    test10_thetah = thetah;

    q = quad2d ( @test10_f, x_min, x_max, @test10_y_min, @test10_y_max );
    fprintf ( 1, '  %2d  %12f.5\n', k, q );
  end
 
  return
end
function value = test10_f ( x, y )

%*****************************************************************************80
%
%% TEST10_F evaluates the integrand.
%
  global test10_k

  k = test10_k;

  value = ( x + y + 2.0 ) .^ k;

  return
end
function value = test10_y_min ( x )

%*****************************************************************************80
%
%% TEST10_Y_MIN evaluates the lower bound on Y.
%
  global test10_r
  global test10_thetah

  r = test10_r;
  thetah = test10_thetah;

  value = r * cos ( thetah ) * ones ( size ( x ) );

  return
end
function value = test10_y_max ( x )

%*****************************************************************************80
%
%% TEST10_Y_MAX evaluates the upper bound on Y.
%
  global test10_r

  r = test10_r;

  value = sqrt ( r * r - x .* x );

  return
end

