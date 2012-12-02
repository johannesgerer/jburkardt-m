function fx = p05_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P05_FUN evaluates the function for problem 5.
%
%  Title:
%
%    The Wacker function
%
%  Description:
%
%    The function is of the form
%
%      F(1) = ( 1 - A * X(4) ) * X(1) + X(4) * exp ( - X(2) ) / 3.0
%           + X(4) * ( A - 1 - 1/(3*E) )
%
%      F(2) = ( 1 - A * X(4) ) * X(2) - X(4) * log ( 1 + X(3)**2 ) / 5
%           + X(4) * ( A - 1 - log(2)/5 )
%
%      F(3) = ( 1 - A * X(3) ) * X(3) + X(4) * sin ( X(1) )
%           + X(4) * ( A - 1 - sin(1) )
%
%    with
%
%      A is a parameter, and
%      E is the base of the natural logarithm system, EXP(1.0).
%
%  Starting Point:
%
%    ( 0, 0, 0, 0 )
%
%  Options:
%
%    OPTION = 1,
%      A = 0.1;
%    OPTION = 2,
%      A = 0.5;
%    OPTION = 3,
%      A = 1.0.
%
%  Special points:
%
%
%    The value of the solution for which X(3) is 1 depends on the option
%    chosen:
%
%    Option    X(1)       X(2)       X(3)      X(4)
%
%      1    ( 1.147009,  1.431931,  1.000000, 1.084425 ).
%      2    ( 0.2412182, 0.4558247, 1.000000, 0.4534797 ).
%      3    ( 0.0000000, 0.0000000, 1.000000, 0.000000 ).
%
%    For option 3, there is a limit point in variable X(4):
%
%      ( -0.07109918, 0.06921115, 0.5009694, 0.2739685 ).
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
%    Hans-Joerg Wacker, Erich Zarzer, Werner Zulehner,
%    Optimal Stepsize Control for the Globalized Newton Method,
%    in Continuation Methods,
%    edited by Hans-Joerg Wacker,
%    Academic Press, 1978,
%    ISBN: 0127292500,
%    LC: QA1.S899.
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
  E = 2.71828182845904523536;

  if ( option == 1 )
    aval = 0.1;
  elseif ( option == 2 )
    aval = 0.5;
  else
    aval = 1.0;
  end

  fx(1) = ( 1.0 - aval * x(4) ) * x(1) ...
        + x(4) * exp ( - x(2) ) / 3.0 ...
        + x(4) * ( aval - 1.0 - 1.0 / ( 3.0 * E ) );

  fx(2) = ( 1.0 - aval * x(4) ) * x(2) ...
        - x(4) * log ( 1.0 + x(3) * x(3) ) / 5.0 ...
        + x(4) * ( aval - 1.0 - log ( 2.0 ) / 5.0 );

  fx(3) = ( 1.0 - aval * x(3) ) * x(3) ...
        + x(4) * sin ( x(1) ) ...
        + x(4) * ( aval - 1.0 - sin ( 1.0 ) );

  return
end
