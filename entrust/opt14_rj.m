function [ res, jac ] = opt14_rj ( x, flag )

%*****************************************************************************80
%
%% OPT14_RJ evaluates RES and JAC for test case #14.
%
%  Modified:
%
%    07 January 2008
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
%    Input, real X(3), the evaluation point.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real RES(3,1), the function column vector.
%
%    Output, real JAC(3,3), the Jacobian matrix.
%
  n = length ( x );

  if ( n ~= 3 )
    fprintf ( '\n' );
    fprintf ( 'OPT14_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 3.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res = zeros(n,1);

  res(1,1) = x(1)^2*x(2) + x(1)*x(2)^2;
  res(2,1) = 3 * x(1) * x(2)^2 * x(3) - x(1) * x(3) - 1;
  res(3,1) = x(1)*x(3) - 2;

  jac = zeros(n,n);

  jac(1,1) = 2 * x(1) * x(2) + x(2)^2;
  jac(1,2) = x(1)^2 + 2 * x(1) * x(2);
  jac(1,3) = 0;

  jac(2,1) = 3 * x(2)^2 * x(3) - x(3);
  jac(2,2) = 3 * 2 * x(1) * x(2) * x(3);
  jac(2,3) = 3 * x(1) * x(2)^2 - x(1);

  jac(3,1) = x(3);
  jac(3,2) = 0;
  jac(3,3) = x(1); 
