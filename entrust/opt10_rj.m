function [ res, jac ] = opt10_rj ( x, flag ) 

%*****************************************************************************80
%
%% OPT10_RJ evaluates RES and JAC for test case #10.
%
%  Discussion:
%
%    This example is known as the Wood function.
%
%    The optimizing value is 
%
%      X* = (1,1,1,1)
%
%    for which
%
%      RES(X*) = (0,0,0,0,0,0).
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
%    Input, real X(4), the evaluation point.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of RES is needed,
%    'g' means only the value of JAC is needed,
%    'all' means RES and JAC are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real RES(6,1), the function column vector.
%
%    Output, real JAC(6,4), the Hessian matrix.
%
  m = 6;
  n = length ( x );

  if ( n ~= 4 )
    fprintf ( '\n' );
    fprintf ( 'OPT10_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 4.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res = zeros(m,1);

  res(1,1) = 100   * ( x(1)^2 - x(2)   );
  res(2,1) =         ( 1 - x(1)        );
  res(3,1) =  90   * ( x(3)^2 - x(4)   );
  res(4,1) =         ( 1 - x(3)        );
  res(5,1) =  10   * ( x(2) + x(4) - 2 );
  res(6,1) =   0.1 * ( x(2) - x(4)     );

  jac = zeros(m,n);

  jac(1,1) =   100 * 2 * x(1);
  jac(1,2) = - 100;
  jac(1,3) =     0;
  jac(1,4) =     0;

  jac(2,1) = -   1;
  jac(2,2) =     0;
  jac(2,3) =     0;
  jac(2,4) =     0;

  jac(3,1) =     0;
  jac(3,2) =     0;
  jac(3,3) =    90 * 2 * x(3);
  jac(3,4) = -  90;

  jac(4,1) =     0;
  jac(4,2) =     0;
  jac(4,3) = -   1;
  jac(4,4) =     0;

  jac(5,1) =     0;
  jac(5,2) =    10;
  jac(5,3) =     0;
  jac(5,4) =    10;

  jac(6,1) =     0;
  jac(6,2) =     0.1;
  jac(6,3) =     0;
  jac(6,4) = -   0.1;
