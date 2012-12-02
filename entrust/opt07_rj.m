function [ res, jac ] = opt07_rj ( x, flag )

%% OPT07_RJ evaluates RES and JAC for test case #7.
%
%  Discussion:
%
%    This example is known as the helical valley function.
%
%    The optimizing value is
%
%      X* = (1,0,0)
%
%    for which
%
%      RES(X*) = (0,0,0).
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
    fprintf ( 'OPT07_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 3.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end
   
  if ( 0 < x(1) )
    theta = atan ( x(2) / x(1) ) / ( 2 * pi );
  elseif ( x(1) < 0 )
    theta = atan ( x(2) / x(1) ) / ( 2 * pi ) + 0.5;
  elseif ( 0 < x(2) )
    theta = 0.25;
  elseif ( x(2) < 0 )
    theta = - 0.25;
  else
    theta = 0;
  end

  res = zeros(3,1);

  res(1,1) = 10 * ( x(3) - 10 * theta );
  res(2,1) = 10 * ( sqrt ( x(1)^2 + x(2)^2 ) - 1 );
  res(3,1) = x(3);

  if ( x(1)^2 + x(2)^2 == 0 )
    dtdx1 = 0;
    dtdx2 = 0;
  else
    dtdx1 = - x(2) / ( 2 * pi * ( x(1)^2 + x(2)^2 ) );
    dtdx2 =   x(1) / ( 2 * pi * ( x(1)^2 + x(2)^2 ) );
  end

  jac = zeros(3,3);

  jac(1,1) = -100 * dtdx1;
  jac(1,2) = -100 * dtdx2;
  jac(1,3) = 10;

  if ( x(1)^2 + x(2)^2 == 0 )
    jac(2,1) = 0;
    jac(2,2) = 0;
  else
    jac(2,1) = 10 * x(1) / sqrt ( x(1)^2 + x(2)^2 );
    jac(2,2) = 10 * x(2) / sqrt ( x(1)^2 + x(2)^2 );
  end
  jac(2,3) = 0;

  jac(3,1) = 0;
  jac(3,2) = 0;
  jac(3,3) = 1;

