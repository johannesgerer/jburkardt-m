function fx = p02_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P02_FUN evaluates the function for problem 2.
%
%  Title:
%
%    The Boggs function
%
%  Description:
%
%    The function F is derived via homotopy from a simpler function:
%
%      F(X(1),X(2),X(3)) = G(X(1),X(2)) + (X(3)-1) * G(Y1,Y2)
%
%    with
%
%      (Y1, Y2) some starting value,
%
%    and
%
%      G(1) = X(1)*X(1) - X(2) + 1
%      G(2) = X(1) - COS(PI*X(2)/2)
%
%  Options:
%
%    OPTION = 1,
%      use starting point (  1,  0, 0 ).
%    OPTION = 2,
%      use starting point (  1, -1, 0 ).
%    OPTION = 3,
%      use starting point ( 10, 10, 0 ).
%
%  Target Points:
%
%    For the target value X(3) = 1.0, the solution is ( 0, 1, 1 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Boggs,
%    The Solution of Nonlinear Systems by A-stable Integration Techniques,
%    SIAM Journal on Numerical Analysis,
%    Volume 8, Number 4, December 1971, pages 767-785.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real  X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%

%
%  Get the starting point
%
  y = p02_start ( option, nvar );
%
%  Get the function value at the starting point and at the
%  current point.
%
  gy = p02_gx ( y );
  gx = p02_gx ( x );
%
%  Use X3 to compute a homotopy.
%
  for i = 1 : nvar - 1
    fx(i) = gx(i) + ( x(3) - 1.0 ) * gy(i);
  end

  return
end
