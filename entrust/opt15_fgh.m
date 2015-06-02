function [ f, g, H ] = opt15_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT15_FGH evaluates F, G and H for test case #15.
%
%  Discussion:
%
%    This example, if started at X = (-1,0), seems to get stuck.
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
%    Output, real F, the optimization function.
%
%    Output, real G(2,1), the gradient column vector.
%
%    Output, real H(2,2), the Hessian matrix.
%
  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT15_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  f = - ( x(1) + x(2) ) ...
      + 0.5 * ( 1 - ( x(1)^2 + x(2)^2 ) ) ...
      + 5.0 * ( 1 - ( x(1)^2 + x(2)^2 ) )^2;
 
  g(1,1) = -1 - 21 * x(1) + 20 * x(1) * ( x(1)^2 + x(2)^2 );
  g(2,1) = -1 - 21 * x(2) + 20 * x(2) * ( x(1)^2 + x(2)^2 );

  H = zeros(n,n);

  H(1,1) = - 21 + 60 * x(1)^2 + 20 * x(2)^2;
  H(1,2) = 40 * x(1) * x(2);

  H(2,1) = 40 * x(1) * x(2);
  H(2,2) =  - 21 + 20 * x(1)^2 + 60 * x(2)^2;
