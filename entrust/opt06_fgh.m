function [ f, g, H ] = opt06_fgh ( x, flag )

%% OPT06_FGH evaluates F, G and H for test case #6.
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
%    Input, real X(N), the evaluation point.
%    Note that the dimension of X must be even.
%
%    Input, string FLAG, indicates what must be computed.
%    'f' means only the value of F is needed,
%    'g' means only the value of G is needed,
%    'all' means F, G and H (if appropriate) are needed.
%    It is acceptable to behave as though FLAG was 'all'
%    on every call.
%
%    Output, real F, the optimization function.
%
%    Output, real G(N,1), the gradient column vector.
%
%    Output, real H(N,N), the Hessian matrix.
%
  n = length ( x );

  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( '\n' );
    fprintf ( 'OPT06_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have even length.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  r = zeros(n,1);
  for i=1:n/2
    r(2*i-1) = 10*( x(2*i)-x(2*i-1)^2 );
    r(2*i  ) = 1 - x(2*i-1);
  end

  f = r' * r;

  g = zeros(n,1);
  for i=1:n/2
    g(2*i-1) =-400*( x(2*i)-x(2*i-1)^2 )*x(2*i-1) - 2*(1-x(2*i-1));
    g(2*i  ) = 200*( x(2*i)-x(2*i-1)^2 );
  end

  H = zeros(n,n);
  for i=1:n/2
    H(2*i-1,2*i-1) = 1200*x(2*i-1)^2 - 400*x(2*i) + 2;
    H(2*i  ,2*i-1) =-400*x(2*i-1);
    H(2*i-1,2*i  ) = H(2*i  ,2*i-1);
    H(2*i  ,2*i  ) = 200;
  end
