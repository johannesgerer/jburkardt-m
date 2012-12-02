function fx = p19_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P19_FUN evaluates the function for problem 19.
%
%  Title:
%
%    Nitric acid absorption problem
%
%  Description:
%
%    Physical Constants:
%
%      CON    - physical equilibrium constants for the five reagents.
%      FLOW   - flow rates for the five reagants in moles/hour.
%      PRESS  - pressure in atmospheres
%      TEMPER - temperature in Kelvin
%
%    Variables:
%
%      Entries 1 to 5 are the relative concentrations of liquid:
%
%        X(1)  = liquid NO2.
%        X(2)  = liquid N2O4.
%        X(3)  = liquid NO.
%        X(4)  = liquid H2O.
%        X(5)  = liquid HNO3.
%
%      Entries 6 through 10 are the relative concentrations of vapor:
%
%        X(6)  = vapor NO2.
%        X(7)  = vapor N2O4.
%        X(8)  = vapor NO.
%        X(9)  = vapor H2O.
%        X(10) = vapor HNO3.
%
%      Entries 11 and 12 are the number of moles:
%
%        X(11) = moles of liquid.
%        X(12) = moles of vapor.
%
%      Entry 13 is LAMBDA:
%
%        X(13) = LAMBDA, flowrate multiplier.
%
%    Equations:
%
%      Mole Balance equations, I = 1 to 5:
%
%        FX(I) = X(11) * X(I) + X(12) * X(I+5) - X(13) * FLOW(I)
%
%      Liquid-Vapor Transfer equations, I = 6 to 10:
%
%        FX(I) =  X(I) - CON(I-5) * X(I-5)
%
%      Liquid and Vapor proportions add to 1:
%
%        FX(11) =  X(1) + X(2) + X(3) + X(4) + X(5) - 1.0
%        FX(12) =  X(6) + X(7) + X(8) + X(9) + X(10) - 1.0
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
%    Tama Copeman,
%    Air Products and Chemicals, Inc.
%    Box 538,
%    Allentown, Pennsylvania, 18105.
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
  press = 7.0;
  temper = 323.0;
%
%  Get chemical constants.
%
  [ con, flow ] = p19_con ( nvar, press, temper, x );
%
%  Evaluate the Mole Balance equations:
%
  for i = 1 : 5
    fx(i) = x(11) * x(i) + x(12) * x(i+5) - x(13) * flow(i);
  end
%
%  Evaluate the Liquid-Vapor Transfer equations:
%
  for i = 6 : 10
    fx(i) = x(i) - con(i-5) * x(i-5);
  end
%
%  Evaluate the Liquid and Vapor Proportion equations:
%
  fx(11) = x(1) + x(2) + x(3) + x(4) + x(5) - 1.0;
  fx(12) = x(6) + x(7) + x(8) + x(9) + x(10) - 1.0;

  return
end
