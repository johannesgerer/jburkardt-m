function [ res, jac ] = opt02_rj ( x, flag )

%% OPT02_RJ evaluates RES and JAC for test case #2.
%
%  Discussion:
%
%    This example is discussed in Dennis and Schnabel, pages 120 and 138.
%
%    A suggested initial value for X is
%
%      X init = ( 1, 1 ).
%
%    The optimizing value is
%
%      X* = ( 0, 0 )
%
%    and the optimal function value is
%
%      RES(X*) = ( 0, 0).
%
%  Modified:
%
%    04 January 2008
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
%    Input, real X(2), the evaluation point.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real RES(2), the residual column vector.
%
%    Output, real JAC(2,2), the jacobian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT02_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res(1,1) = sqrt ( x(1)^4 + x(1)^2 );
  res(2,1) = x(2);

  jac(1,1) = ( 2.0 * x(1)^2 + 1.0 ) / sqrt ( x(1)^2 + 1 );
  jac(1,2) = 0.0;

  jac(2,1) = 0.0;
  jac(2,2) = 1.0;

  return

