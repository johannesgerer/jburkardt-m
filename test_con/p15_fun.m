function fx = p15_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P15_FUN evaluates the function for problem 15.
%
%  Title:
%
%    The Trigger Circuit.
%
%  Description:
%
%    The current flow of a trigger circuit with an operational amplifier
%    is modeled.  The variables are voltages, with X(6) the output
%    voltage and X(7) the input voltage.
%
%    The function has the form
%
%      F(X) = A * X + PHI ( X )
%
%    where A is a 6 by 7 matrix, and PHI is a nonlinear term, that is,
%
%      F(I) = SUM ( 1 <= J <= 7 ) A(I,J) * X(J) + PHI ( X )
%
%  Options:
%
%    Melhem lists the following limit points in X(7):
%
%    ( 0.04936  0.54735  0.04944  0.04944  0.12920  1.16602  0.60185 )
%    ( 0.23577  0.66296  0.23759  0.23760  0.62083  9.60913  0.32286 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 20008
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
%    Gerd Poenisch, Hubert Schwetlick,
%    Computing Turning Points of Curves Implicitly Defined by Nonlinear
%    Equations Depending on a Parameter,
%    Computing,
%    Volume 26, Number 2, June 1981, pages 107-121.
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
%  Get the linear coefficients.
%
  array = p15_gx ( );
%
%  Compute the linear portion of the function.
%
  fx(1:nvar-1) = 0.0;

  for i = 1 : nvar - 1
    for j = 1 : nvar
      fx(i) = fx(i) + array(i,j) * x(j);
    end
  end
%
%  Add the nonlinear terms.
%
  fx(2) = fx(2) + 5.6D-08 * ( exp ( 25.0 * x(2) ) - 1.0 );
  fx(5) = fx(5) + 5.6D-08 * ( exp ( 25.0 * x(5) ) - 1.0 );
  fx(6) = fx(6) - 7.65 * atan ( 1962.0 * ( x(3) - x(1) ) ) / 0.201;

  return
end
