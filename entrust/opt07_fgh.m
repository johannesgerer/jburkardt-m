function [ f, g, H ] = opt07_fgh ( x, flag )

%% OPT07_FGH evaluates F, G and H for test case #7.
%
%  Discussion:
%
%    This example is known as the helical valley function.
%
%    Note that the Hessian matrix is NOT supplied here.
%
%    The optimizing value is
%
%      X* = (1,0,0)
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
    fprintf ( 'OPT07_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length 3.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end
   
  if ( 0 < x(1) )
    theta = atan ( x(2) / x(1) ) / ( 2 * pi );
  elseif ( x(1) < 0 )
    theta = atan ( x(2) / x(1) ) / ( 2 * pi ) + 0.5;
  elseif ( 0 < x(2) )
    theta = 1 / 4;
  elseif ( x(2) < 0 )
    theta = - 1 / 4;
  else
    theta = 0;
  end

  r = zeros(3,1);

  r(1) = 10*( x(3) - 10*theta );
  r(2) = 10*( sqrt(x(1)^2 + x(2)^2) -1 );
  r(3) = x(3);

  f = r' * r;

  dtdx1 =-x(2)/(2*pi*(x(1)^2+x(2)^2));
  dtdx2 = x(1)/(2*pi*(x(1)^2+x(2)^2));

  if ( x(1)^2 + x(2)^2 == 0 )
    dtdx1 = 0;
    dtdx2 = 0;
  else
    dtdx1 = - x(2) / ( 2 * pi * ( x(1)^2 + x(2)^2 ) );
    dtdx2 =   x(1) / ( 2 * pi * ( x(1)^2 + x(2)^2 ) );
  end

  g = zeros(3,1);

  g(1) = -2000*(x(3)-10*theta)*dtdx1 + 200*(sqrt(x(1)^2+x(2)^2)-1)*...
            x(1)/sqrt( x(1)^2+x(2)^2 );
  g(2) = -2000*(x(3)-10*theta)*dtdx2 + 200*(sqrt(x(1)^2+x(2)^2)-1)*...
            x(2)/sqrt( x(1)^2+x(2)^2 );
  g(3) =  200*(x(3)-10*theta) + 2*x(3);

  H = zeros(3,3);
