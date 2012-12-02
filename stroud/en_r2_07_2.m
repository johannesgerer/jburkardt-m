function [ o, x, w ] = en_r2_07_2 ( n )

%*****************************************************************************80
%
%% EN_R2_07_2 implements the Stroud rule 7.2 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = 2^(N+1) + 4 * N^2.
%
%    The rule has precision P = 7.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    The rule requires 3 <= N.
%
%    The reference has a typographical error in the description of this rule.
%    The formula:
%
%      (t,t,t,...,t)FS
%
%    should read
%
%      (t,t,0,...,0)FS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%    3 <= N.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_07_2 - Fatal error!\n' );
    fprintf ( 1, '  3 <= N is required.\n' );
    error ( 'EN_R2_07_2 - Fatal error!' );
  end

  o = 2^(n+1) + 4 * n^2;
  volume = sqrt ( pi^n );

  rho1 = sqrt ( ( n + 2 - sqrt ( 2 * ( n + 2 ) ) ) / 2 );
  rho2 = sqrt ( ( n + 2 + sqrt ( 2 * ( n + 2 ) ) ) / 2 );
  a1 = ( n + 2 + sqrt ( 2 * ( n + 2 ) ) ) / 2 / ( n + 2 );
  a2 = ( n + 2 - sqrt ( 2 * ( n + 2 ) ) ) / 2 / ( n + 2 );

  r = 1.0;
  s = sqrt ( 1 / n );
  t = sqrt ( 1 / 2 );
  b = ( 8 - n ) * volume / n / ( n + 2 ) / ( n + 4 );
  c = n^3 * volume / 2^n / n / ( n + 2 ) / ( n + 4 );
  d = 4 * volume / n / ( n + 2 ) / ( n + 4 );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  2 * 2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(i,k) = - rho1 * r;
    w(k) = a1 * b;
    k = k + 1;
    x(i,k) = - rho2 * r;
    w(k) = a2 * b;
    k = k + 1;
    x(i,k) = + rho1 * r;
    w(k) = a1 * b;
    k = k + 1;
    x(i,k) = + rho2 * r;
    w(k) = a2 * b;
  end
%
%  2 * 2^N points.
%
  k = k + 1;
  x(1:n,k) = - rho1 * s;
  w(k) = a1 * c;
  k = k + 1;
  x(1:n,k) = - rho2 * s;
  w(k) = a2 * c;
  more = 1;
  while ( more )
    more = 0;
    for i = n : -1 : 1
      if ( x(i,k) < 0.0 )
        k = k + 1;
        x(1:n,k) =     x(1:n,k-2);
        x(i,k)     =   abs ( x(i,k) );
        x(i+1:n,k) = - abs ( x(i+1:n,k) );
        w(k) = a1 * c;
        k = k + 1;
        x(1:n,k) =     x(1:n,k-2);
        x(i,k)     =   abs ( x(i,k) );
        x(i+1:n,k) = - abs ( x(i+1:n,k) );
        w(k) = a2 * c;
        more = 1;
        break;
      end
    end
  end
%
%  2 * 4 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - rho1 * t;
      x(j,k) = - rho1 * t;
      w(k) = a1 * d;
      k = k + 1;
      x(i,k) = - rho1 * t;
      x(j,k) = + rho1 * t;
      w(k) = a1 * d;
      k = k + 1;
      x(i,k) = + rho1 * t;
      x(j,k) = - rho1 * t;
      w(k) = a1 * d;
      k = k + 1;
      x(i,k) = + rho1 * t;
      x(j,k) = + rho1 * t;
      w(k) = a1 * d;
      k = k + 1;
      x(i,k) = - rho2 * t;
      x(j,k) = - rho2 * t;
      w(k) = a2 * d;
      k = k + 1;
      x(i,k) = - rho2 * t;
      x(j,k) = + rho2 * t;
      w(k) = a2 * d;
      k = k + 1;
      x(i,k) = + rho2 * t;
      x(j,k) = - rho2 * t;
      w(k) = a2 * d;
      k = k + 1;
      x(i,k) = + rho2 * t;
      x(j,k) = + rho2 * t;
      w(k) = a2 * d;
    end
  end

  return
end
