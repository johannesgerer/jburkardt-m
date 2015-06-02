function [ f, g, H ] = opt01_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT01_FGH evaluates F, G and H for test case #1.
%
%  Discussion:
%
%    This example is discussed in Dennis and Schnabel, pages 100, 104 and 202.
%
%    Suggested starting value for X is ( 1, 1 ).
%
%    The optimizing value is
%
%      X* = ( 2, -1 ), 
%
%    for which 
%
%      F(X*) = 0.
%
%    For the secant method used on page 104, the suggested initial estimate of
%    the Hessian is:
%
%      H init = [ 14, -4; -4, 4 ].
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
  fprintf ( 1, 'FLAG = %s\n', flag );

  n = length ( x );

  if ( n ~= 2 )
    fprintf ( '\n' );
    fprintf ( 'OPT01_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  f    = ( x(1) - 2 )^4 ...
       + ( x(1) - 2 )^2 * x(2)^2 ...
       + ( x(2) + 1 )^2;

  g    = [ 4*(x(1)-2)^3 + 2*(x(1)-2)*x(2)^2; 
           2*(x(1)-2)^2*x(2) + 2*(x(2)+1) ];

  H    = [ 12*(x(1)-2)^2 + 2*x(2)^2,   4*(x(1)-2)*x(2)   ;
            4*(x(1)-2)*x(2)        ,   2*(x(1)-2)^2 + 2  ];

return
