function [ f, g, H ] = opt04_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT04_FGH evaluates F, G and H for test case #4.
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
  if ( length ( x ) ~= 2 )
    error ( 'Error: function expects a two dimensional input\n' );
  end

  f = ( x(1)^2 + x(2) - 11 )^2 ...
    + ( x(1) + x(2)^2 - 7 )^2;

  g(1,1) = 2 * ( x(1)^2 + x(2) - 11 ) * 2 * x(1) ...
         + 2 * ( x(1) + x(2)^2 - 7 );
  g(2,1) = 2 * ( x(1)^2 + x(2) - 11 ) ...
         + 2 * ( x(1) + x(2)^2 - 7 ) * 2 * x(2);

  H(1,1) = 2 * 2 * x(1) * 2 * x(1) ...
         + 2 * 2 * ( x(1)^2 + x(2) - 11 )...
         + 2;
  H(1,2) = 2 * 2 * x(1) + 2 * 2 * x(2);
  H(2,1) = 2 * 2 * x(1) + 2 * 2 * x(2);
  H(2,2) = 2 ...
         + 2 * 2 * x(2) * 2 * x(2) ...
         + 2 * ( x(1) + x(2)^2 - 7 ) * 2;
