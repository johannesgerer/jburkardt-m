function f = powell ( m, x )

%*****************************************************************************80
%
%% POWELL computes the Powell singular quartic function.
%
%  Discussion:
%
%    This function has a global minimizer:
%
%      X* = ( 0.0, 0.0, 0.0, 0.0 ), F(X*) = 0.
%
%    Start the search at
%
%      X = ( 3.0, -1.0, 0.0, 1.0 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Michael Powell,
%    An Iterative Method for Finding Stationary Values of a Function
%    of Several Variables,
%    Computer Journal,
%    Volume 5, 1962, pages 147-151.
%
%  Parameters:
%
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f1 = x(1) + 10.0 * x(2);
  f2 =                            x(3) - x(4);
  f3 =               x(2) - 2.0 * x(3);
  f4 = x(1)                            - x(4);

  f = f1 * f1 + f2 * f2 + f3 * f3 + f4 * f4;
 
  return
end
