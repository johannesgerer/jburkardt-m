function [ res, jac ] = opt03_rj ( x, flag, p )

%% OPT03_RJ evaluates R and J for test case #3.
%
%  Discussion:
%
%    This example is discussed in Dennis and Schnabel, pages 225-226 and 231.
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
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Input, real P, a parameter which occurs in the function
%    to be optimized.  Typical values of P are 8, 3, -1, -4
%    or -8.
%
%    Output, real RES(3,1), the residual column vector.
%
%    Output, real JAC(3,1), the jacobian matrix.
%
  n = length ( x );

  if ( n ~= 1 )
    fprintf ( '\n' );
    fprintf ( 'OPT03_RJ - Fatal error!\n' );
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
