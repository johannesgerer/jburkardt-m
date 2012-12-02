function [ res, jac ] = opt06_rj ( x, flag )

%% OPT06_RJ evaluates RES and JAC for test case #6.
%
%  Discussion:
%
%    This example is the extended Rosenbrock function.
%
%    The optimizing value is
%
%      X* = (1,1,...)
%
%  Modified:
%
%    02 January 2008
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
%    Input, real X(N), the evaluation point.
%    Note that the dimension of X must be even.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real RES(N), the function column vector.
%
%    Output, real JAC(N,N), the Jacobian matrix.
%
  n = length ( x );

  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( '\n' );
    fprintf ( 'OPT06_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have even length.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res = zeros(n,1);
  for i=1:n/2
    res(2*i-1) = 10 * ( x(2*i)-x(2*i-1)^2 );
    res(2*i  ) = 1 - x(2*i-1);
  end

  jac = zeros(n,n);
  for i=1:n/2
    jac(2*i-1,2*i-1) = - 10 * 2 * x(2*i-1);
    jac(2*i-1,2*i  ) =   10;
    jac(2*i,  2*i-1) = - 1;
  end
