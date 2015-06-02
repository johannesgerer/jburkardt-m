function [ x, seed ] = disk01_sample ( n, seed )

%*****************************************************************************80
%
%% DISK01_SAMPLE uniformly samples the unit disk.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 January 2014
%
%  Author:
%
%    John Burkardt
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
  x = randn ( 2, n );
  norm = ones ( 1, 2 ) * ( x.^2 );
  norm = sqrt ( norm );
  for i = 1 : 2
    x(i,1:n) = x(i,1:n) ./ norm(1:n);
  end

  for j = 1 : n
    r = rand ( 1, 1 );
    x(1:2,j) = sqrt ( r  ) * x(1:2,j);
  end

  return
end
