function [ f, g, H ] = opt05_fgh ( x, flag, a ) 

%*****************************************************************************80
%
%% OPT05_FGH evaluates F, G and H for test case #5.
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
%      X* = (1/A, A).
%
%    for which
%
%      F(X*) = 0.
%
%    A typical value of A is 1.  For values of A that are greater or lesser
%    than 1, the optimization can take significantly longer.
%
%  Modified:
%
%    09 January 2008
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
%    'f' means only the value of F is needed,
%    'g' means only the value of G is needed,
%    'all' means F, G and H (if appropriate) are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Input, real A, the scale factor.  A typical value is 1.
%    A should not be 0.
%
%    Output, real F, the optimization function.
%
%    Output, real G(2,1), the gradient column vector.
%
%    Output, real H(2,2), the Hessian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT05_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  if ( a == 0 )
    fprintf ( '\n' );
    fprintf ( 'OPT05_FGH - Fatal error!\n' );
    fprintf ( '  The scale factor A should be nonzero.\n'), 
    keyboard
  end

  f      = 100*( (a*x(1))^2 - x(2)/a )^2 + ( 1 - a*x(1) )^2;

  g(1,1) = 400*a^4*x(1)^3 - 400*a*x(1)*x(2) - 2*a + 2*a^2*x(1);
  g(2,1) =-200*a*x(1)^2 + 200*x(2)/a^2;

  H(1,1) = 1200*a^4*x(1)^2 - 400*a*x(2) + 2*a^2;
  H(1,2) =-400*a*x(1);
  H(2,1) = H(1,2);
  H(2,2) = 200/a^2;
