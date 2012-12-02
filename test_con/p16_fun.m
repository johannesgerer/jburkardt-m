function fx = p16_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P16_FUN evaluates the function for problem 16.
%
%  Title:
%
%    The Moore-Spence Chemical Reaction Integral Equation
%
%  Description:
%
%    The continuous equation describes the heat and mass transfer in a
%    plate-shaped porous catalyst, and is of the form
%
%      Y(S) = 1 + integral ( 0 <= T <= 1) K(S,T) * G(Y(T)) dT
%
%    with
%
%      K(S,T) = MAX ( S, T ) - 1
%
%      G(Y) = Y * EXP ( BETA * GAMMA * ( 1 - Y )
%        / ( 1 + BETA * ( 1 - Y ) ) )
%
%    with
%
%      BETA = 0.4,
%      GAMMA = 20.0.
%
%    The integral equation is discretized using M equally spaced
%    abscissas T(I) from 0 to 1, and applying the trapezoidal rule to
%    compute the integrand.  Finally, the integral is multiplied
%    by a homotopy parameter LAMBDA so that the problem is easy
%    to solve for LAMBDA = 0, while the solution for LAMBDA = 1
%    is the solution of the original problem.  Thus:
%
%      F(I) = Y(I) - 1 - LAMBDA * Trapezoid ( K(S(I),T())*G(Y(T())), T() ).
%
%  Options:
%
%    The solution for LAMBDA = 1 is desired.
%
%    With NVAR = 17, Melhem lists the limit points in LAMBDA:
%
%      LAMBDA = 0.1375390,  x(16) = 0.8524311,
%      LAMBDA = 0.07791579, x(16) = 0.4657826.
%
%    Computational results with this program are:
%
%      LAMBDA = 0.1286312,  x(16) = 0.8977113,
%      LAMBDA = 0.0926850,  x(16) = 0.2956740.
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
%    Gerald Moore, Alastair Spence,
%    The Calculation of Turning Points of Nonlinear Equations,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 4, August 1980, pages 567-576.
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
  beta = 0.4;
  gamma = 20.0;

  lambda = x(nvar);
  m = nvar - 1;
  h = 1.0 / ( m - 1 );

  for i = 1 : m

    s = h * ( i - 1 );
    trapezoid = 0.0;

    for j = 1 : m

      t = h * ( j - 1 );

      arg = beta * gamma * ( 1.0 - x(j) ) / ( 1.0 + beta * ( 1.0 - x(j) ) );

      if ( j == 1 )
        factor = 0.5;
      elseif ( j < m - 1 )
        factor = 1.0;
      elseif ( j == m )
        factor = 0.5;
      end

      trapezoid = trapezoid + h * factor * x(j) * exp ( arg ) * ...
        ( max ( s, t ) - 1.0 );

    end

    fx(i) = x(i) - 1.0 - lambda * trapezoid;

  end

  return
end
