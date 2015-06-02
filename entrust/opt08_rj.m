function [ res, jac ] = opt08_rj ( x, flag )

%*****************************************************************************80
%
%% OPT08_RJ evaluates RES and JAC for test case #8.
%
%  Discussion:
%
%    This example is known as the extended Powell singular function.
%
%    The problem size is arbitrary, except that it should be a multiple of 4.
%
%    The optimizing value is
%
%      X* = (0,0,0,0,...)
%
%  Modified:
%
%    06 January 2008
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
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real RES(N,1), the function column vector.
%
%    Output, real JAC(N,N), the Jacobian matrix.
%
  n = length ( x );

  if ( mod ( n, 4 ) ~= 0)
    fprintf ( '\n' );
    fprintf ( 'OPT08_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length divisible by 4.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res = zeros(n,1);
  for i=1:n/4
    res(4*i-3) = x(4*i-3) + 10*x(4*i-2);
    res(4*i-2) = sqrt(5)*( x(4*i-1)-x(4*i) );
    res(4*i-1) = ( x(4*i-2) - 2 * x(4*i-1) )^2;
    res(4*i  ) = sqrt(10)*( x(4*i-3)-x(4*i) )^2;
  end

  jac = zeros(n,n);
  for i=1:n/4
    jac(4*i-3,4*i-3) =  1;
    jac(4*i-3,4*i-2) = 10;
    jac(4*i-3,4*i-1) =  0;
    jac(4*i-3,4*i  ) =  0;
      
    jac(4*i-2,4*i-3) = 0;
    jac(4*i-2,4*i-2) = 0;
    jac(4*i-2,4*i-1) =   sqrt ( 5 );
    jac(4*i-2,4*i  ) = - sqrt ( 5 );
      
    jac(4*i-1,4*i-3) = 0;
    jac(4*i-1,4*i-2) = 2 * ( x(4*i-2) - 2 * x(4*i-1) );
    jac(4*i-1,4*i-1) = - 4 * ( x(4*i-2) - 2 * x(4*i-1) );
    jac(4*i-1,4*i  ) = 0;
      
    jac(4*i  ,4*i-3) = 2 * sqrt(10) * ( x(4*i-3) - x(4*i) );
    jac(4*i  ,4*i-2) = 0;
    jac(4*i  ,4*i-1) = 0;
    jac(4*i  ,4*i  ) = - 2 * sqrt(10) * ( x(4*i-3) - x(4*i) );
  end

