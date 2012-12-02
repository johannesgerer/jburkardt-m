function f = local_xy ( x , y )

%*****************************************************************************80
%
%% LOCAL_XY computes the local minimum function.
%
%  Discussion:
%
%    This function has a local minimum:
%
%      X* = (  0.28581..., 0.27936...), F(X*) = 5.9225...
%
%    and a global minimum:
%
%      X* = (  -21.026653..., -36.760090...), F(X*) = 0.
%
%    Suggested starting point:
%
%      X = ( 1, 1 ), F(X) = 3.33 * 10^6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2008
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
%    LC: T57.8.H55.
%
%  Parameters:
%
%    Input, real X, Y, the argument of the function.
%
%    Output, real F, the value of the function at (X,Y).
%
  f = ( x^2 + 12 * y - 1 )^2 ...
    + ( 49 * x^2 + 49 * y^2 + 84 * x + 2324 * y - 681 )^2;
 
  return
end
