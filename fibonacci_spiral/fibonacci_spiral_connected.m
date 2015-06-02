function fibonacci_spiral_connected ( n )

%*****************************************************************************80
%
%% FIBONACCI_SPIRAL_CONNECTED draws connected points on a Fibonacci spiral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to plot.
%    Default is 101.
%
  if ( nargin < 1 )
    n = 101;
  end
%
%  PHI is the golden ratio, the limit of the ratio of
%  successive Fibonacci numbers:  
%
%    PHI = limit ( N->oo ) F(N+1)/F(N)
%
  phi = ( 1.0 + sqrt ( 5.0 ) ) / 2.0;
%
%  Allocate storage for the point data.
%
  x = zeros ( n, 1 );
  y = zeros ( n, 1 );
%
%  Set the angle and radius of the first point.
%
  a = 0.0;
  r = 0.0;
%
%  Set the increments.
%
  da = 2.0 * pi * ( phi - 1.0 ) / phi;
  dr = 1.0;
%
%  Create a spiral in which the radius R and angle A both
%  increase by a constant increment,
%
  for i = 1 : n
    x(i) = r * cos ( a );
    y(i) = r * sin ( a );
    a = mod ( a + da, 2 * pi );
    r = r + dr;
  end
%
%  SCALE controls how many steps we take between the actual points.
%  A value of 5 is enough to see the basic spiral that connects the points.
%  A vale of 10 would make a smoother spiral.
%
  scale = 5.0;
%
%  Allocate storage for the intermediate data.
%
  n2 = scale * ( n - 1 ) + 1;
  x2 = zeros ( n2, 1 );
  y2 = zeros ( n2, 1 );
%
%  Set the angle and radius of the first point.
%
  a = 0.0;
  r = 0.0;
%
%  Set the increments.
%
  da = 2.0 * pi * ( phi - 1.0 ) / phi;
  dr = 1.0;

  da = da / scale;
  dr = dr / scale;
%
%  Create a spiral in which the radius R and angle A both
%  increase by a constant increment,
%
  for i = 1 : n2
    x2(i) = r * cos ( a );
    y2(i) = r * sin ( a );
    a = mod ( a + da, 2 * pi );
    r = r + dr;
  end
%
%  Display the points, 
%  and use the intermediate points to draw lines that display the spiral.
%
  figure
  scatter ( x, y, 'b.' );
  hold on
  plot ( x2, y2, 'r-' )
  axis equal
  title ( sprintf ( 'Connected Fibonacci spiral, N = %d', n ) )
  hold off

  return
end


