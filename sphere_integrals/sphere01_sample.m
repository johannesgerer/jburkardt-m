function [ x, seed ] = sphere01_sample ( n, seed )

%*****************************************************************************80
%
%% SPHERE01_SAMPLE samples points from the surface of the unit sphere in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 September 2010
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

  return
end
