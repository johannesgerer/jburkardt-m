function [ res, jac ] = opt12_rj ( x, flag )

%% OPT12_RJ evaluates RES and JAC for test case #12.
%
%  Discussion:
%
%    This is the Beale function.
%
%    Suggested initial values for X include:
%
%      X init = ( 1, 1 )
%
%      X init = ( 1, 4 ) (may have trouble converging)
%
%    The optimizing value is
%
%      X* = ( 3.0, 0.5 )
%
%    and the optimal function value is
%
%      RES(X*) = ( 0, 0,  0).
%
%  Modified:
%
%    28 January 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Evelyn Beale,
%    On an Iterative Method for Finding a Local Minimum of a Function
%    of More than One Variable,
%    Technical Report 25, 
%    Statistical Techniques Research Group,
%    Princeton University, 1958.
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
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
%    Output, real RES(3,1), the residual column vector.
%
%    Output, real JAC(3,2), the jacobian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT12_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  res(1,1) = 1.5   - x(1) * ( 1.0 - x(2)    );
  res(2,1) = 2.25  - x(1) * ( 1.0 - x(2) * x(2) );
  res(3,1) = 2.625 - x(1) * ( 1.0 - x(2) * x(2) * x(2) );

  jac(1,1) = - ( 1.0 - x(2) );
  jac(1,2) = x(1);

  jac(2,1) = - ( 1.0 - x(2) * x(2) );
  jac(2,2) = 2.0 * x(1) * x(2);

  jac(3,1) = - ( 1.0 - x(2) * x(2) * x(2) );
  jac(3,2) = 3.0 * x(1) * x(2) * x(2);


