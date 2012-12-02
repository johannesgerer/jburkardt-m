function [ x, y, c ] = double_c_data ( n1, n2 )

%*****************************************************************************80
%
%% DOUBLE_C_DATA generates "double C" data that is difficult to separate.
%
%  Discussion:
%
%    The data comprises a "C" shape and its reverse, which do not intersect,
%    but which nestle together fairly closely.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%   Input, integer N1, N2, the number of points to be generated in set 1 and 
%   set 2, respectively.
%
%   Output, real X(N), Y(N), the coordinates of the data points.  The points
%   have been shuffled so that data belonging to the two components is
%   interleaved.
%
%   Output, integer C(N), is 1 or 2, depending on which set the corresponding
%   data point belongs to.
%
  n = n1 + n2;

  x = zeros ( n, 1 );
  y = zeros ( n, 1 );
  c = zeros ( n, 1 );
%
%  Generate first set.
%
  r = 2.0 + 3.0 * rand ( n1, 1 );
  t = pi * ( 0.5 + rand ( n1, 1 ) );
  x(1:n1,1) = 1.0 + r .* cos ( t );
  y(1:n1,1) =       r .* sin ( t );
  c(1:n1,1) = 1;
%
%  Generate the second set.
%
  r = 2.0 + 3.0 * rand ( n2, 1 );
  t = pi * ( 1.5 + rand ( n2, 1 ) );
  x(n1+1:n1+n2,1) = 0.0 + r .* cos ( t );
  y(n1+1:n1+n2,1) = 3.5 + r .* sin ( t );
  c(n1+1:n1+n2,1) = 2;
%
%  Apply a random permutation to the data.
%
  p = randperm ( n );
  x = x(p);
  y = y(p);
  c = c(p);

  return
end
