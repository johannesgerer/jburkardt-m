function [ res, jac ] = opt05_rj ( x, flag, a ) 

%% OPT05_RJ evaluates RES and JAC for test case #5.
%
%  Discussion:
%
%    This example is known as the Rosenbrock "banana" function.
%
%    This example is discussed in Dennis and Schnabel, page 157.
%    (There is a misprint in Dennis and Schabel.  When they print the
%    rescaled function, they include an incorrect sign on the second term.)
%
%    This example tests the scaling matrices.
%
%    Suggested starting points are
%
%      X(init) = ( -1.2/A, A)
%      or
%      X(init) = ( 6.39/A, -0.221*A )
%
%    The optimizing value is
%
%      X* = (1/A, A)
%
%    for which
%
%      RES(X*) = (0,0).
%
%    A typical value of A is 1.  For values of A that are greater or lesser
%    than 1, the optimization can take significantly longer.
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
    fprintf ( 'OPT05_RJ - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  if ( a == 0 )
    fprintf ( '\n' );
    fprintf ( 'OPT05_RJ - Fatal error!\n' );
    fprintf ( '  The scale factor A should be nonzero.\n'), 
    keyboard
  end

  res(1,1) = 10 * ( ( a * x(1) )^2 - x(2) / a );
  res(2,1) = 1 - a * x(1);

  jac(1,1) = 20 * a * a * x(1);
  jac(1,2) = - 10 / a;

  jac(2,1) = - a;
  jac(2,2) = 0.0;
