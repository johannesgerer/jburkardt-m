function [ f, g, H ] = opt11_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT11_FGH evaluates F, G and H for test case #11.
%
%  Discussion:
%
%    This example is known as the box-constrained quartic function.
%
%    The optimizing value is
%
%      X* = (0,0,0)
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
%    Input, real X(3), the evaluation point.
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
%    Output, real G(3,1), the gradient column vector.
%
%    Output, real H(3,3), the Hessian matrix.
%
  n = length ( x );

  if ( n ~= 3 )
    fprintf ( '\n' );
    fprintf ( 'OPT11_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 3.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  f = 3*x(1)^4 + x(2)^4 + x(3)^2;

  g = zeros(n,1);
  g(1) = 12*x(1)^3;
  g(2) =  4*x(2)^3;
  g(3) =  2*x(3)  ;

  H = zeros(n,n);
  H(1,1) = 36*x(1)^2;
  H(2,2) = 12*x(2)^2;
  H(3,3) =  2       ;
