function [ res, jac ] = opt13_rj ( x, flag )

%*****************************************************************************80
%
%% OPT13_RJ evaluates RES and JAC for test case #13.
%
%  Discussion:
%
%    This function has a local minimum:
%
%      X* = (  0.28581..., 0.27936...), F(X*) = 5.9225...
%
%    and a global minimum:
%
%      X* = (  -21.026653..., -36.760090...), F(X*) = 0.
%
%    Suggested starting point:
%
%      X = ( 1, 1 ), F(X) = 3.33 * 10^6.
%
%  Modified:
%
%    06 February 2008
%
%  Author:
%
%    John Burkardt
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
%    Output, real RES(2), the residual column vector.
%
%    Output, real JAC(2,2), the jacobian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT13_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res(1,1) = x(1)^2 + 12 * x(2) - 1;
  res(2,1) = 49 * x(1)^2 + 49 * x(2)^2 + 84 * x(1) + 2324 * x(2) - 681;

  jac(1,1) = 2 * x(1);
  jac(1,2) = 12;

  jac(2,1) = 49 * 2 * x(1) + 84;
  jac(2,2) = 49 * 2 * x(2) + 2324;

