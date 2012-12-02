function f = p43_f ( n, x )

%*****************************************************************************80
%
%% P43_F evaluates the objective function for problem 43.
%
%  Discussion:
%
%    This function has 4 global minima:
%
%      X* = (  3,        2       ), F(X*) = 0.
%      X* = (  3.58439, -1.84813 ), F(X*) = 0.
%      X* = ( -3.77934, -3.28317 ), F(X*) = 0.
%      X* = ( -2.80512,  3.13134 ), F(X*) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Himmelblau,
%    Applied Nonlinear Programming,
%    McGraw Hill, 1972,
%    ISBN13: 978-0070289215,
%   LC: T57.8.H55.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%

 f = ( x(1)^2 + x(2) - 11.0 )^2 + ( x(1) + x(2)^2 - 7.0 )^2;

  return
end
