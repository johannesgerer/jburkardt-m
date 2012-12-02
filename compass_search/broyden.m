function f = broyden ( m, x )

%*****************************************************************************80
%
%% BROYDEN computes the two dimensional modified Broyden function.
%
%  Discussion:
%
%    This function has a global minimizer:
%
%      X = ( -0.511547141775014, -0.398160951772036 )
%
%    for which
%
%      F(X) = 1.44E-04
%
%    Start the search at
%
%      X = ( -0.9, -1.0 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Broyden,
%    A class of methods for solving nonlinear simultaneous equations,
%    Mathematics of Computation,
%    Volume 19, 1965, pages 577-593.
%
%    Jorge More, Burton Garbow, Kenneth Hillstrom,
%    Testing unconstrained optimization software,
%    ACM Transactions on Mathematical Software,
%    Volume 7, Number 1, March 1981, pages 17-41. 
%
%  Parameters:
%
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f1 = abs ( ( 3.0 -       x(1) ) * x(1) - 2.0 * x(2) + 1.0 );
  f2 = abs ( ( 3.0 - 2.0 * x(2) ) * x(2) -       x(1) + 1.0 );

  p = 3.0 / 7.0;

  f = f1.^p + f2.^p;
 
  return
end
