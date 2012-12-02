function [ o, x, w ] = en_r2_03_1 ( n )

%*****************************************************************************80
%
%% EN_R2_03_1 implements the Stroud rule 3.1 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = 2 * N.
%
%    The rule has precision P = 3.
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
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 2 * n;
  volume = sqrt ( pi^n );

  a = volume / o;
  r = sqrt ( n / 2 );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(i,k) = - r;
    w(k) = a;
    k = k + 1;
    x(i,k) = + r;
    w(k) = a;
  end

  return
end
