function f = local ( m, x )

%*****************************************************************************80
%
%% LOCAL computes the local function.
%
%  Discussion:
%
%    This function has a local minimizer:
%
%      X* = ( 0.2858054412..., 0.2793263206...), F(X*) = 5.9225...
%
%    and a global minimizer:
%
%      X* = ( -21.02667179..., -36.75997872...), F(X*) = 0.
%
%    Suggested starting point for local minimizer:
%
%      X = ( 1, 1 ), F(X) = 3.33 * 10^6.
%
%    Suggested starting point for global minimizer:
%
%      X = ( -15, -35), F(X) = 1.49 * 10^8.
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
%    David Himmelblau,
%    Applied Nonlinear Programming,
%    McGraw Hill, 1972,
%    ISBN13: 978-0070289215,
%    LC: T57.8.H55.
%
%  Parameters:
%
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f = ( x(1)^2 + 12.0 * x(2) - 1.0 )^2 ...
    + ( 49.0 * x(1)^2 + 49.0 * x(2)^2 + 84.0 * x(1) + 2324.0 * x(2) - 681.0 )^2;
 
  return
end
