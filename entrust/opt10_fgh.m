function [ f, g, H ] = opt10_fgh ( x, flag ) 

%*****************************************************************************80
%
%% OPT10_FGH evaluates F, G and H for test case #10.
%
%  Discussion:
%
%    This example is known as the Wood function.
%
%    The optimizing value is 
%
%      X* = (1,1,1,1)
%
%    for which
%
%      F(X*) = 0.
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
%    Input, real X(4), the evaluation point.
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
%    Output, real G(4,1), the gradient column vector.
%
%    Output, real H(4,4), the Hessian matrix.
%
  n = length ( x );

  if ( n ~= 4 )
    fprintf ( '\n' );
    fprintf ( 'OPT10_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 4.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  f = 100   * ( x(1)^2 - x(2)   )^2 ...
    +         ( 1 - x(1)        )^2 ...
    +  90   * ( x(3)^2 - x(4)   )^2 ...
    +         ( 1 - x(3)        )^2 ...
    +  10   * ( x(2) + x(4) - 2 )^2 ...
    +   0.1 * ( x(2) - x(4)     )^2;

  g = zeros(n,1);
   
  g(1,1) =   100   * 2 * ( x(1)^2 - x(2) ) * 2 * x(1)...
         -           2 * ( 1 - x(1) );

  g(2,1) = - 100   * 2 * ( x(1)^2 - x(2) )...
           +  10   * 2 * ( x(2) + x(4) - 2 )...
           +   0.1 * 2 * ( x(2) - x(4) );

  g(3,1) =    90   * 2 * ( x(3)^2 - x(4) ) * 2 * x(3)...
           -         2 * ( 1 - x(3) );

  g(4,1) = -  90   * 2 * ( x(3)^2 - x(4) )...
           +  10   * 2 * ( x(2) + x(4) - 2 )...
           -   0.1 * 2 * ( x(2) - x(4) );

  H = zeros(n,n);

  H(1,1) =   1200 * x(1)^2 - 400 * x(2) + 2;
  H(1,2) = - 400 * x(1);
  H(1,3) =     0;
  H(1,4) =     0;

  H(2,1) = - 400 * x(1);
  H(2,2) =   220.2;
  H(2,3) =     0;
  H(2,4) =    19.8;

  H(3,1) = H(1,3);
  H(3,2) = H(2,3);
  H(3,3) = 1080 * x(3)^2 - 360 * x(4) + 2;
  H(3,4) = - 360 * x(3);

  H(4,1) = H(1,4);
  H(4,2) = H(2,4);
  H(4,3) = H(3,4);
  H(4,4) = 200.2;
