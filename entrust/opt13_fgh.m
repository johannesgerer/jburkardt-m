function [ f, g, H ] = opt13_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT13_FGH evaluates F, G and H for test case #13.
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
%    12 February 2008
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

  f = ( x(1)^2 + 12 * x(2) - 1 )^2 ...
    + ( 49 * x(1)^2 + 49 * x(2)^2 + 84 * x(1) + 2324 * x(2) - 681 )^2;

  g(1,1) = 9604 * x(1) * x(2)^2 + 8232 * x(2)^2 + 455552 * x(1) * x(2)...
         + 390432 * x(2) + 9608 * x(1) * x(1) * x(1) + 24696 * x(1) * x(1) ...
         - 119368 * x(1) - 114408;

  g(2,1) = -3165312 + 390432 * x(1) + 227776 * x(1)^2 + 10668764 * x(2) ...
         + 16464 * x(1) * x(2) + 9604 * x(1)^2 * x(2) ...
         + 683256 * x(2)^2 + 9604 * x(2)^3;

  H(1,1) = - 119368 + 49392 * x(1) + 28824 * x(1)^2 ...
         + 455552 * x(2) + 9604 * x(2)^2;
  H(1,2) = 390432 + 455552 * x(1) + 16464 * x(2) + 19208 * x(1) * x(2);
  H(2,1) = 390432 + 455552 * x(1) + 16464 * x(2) + 19208 * x(1) * x(2);
  H(2,2) = 10668764 + 16464 * x(1) + 9604*x(1)^2 + 1366512 * x(2) ...
         + 28812 * x(2)^2;
