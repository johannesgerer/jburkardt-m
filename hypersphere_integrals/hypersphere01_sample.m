function [ x, seed ] = hypersphere01_sample ( m, n, seed )

%*****************************************************************************80
%
%% HYPERSPHERE01_SAMPLE uniformly samples the surface of the unit hypersphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random 
%    number generator.
%
%    Output, real X(M,N), the points.
%
  x = randn ( m, n );
  norm = ones ( 1, m ) * ( x.^2 );
  norm = sqrt ( norm );
  for i = 1 : m
    x(i,1:n) = x(i,1:n) ./ norm(1:n);
  end

  return
end
