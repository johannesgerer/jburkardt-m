function f = fxy4 ( n, x, y )

%*****************************************************************************80
%
%% FXY4 is the fourth 2D example.
%
%  Discussion:
%
%    This is example 3.1 in the reference.
%
%    It is known as the discontinuous medium wave function.
%
%    Here, we are computing the first component of the solution, P(X,Y).
%
%    It should be plotted on (x,y) in [-1,0]x[0,0.1].
%
%    The second variable y actually represents time.
%
%    Note that in the reference, the formula reads:
%     f(i) = 2.0D+00 * rhor * cr / ( rhol * cl + rhor * cr ) 
%          * sin ( r8_pi * omega * ( y(i) - ( x(i) + 0.5D+00 ) / cr ) )
%    but I believe this should be:
%     f(i) = 2.0D+00 * rhor * cr / ( rhol * cl + rhor * cr ) 
%          * sin ( r8_pi * omega * ( y(i) - ( x(i) + 0.5D+00 ) / cl ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Determining the locations and discontinuities in the derivatives
%    of functions,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 577-592.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), Y(N), the arguments.
%
%    Output, real F(N), the function values.
%
  cl = 0.87879;
  cr = 1.0;
  omega = 12.0;
  rhol = 0.55556;
  rhor = 1.0;

  i = find ( x <= -0.5 );
  j = find ( -0.5 < x );
 
  f(i) = sin ( pi * omega * ( y(i) - ( x(i) + 0.5 ) / cl ) ) ...
     - ( rhol * cl - rhor * cr ) / ( rhol * cl + rhor * cr )  ...
     * sin ( pi * omega * ( y(i) + ( x(i) + 0.5 ) / cl ) );

  f(j) = 2.0 * rhor * cr / ( rhol * cl + rhor * cr ) ...
     * sin ( pi * omega * ( y(j) - ( x(j) + 0.5 ) / cl ) );

  return
end

