function [ f, g, H ] = opt12_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT12_FGH evaluates F, G and H for test case #2.
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
%      F(X*) = 0.
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
    fprintf ( 'OPT12_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 2.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  f1 = 1.5   - x(1) * ( 1.0 - x(2)    );
  f2 = 2.25  - x(1) * ( 1.0 - x(2) * x(2) );
  f3 = 2.625 - x(1) * ( 1.0 - x(2) * x(2) * x(2) );

  f = f1 * f1 + f2 * f2 + f3 * f3;

  df1dx1 = - ( 1.0 - x(2) );
  df1dx2 = x(1);
  df2dx1 = - ( 1.0 - x(2) * x(2) );
  df2dx2 = 2.0 * x(1) * x(2);
  df3dx1 = - ( 1.0 - x(2) * x(2) * x(2) );
  df3dx2 = 3.0 * x(1) * x(2) * x(2);

  g(1,1) = 2.0 * ( f1 * df1dx1 + f2 * df2dx1 + f3 * df3dx1 );
  g(2,1) = 2.0 * ( f1 * df1dx2 + f2 * df2dx2 + f3 * df3dx2 );

  d2f1dx12 = 1.0;
  d2f1dx21 = 1.0;
 
  d2f2dx12 = 2.0 * x(2);
  d2f2dx21 = 2.0 * x(2);
  d2f2dx22 = 2.0 * x(1);

  d2f3dx12 = 3.0 * x(2) * x(2);
  d2f3dx21 = 3.0 * x(2) * x(2);
  d2f3dx22 = 6.0 * x(1) * x(2);

  H(1,1) = 2.0 * ( df1dx1 * df1dx1 ...
                 + df2dx1 * df2dx1 ...
                 + df3dx1 * df3dx1 );

  H(1,2) = 2.0 * ( df1dx2 * df1dx1 + f1 * d2f1dx12 ...
                 + df2dx2 * df2dx1 + f2 * d2f2dx12 ...
                 + df3dx2 * df3dx1 + f3 * d2f3dx12 );

  H(2,1) = 2.0 * ( df1dx1 * df1dx2 + f1 * d2f1dx21 ...
                 + df2dx1 * df2dx2 + f2 * d2f2dx21 ...
                 + df3dx1 * df3dx2 + f3 * d2f3dx21 );

  H(2,2) = 2.0 * ( df1dx2 * df1dx2 ...
                 + df2dx2 * df2dx2 + f2 * d2f2dx22 ...
                 + df3dx2 * df3dx2 + f3 * d2f3dx22 );
