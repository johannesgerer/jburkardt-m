function [ o, x, w ] = en_r2_05_4 ( n )

%*****************************************************************************80
%
%% EN_R2_05_4 implements the Stroud rule 5.4 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = 2^(N+1) - 1.
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
  o = 2^(n+1) - 1;
  volume = sqrt ( pi^n );

  s = sqrt ( 1 / 2 );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  2^N + 2^(N-1) + 2^(N-2) + ... + 1 = 2^(N+1)-1 points.
%  but do the last point separately.
%
  for i = 1 : n

    r = sqrt ( ( i + 2 ) / 2 );
    b = 2^(i-n) * volume / ( i + 1 ) / ( i + 2 );

    k = k + 1;
    x(i,k) = - r;
    x(i+1:n,k) = - s;
    w(k) = b;
    more = 1;
    while ( more )
      more = 0;
      for j = n : -1 : i
        if ( x(j,k) < 0.0 )
          k = k + 1;
          x(1:n,k) = x(1:n,k-1);
          x(j,k)     =   abs ( x(j,k) );
          x(j+1:n,k) = - abs ( x(j+1:n,k) );
          w(k) = b;
          more = 1;
          break;
        end
      end
    end

  end 
%
%  Last point.
%
  k = k + 1;
% x(1:n,k) = 0.0;
  w(k) = 2 * volume / ( n + 2 );

  return
end
