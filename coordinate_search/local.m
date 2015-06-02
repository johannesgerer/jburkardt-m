function f = local ( x )

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
%    01 January 2012
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
%    Input, real X(2), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  if ( length ( x ) ~= 2 )
    error ( 'Error: function expects a two dimensional input\n' );
  end

  f = ( x(1)^2 + 12 * x(2) - 1 )^2 ...
    + ( 49 * x(1)^2 + 49 * x(2)^2 + 84 * x(1) + 2324 * x(2) - 681 )^2;
 
  return
end
