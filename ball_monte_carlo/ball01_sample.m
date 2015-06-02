function [ x, seed ] = ball01_sample ( n, seed )

%*****************************************************************************80
%
%% BALL01_SAMPLE uniformly samples the unit ball.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 January 2014
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
%    Output, real X(3,N), the points.
%
  x = randn ( 3, n );
  norm = ones ( 1, 3 ) * ( x.^2 );
  norm = sqrt ( norm );
  for i = 1 : 3
    x(i,1:n) = x(i,1:n) ./ norm(1:n);
  end

  for j = 1 : n
    r = rand ( 1, 1 );
    x(1:3,j) = r ^ ( 1.0 / 3.0 ) * x(1:3,j);
  end

  return
end
