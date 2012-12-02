function [ res, jac ] = opt04_rj ( x, flag, a ) 

%% OPT04_RJ evaluates RES and JAC for test case #4
%
%  Discussion:
%
%    This example is known as the Himmelblau function.
%
%    This example appears in the book by Himmelblau.
%
%    This function has 4 global minima:
%
%      X* = (  3,        2       ), F(X*) = 0.
%      X* = (  3.58439, -1.84813 ), F(X*) = 0.
%      X* = ( -3.77934, -3.28317 ), F(X*) = 0.
%      X* = ( -2.80512,  3.13134 ), F(X*) = 0.
%
%  Modified:
%
%    26 January 2008
%
%  Author:
%
%    Jeff Borggaard,
%    Gene Cliff,
%    Virginia Tech.
%
%  Reference:
%
%    David Himmelblau,
%    Applied Nonlinear Programming,
%    McGraw Hill, 1972,
%    ISBN13: 978-0070289215,
%    LC: T57.8.H55.
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
%    Input, real A, the scale factor.  A typical value is 1.
%    A should not be 0.
%
%    Output, real RES(2,1), the residual column vector.
%
%    Output, real J(2,2), the Jacobian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT04_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res(1,1) = x(1)^2 + x(2) - 11;
  res(2,1) = x(1) + x(2)^2 - 7;

  jac(1,1) = 2 * x(1);
  jac(1,2) = 1;

  jac(2,1) = 1;
  jac(2,2) = 2 * x(2);
