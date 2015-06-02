function [ f, g, H ] = opt08_fgh ( x, flag )

%*****************************************************************************80
%
%% OPT08_FGH evaluates F, G and H for test case #8.
%
%  Discussion:
%
%    This example is known as the extended Powell singular function.
%
%    The problem size N is arbitrary, except that it must be a multiple of 4.
%
%    The optimizing value is
%
%      X* = (0,0,0,0,...)
%
%    Thanks to Moein Parsinia for correcting the calculation of two entries of 
%    the Hessian matrix, 06 December 2014.
%
%  Modified:
%
%    13 December 2014
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

  if ( mod ( n, 4 ) ~= 0)
    fprintf ( '\n' );
    fprintf ( 'OPT08_FGH - Fatal error!\n' );
    fprintf ( '  The input vector X should have length divisible by 4.\n'), 
    fprintf ( '  Instead, it has length = %d.\n', n );
    keyboard
  end

  r = zeros(n,1);
  for i = 1 : n/4
    r(4*i-3) = x(4*i-3) + 10*x(4*i-2);
    r(4*i-2) = sqrt(5)*( x(4*i-1)-x(4*i) );
    r(4*i-1) = ( x(4*i-2)-2*x(4*i-1) )^2;
    r(4*i  ) = sqrt(10)*( x(4*i-3)-x(4*i) )^2;
  end
  f = r' * r;

  g = zeros(n,1);
  for i = 1 : n/4
    g(4*i-3) =   2*(x(4*i-3)+10*x(4*i-2)) + 40*(x(4*i-3)  -x(4*i  ))^3;
    g(4*i-2) =  20*(x(4*i-3)+10*x(4*i-2)) +  4*(x(4*i-2)-2*x(4*i-1))^3;
    g(4*i-1) =  10*(x(4*i-1)-   x(4*i  )) -  8*(x(4*i-2)-2*x(4*i-1))^3;
    g(4*i  ) = -10*(x(4*i-1)-   x(4*i  )) - 40*(x(4*i-3)  -x(4*i  ))^3;
  end

  H = zeros(n,n);
  for i = 1 : n/4
    H(4*i-3,4*i-3) =  2 + 120*(x(4*i-3)-x(4*i))^2;
    H(4*i-3,4*i-2) =  20;
    H(4*i-3,4*i-1) =  0;
    H(4*i-3,4*i  ) = -120*(x(4*i-3)-x(4*i))^2;
      
    H(4*i-2,4*i-3) =  H(4*i-3,4*i-2);
    H(4*i-2,4*i-2) =  200 + 12*(x(4*i-2)-2*x(4*i-1))^2;
    H(4*i-2,4*i-1) = -24*(x(4*i-2)-2*x(4*i-1))^2;
    H(4*i-2,4*i  ) =  0;
      
    H(4*i-1,4*i-3) =  H(4*i-3,4*i-1);
    H(4*i-1,4*i-2) =  H(4*i-2,4*i-1);
    H(4*i-1,4*i-1) =  10 + 48*(x(4*i-2)-2*x(4*i-1))^2;
    H(4*i-1,4*i  ) = -10;
      
    H(4*i  ,4*i-3) = H(4*i-3,4*i  );
    H(4*i  ,4*i-2) = H(4*i-2,4*i  );
    H(4*i  ,4*i-1) = H(4*i-1,4*i  );
    H(4*i  ,4*i  ) = 10 + 120*(x(4*i-3)-x(4*i))^2;
  end

  return
end