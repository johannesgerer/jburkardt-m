function [ f, g, H ] = opt03_fgh ( x, flag, p )

%% OPT03_FGH evaluates F, G and H for test case #3.
%
%  Discussion:
%
%    To emphasize the relationship between this optimization problem
%    and the underlying set of nonlinear equations, we first write out
%    the values of the residual and jacobian for the nonlinear system,
%    and then combine them to form the optimization function, gradient,
%    and Hessian matrix.
%
%    This example is discussed in Dennis and Schabel, pages 225-226 and
%    page 231.
%
%    The behavior of the algorithm depends in part on the starting point X0,
%    and on the value of the parameter P.  Here is data for particular
%    choices of P, and suggested values for X0.
%
%      P    X*         FX*     Suggested X0
%     --  ---------  --------  ------------
%      8   0.69315    0.0      1 or  0.6
%      3   0.44005    1.6390   1 or  0.5
%     -1   0.044744   6.97655  1 or  0.0
%     -4  -0.37193   16.435    1 or -0.3
%     -8  -0.79148   41.145    1 or -0.7
%
%  Modified:
%
%    10 January 2008
%
%  Author:
%
%    Jeff Borggaard,
%    Gene Cliff,
%    Virginia Tech.
%
%  Reference:
%
%    John Dennis, Robert Schnabel,
%    Numerical Methods for Unconstrained Optimization 
%    and Nonlinear Equations,
%    SIAM, 1996,
%    ISBN13: 978-0-898713-64-0,
%    LC: QA402.5.D44.
%
%  Parameters:
%
%    Input, real X(1), the evaluation point.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of F is needed,
%    'g' means only the value of G is needed,
%    'all' means F, G and H (if appropriate) are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Input, real P, a parameter which occurs in the function
%    to be optimized.  Typical values of P are 8, 3, -1, -4
%    or -8.
%
%    Output, real F, the optimization function.
%
%    Output, real G(1,1), the gradient column vector.
%
%    Output, real H(1,1), the Hessian matrix.
%
  n = length ( x );

  if ( n ~= 1 )
    fprintf ( '\n' );
    fprintf ( 'OPT03_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 1.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res(1,1) = exp (     x(1) ) - 2;
  res(2,1) = exp ( 2 * x(1) ) - 4;
  res(3,1) = exp ( 3 * x(1) ) - p;

  jac(1,1) =     exp (     x(1) );
  jac(2,1) = 2 * exp ( 2 * x(1) );
  jac(3,1) = 3 * exp ( 3 * x(1) );

  f = 0.5 * res' * res;

  g = jac' * res;

  H = jac(1,1) * jac(1,1) + res(1,1) *     jac(1,1) ...
    + jac(2,1) * jac(2,1) + res(2,1) * 2 * jac(2,1) ...
    + jac(3,1) * jac(3,1) + res(3,1) * 3 * jac(3,1);
