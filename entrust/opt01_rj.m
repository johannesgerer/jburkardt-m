function [ res, jac ] = opt01_rj ( x, flag )

%*****************************************************************************80
%
%% OPT01_RJ evaluates RES and JAC for test case #1.
%
%  Discussion:
%
%    This example is discussed in Dennis and Schnabel, pages 100, 104 and 202.
%
%    Suggested starting value for X is ( 1, 1 ).
%
%    The optimizing value is
%
%      X* = ( 2, -1 ), 
%
%    for which 
%
%      RES(X*) = (0,0,0).
%
%  Modified:
%
%    05 January 2008
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
%    Output, real RES(3), the residual column vector.
%
%    Output, real JAC(3,2), the Jacobian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT01_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end
%
%  Formulated as a nonlinear system:
%
  res(1,1) = ( x(1) - 2 )^2;
  res(2,1) = ( x(1) - 2 ) * x(2);
  res(3,1) = ( x(2) + 1);

  jac(1,1) = 2 * ( x(1) - 2 );
  jac(1,2) = 0;

  jac(2,1) = x(2);
  jac(2,2) = x(1) - 2;

  jac(3,1) = 0;
  jac(3,2) = 1;

return
