function [ f, g, H ] = opt09_fgh ( x, flag )

%% OPT09_FGH evaluates F, G and H for test case #9.
%
%  Discussion:
%
%    This example is known as the trigonometric function.
%
%    This example is discussed on page 362 of Dennis and Schnabel.
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

  cos_sum = sum ( cos ( x(1:n) ) );

  f = 0;
  for i = 1 : n
    t = n + i - cos_sum - i * cos ( x(i) ) - sin ( x(i) );
    f = f + t * t;
  end

  g = zeros(n,1);
   
  s = 0;
  for i = 1 : n
    t = n + i - cos_sum - i * cos ( x(i) ) - sin ( x(i) );
    s = s + t;
    g(i) = ( i * sin ( x(i) ) - cos ( x(i) ) ) * t;
  end

  for i = 1 : n
    g(i) = 2 * ( g(i) + sin ( x(i) ) * s );
  end

  H = zeros(n,n);

  for i = 1 : n
    H(i,i) = sin ( x(i) );
  end

  s = 0;

  for j = 1 : n

    th = cos ( x(j) );
    t = ( n + j ) - H(j,j) - cos_sum - j * th;
    s = s + t;
    for k = 1 : j-1
      H(j,k) = 2 * ( sin ( x(k) ) * ( ( n + j + k ) * H(j,j) - th ) ...
      - H(j,j) * cos ( x(k) ) );
    end

    H(j,j) = ( j * ( j + 2 ) + n ) * H(j,j)^2 + th * ...
      ( th - ( 2 * j + 2 ) * H(j,j) ) + t * ( j * th + H(j,j) );

  end

  for j = 1 : n
    H(j,j) = 2 * ( H(j,j) + cos ( x(j) ) * s );
  end

  for i = 1 : n
    H(i,i+1:n) = H(i+1:n,i);
  end
