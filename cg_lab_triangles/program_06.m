function program_06 ( )

%*****************************************************************************80
%
%% PROGRAM_06: Monte Carlo integral estimate on the unit triangle.
%
%  Discussion:
%
%    The program
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
  fprintf ( 1, 'PROGRAM_06 - Monte Carlo estimate of \n' );
  fprintf ( 1, '  Integral x^p y^q\n' );
  fprintf ( 1, '  over the unit triangle.\n' );
%
%  Get the random number seed.
%
  fprintf ( 1, '\n' );
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
  n = input ( 'Enter the number of sample points to generate:  ' );
%
%  Compute the area.
%
  t_area = 0.5;
%
%  Generate sample points, evaluate the integrand, add to QUAD.
%
  quad = 0.0;

  for i = 1 : n

    r = rand;
    s = rand;

    x =   1.0       - sqrt ( s );
    y = ( 1.0 - r ) * sqrt ( s );

    quad = quad + x^p * y^q;

  end
%
%  Normalize QUAD by the area and the number of points.
%
  quad = quad * t_area / n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated integral = %12.6f\n', quad );
%
%  For the  unit triangle, we know the exact value of the integral.
%
  exact = 1.0;
  for i = 1 : q
    exact = exact * i / ( p + i );
  end
  exact = exact / ( p + q + 1 ) / ( p + q + 2 );

  fprintf ( 1, '  Exact integral     = %12.6f\n', exact );
  fprintf ( 1, '  Absolute error     = %12.6f\n', abs ( exact - quad ) );
  fprintf ( 1, '  Relative error     = %12.6f\n', ...
    abs ( exact - quad ) / abs ( exact ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_06\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end
