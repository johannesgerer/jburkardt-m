function fibonacci_spiral ( n )

%*****************************************************************************80
%
%% FIBONACCI_SPIRAL draws points on a Fibonacci spiral.
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
%

%
%  PHI is the golden ratio, the limit of the ratio of
%  successive Fibonacci numbers:  
%
%    PHI = limit ( N->oo ) F(N+1)/F(N)
%
  phi = ( 1.0 + sqrt ( 5.0 ) ) / 2.0;
%
%  Allocate storage for the data.
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
%  Display the data in a scatter plot.
%
  scatter ( x, y, 'b.' )
  axis equal
  title ( sprintf ( 'Fibonacci spiral, N = %d', n ) )

  return
end


