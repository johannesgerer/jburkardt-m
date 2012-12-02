function [ f, g, H ] = opt14_fgh ( x, flag )

%% OPT14_FGH evaluates F, G and H for test case #14.
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
    fprintf ( 'OPT14_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 3.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  f = ( x(1)^2 *x(2) + x(1) * x(2)^2 )^2 ...
    + ( 3 * x(1) * x(2)^2 * x(3) - x(1) * x(3) - 1 )^2 ...
    + ( x(1) * x(3) - 2 )^2;
 
  g(1,1) = 2*( x(1)^2*x(2) + x(1)*x(2)^2 )*( 2*x(1)*x(2) + x(2)^2 ) + ...
           2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 3*x(2)^2*x(3) - x(3) ) +...
           2*( x(1)*x(3) - 2 )*( x(3) );
  g(2,1) = 2*( x(1)^2*x(2) + x(1)*x(2)^2 )*( x(1)^2 + 2*x(1)*x(2) ) + ...
           2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 6*x(1)*x(2)*x(3) );
  g(3,1) = 2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 3*x(1)*x(2)^2 - x(1) ) +...
           2*( x(1)*x(3) - 2 )*( x(1) );

  H(1,1) = 2*( x(1)^2*x(2) + x(1)*x(2)^2 )*( 2*x(2) ) + ...
           2*( 2*x(1)*x(2) + x(2)^2 )*( 2*x(1)*x(2) + x(2)^2 ) + ...
           2*( 3*x(2)^2*x(3) - x(3) )*( 3*x(2)^2*x(3) - x(3) ) + ...
           2*( x(3) )*( x(3) );
  H(1,2) = 2*( x(1)^2*x(2) + x(1)*x(2)^2 )*( 2*x(1) + 2*x(2) ) + ...
           2*( x(1)^2 + 2*x(1)*x(2) )*( 2*x(1)*x(2) + x(2)^2 ) + ...
           2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 6*x(2)*x(3) ) + ...
           2*( 6*x(1)*x(2)*x(3) )*( 3*x(2)^2*x(3) - x(3) );
  H(1,3) = 2*( 3*x(1)*x(2)^2 - x(1) )*( 3*x(2)^2*x(3) - x(3) ) + ...
           2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 3*x(2)^2 - 1 ) + ...
           2*( x(1)*x(3) - 2 ) + 2*( x(1) )*( x(3) );

  H(2,1) = H(1,2);
  H(2,2) = 2*( x(1)^2 + 2*x(1)*x(2) )*( x(1)^2 + 2*x(1)*x(2) ) + ...
           2*( x(1)^2*x(2) + x(1)*x(2)^2 )*( 2*x(1) ) + ...
           2*( 6*x(1)*x(2)*x(3) )*( 6*x(1)*x(2)*x(3) ) + ...
           2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 6*x(1)*x(3) );
  H(2,3) = 2*( 6*x(1)*x(2)*x(3) )*( 3*x(1)*x(2)^2 - x(1) ) + ...
           2*( 3*x(1)*x(2)^2*x(3) - x(1)*x(3) - 1 )*( 6*x(1)*x(2) );

  H(3,1) = H(1,3);
  H(3,2) = H(2,3);
  H(3,3) = 2*( 3*x(1)*x(2)^2 - x(1) )*( 3*x(1)*x(2)^2 - x(1) ) + ...
           2*( x(1) )*( x(1) );




