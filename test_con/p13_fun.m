function fx = p13_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P13_FUN evaluates the function for problem 13.
%
%  Discussion:
%
%    Simpson's mildly nonlinear boundary value problem.
%
%    The continuous problem is defined on the unit square,
%    and has the form:
%
%      - Laplacian ( U(X,Y) ) = LAMBDA * F ( U(X,Y) )
%
%    for points within the unit square, and boundary condition
%
%      U(X,Y) = 0.
%
%    The continuous problem is discretized with a uniform M by M
%    mesh of point in the interior.  Let DEL9 be the nine point
%    discrete Laplacian operator, and DEL5 the five point discrete
%    Laplacian operator.  Then the discrete problem has the form:
%
%      DEL9 U + lambda * ( F(U) + H**2 * DEL5 ( F(U) ) / 12 )  =  0.0
%
%    where H is the mesh spacing.
%
%    The options allow a choice of M and the right hand side function F.
%
%    OPTION   M    NVAR  F(U)
%
%       1   8     65   exp ( U )
%       2   8     65   ( 100 + 100 * U + 51 * U**2 ) / ( 100 + U**2 )
%       3  12    145   exp ( U )
%       4  12    145   ( 100 + 100 * U + 51 * U**2 ) / ( 100 + U**2 )
%       5  16    257   exp ( U )
%       6  16    257   ( 100 + 100 * U + 51 * U**2 ) / ( 100 + U**2 )
%
%    Melhem lists a limit point in LAMBDA for each of the option cases
%    above.  Letting U* be the value of the computed solution at the
%    center point of the grid, we have:
%
%    OPTION   Lambda          U*
%
%     1     6.807504     1.391598
%     2     7.980356     2.272364
%     3     6.808004     1.391657
%     4     7.981426     2.273045
%     5     6.808087     1.391656
%     6     7.981605     2.273159
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
%    Rami Melhem, Werner Rheinboldt,
%    A Comparison of Methods for Determining Turning Points of Nonlinear Equations,
%    Computing,
%    Volume 29, Number 3, September 1982, pages 201-226.
%
%    Bruce Simpson,
%    A Method for the Numerical Determination of Bifurcation
%    States of Nonlinear Systems of Equations,
%    SIAM Journal on Numerical Analysis,
%    Volume 12, Number 3, June 1975, pages 439-451.
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
%  Compute M, the order of the square grid, such that M*M = NVAR-1.
%
  m = round ( sqrt ( ( nvar - 1 ) ) );

  lambda = x(nvar);
  fx = p13_fx2 ( option, m, x, lambda );

  return
end
