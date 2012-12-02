function fx = p04_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P04_FUN evaluates the function for problem 4.
%
%  Title:
%
%    The Broyden function
%
%  Description:
%
%    The function F is derived via homotopy from a simpler function G:
%
%      F(X(1),X(2),X(3)) = g(X(1),X(2)) + (X(3)-1) * G(Y1,Y2).
%
%    with
%
%      (Y1,Y2) some starting point,
%
%    and
%
%      G(1) = 0.5*sin(X(1)*X(2)) - X(2)/PI - X(1)
%      G(2) = (1-1/(4*PI))*(exp(2*X(1))-E) + E*X(2)/PI- 2*E*X(1)
%
%    where "E" = exp(1).
%
%  Options:
%
%    The only option starts with (0.4, 3, 0), and seeks the target
%    solution whose third component is 1.  The correct value of the
%    target solution is
%
%      ( -0.2207014, 0.8207467, 1.0D+00 )
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
%    Charles Broyden,
%    A New Method of Solving Nonlinear Simultaneous Equations,
%    The Computer Journal,
%    Volume 12, 1969, pages 94-99.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%

%
%  Get the starting point.
%
  y = p04_start ( option, nvar );
%
%  Get the function value at the starting point and at the
%  current point.
%
  gy = p04_gx ( y );
  gx = p04_gx ( x );
%
%  Use X3 to compute a homotopy.
%
  for i = 1 : nvar-1
    fx(i) = gx(i) + ( x(3) - 1.0 ) * gy(i);
  end

  return
end
