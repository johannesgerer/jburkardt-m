function [ o, x, w ] = en_r2_05_2 ( n )

%*****************************************************************************80
%
%% EN_R2_05_2 implements the Stroud rule 5.2 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = 2 * N^2 + 1.
%
%    The rule has precision P = 5.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2010
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
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 2 * n * n + 1;
  volume = sqrt ( pi^n );

  a = 2 * volume / ( n + 2 );
  b = ( 4 - n ) * volume / 2 / ( n + 2 )^2;
  c = volume / ( n + 2 )^2;

  r = sqrt ( ( n + 2 ) / 2 );
  s = sqrt ( ( n + 2 ) / 4 );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  1 point.
%
  k = k + 1;
% x(1:n,k) = 0;
  w(k) = a;
%
%  2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(i,k) = - r;
    w(k) = b;
    k = k + 1;
    x(i,k) = + r;
    w(k) = b;
  end
%
%  4 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - s;
      x(j,k) = - s;
      w(k) = c;
      k = k + 1;
      x(i,k) = - s;
      x(j,k) = + s;
      w(k) = c;
      k = k + 1;
      x(i,k) = + s;
      x(j,k) = - s;
      w(k) = c;
      k = k + 1;
      x(i,k) = + s;
      x(j,k) = + s;
      w(k) = c;
    end
  end

  return
end
