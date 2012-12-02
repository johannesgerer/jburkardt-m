function program_07 ( )

%*****************************************************************************80
%
%% PROGRAM_07: Monte Carlo integral estimate for arbitrary triangle.
%
%  Discussion:
%
%    The program
%    * reads a triangle T (defined by three points),
%    * reads a random number seed;
%    * reads integer exponents P and Q;
%    * reads N, the number of random values to generate;
%    * it then computes N random points in the triangle;
%    * evaluates X^P * Y^Q at each point, and averages 
%      to estimate the integral over the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_07 - Monte Carlo estimate of\n' );
  fprintf ( 1, '  Integral x^p y^q\n' );
  fprintf ( 1, '  over an arbitrary triangle.\n' );
%
%  Get the triangle vertices.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define a triangle T:\n' );

  t_v1 = input ( '  Enter [ T.v1.x, T.v1.y]: ' ); 
  t_v2 = input ( '  Enter [ T.v2.x, T.v2.y]: ' ); 
  t_v3 = input ( '  Enter [ T.v3.x, T.v3.y]: ' ); 
%
%  Get the random number seed.
%
  seed = input ( 'Enter a random number seed:  ' );
  rand ( 'state', seed );
%
%  Get the powers P and Q.
%
  p = input ( 'Enter the power P for X^P:  ' );
  q = input ( 'Enter the power Q for Y^Q:  ' );
%
%  Get the number of values to generate.
%
  n = input ( 'Enter the number of samples to generate:  ' );
%
%  Compute the area.
%
  t_area = 0.5 * ( t_v1(1) * ( t_v2(2) - t_v3(2) ) ...
                 + t_v2(1) * ( t_v3(2) - t_v1(2) ) ...
                 + t_v3(1) * ( t_v1(2) - t_v2(2) ) );
%
%  Generate sample points in the unit triangle, 
%  map them to points in the given triangle,
%  evaluate the integrand, add to QUAD.
%
  quad = 0.0;

  for i = 1 : n

    r = rand;
    s = rand;

    xi1 =   1.0       - sqrt ( s );
    xi2 = ( 1.0 - r ) * sqrt ( s );
    xi3 =         r   * sqrt ( s );

    x = xi1 * t_v1(1) + xi2 * t_v2(1) + xi3 * t_v3(1);
    y = xi1 * t_v1(2) + xi2 * t_v2(2) + xi3 * t_v3(2);

    quad = quad + x^p * y^q;

  end
%
%  Normalize QUAD by the area and the number of points.
%
  quad = quad * t_area / n;
%
%  We didn't work out the exact integral, so all we have is
%  this estimate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated integral = %12.6f\n', quad );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_07\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end
