function [ x, seed ] = circle01_sample ( n, seed )

%*****************************************************************************80
%
%% CIRCLE01_SAMPLE samples points on the circumference of the unit circle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Russell Cheng,
%    Random Variate Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998, pages 168.
%
%    Reuven Rubinstein,
%    Monte Carlo Optimization, Simulation, and Sensitivity 
%    of Queueing Networks,
%    Krieger, 1992,
%    ISBN: 0894647644,
%    LC: QA298.R79.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real X(2,N), the points.
%
  r = 1.0;
  c = zeros ( 2, 1 );

  [ theta, seed ] = r8vec_uniform_01 ( n, seed );

  x = zeros ( 2, n );

  x(1,1:n) = c(1) + r * cos ( 2.0 * pi * theta(1:n)' );
  x(2,1:n) = c(2) + r * sin ( 2.0 * pi * theta(1:n)' );

  return
end
