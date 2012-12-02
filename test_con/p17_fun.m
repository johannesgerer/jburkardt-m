function fx = p17_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P17_FUN evaluates the function for problem 17.
%
%  Title:
%
%    The Bremermann Propane Combustion System
%
%  Description:
%
%    The equations describe the combustion of propane (C3H4) in air
%    (O2 and N2) at 2200 degrees Fahrenheit.  The chemical substances
%    monitored include:
%
%      X(1)  CO2  carbon dioxide
%      X(2)  H2O  water
%      X(3)  N2
%      X(4)  CO   carbon monoxide
%      X(5)  H2
%      X(6)  H
%      X(7)  OH
%      X(8)  O
%      X(9)  NO
%      X(10) O2
%
%    with auxilliary variables
%
%      X(11)  amount of air: 0.5*X(11) moles of O2, 2*X(11) moles of N2.
%      X(12)  air pressure in atmospheres.
%
%    The mass balance and reaction equations become, once square
%    roots are eliminated:
%
%      F(1) = X(1) + X(4) - 3.0
%      F(2) = 2 * X(1) + X(2) + X(4) + X(7) + X(8) + X(9)
%             + 2 * X(10) - X(12)
%      F(3) = 2 * X(2) + 2 * X(5) + X(6) + X(7) - 8.0
%      F(4) = 2 * X(3) + X(9) - 4 * X(12)
%      F(5) = X(1) * X(5) - 0.193 * X(2) * X(4)
%      F(6) = X(11) * X(1) * X(6)**2 - 0.002597**2 * X(2) * X(4) * XSUM
%      F(7) = X(11) * X(4) * X(7)**2 - 0.003448**2 * X(1) * X(2) * XSUM
%      F(8) = X(11) * X(4) * X(8) - 0.0001799 * X(1) * XSUM
%      F(9) = X(11) * X(4)**2 * X(9)**2
%             - 0.0002155**2 * X(1)**2 * X(3) * XSUM
%      F(10)= X(11) * X(4)**2 * X(10) - 0.00003846 * X(1)**2 * XSUM
%
%    where
%
%      XSUM = Sum ( 1 <= I <= 10 ) X(I)
%
%  Options:
%
%    OPTION = 1:
%
%      FX(11) = X(11) - 1.0 (fixed concentration)
%
%    OPTION = 2:
%
%      FX(11) = X(12) - 5.0 (fixed pressure)
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
%    Hans Bremermann,
%    Calculation of Equilibrium Points for Models of Ecological and
%    Chemical Systems,
%    in Proceedings of a Conference on the Applications of Undergraduate
%    Mathematics in the Engineering, Life, Managerial and Social Sciences,
%    Georgia Institute of Technology, June 1973, pages 198-217.
%
%    K L Hiebert,
%    A Comparison of Software Which Solves Systems of Nonlinear Equations,
%    Technical Report SAND-80-0181, 1980,
%    Sandia National Laboratory, Albuquerque, New Mexico,
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
  xsum = sum ( x(1:10) );

  fx(1) = x(1) + x(4) - 3.0;

  fx(2) = 2.0 * x(1) + x(2) + x(4) + x(7) + x(8) + x(9) ...
    + 2.0 * x(10) - x(12);

  fx(3) = 2.0 * x(2) + 2.0 * x(5) + x(6) + x(7) - 8.0;

  fx(4) = 2.0 * x(3) + x(9) - 4.0 * x(12);

  fx(5) = x(1) * x(5) - 0.193 * x(2) * x(4);

  fx(6) = x(11) * x(1) * x(6) * x(6) - 0.002597 * 0.002597 * x(2) * x(4) * xsum;

  fx(7) = x(11) * x(4) * x(7) * x(7) - 0.003448 * 0.003448 * x(1) * x(2) * xsum;

  fx(8) = x(11) * x(4) * x(8) - 0.0001799 * x(1) * xsum;

  fx(9) = x(11) * x(4) * x(4) * x(9) * x(9) ...
    - 0.0002155 * 0.0002155 * x(1) * x(1) * x(3) * xsum;

  fx(10) = x(11) * x(4) * x(4) * x(10) - 0.00003846 * x(1) * x(1) * xsum;

  if ( option == 1 )
    fx(11) = x(11) - 1.0;
  elseif ( option == 2 )
    fx(11) = x(12) - 5.0;
  end

  return
end
