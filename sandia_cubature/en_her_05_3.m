function [ o, x, w ] = en_her_05_3 ( n )

%*****************************************************************************80
%
%% EN_HER_05_3 implements the Stroud rule 5.3 for region EN_HER.
%
%  Discussion:
%
%    The rule has order O = 2^N + 2 * N.
%
%    The rule has precision P = 5.
%
%    EN_HER is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    The rule requires 3 <= N.
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
    fprintf ( 1, 'EN_HER_05_3 - Fatal error!\n' );
    fprintf ( 1, '  3 <= N is required.\n' );
    error ( 'EN_HER_05_3 - Fatal error!' )
  end

  o = 2^n + 2 * n;
  volume = sqrt ( pi^n );

  a = 4 * volume / ( n + 2 )^2;
  b = ( n - 2 )^2 * volume / 2^n / ( n + 2 )^2;
  r = sqrt ( ( n + 2 ) / 4 );
  s = sqrt ( ( n + 2 ) / 2 / ( n - 2 ) );

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
%
%  2^N points.
%
  k = k + 1;
  x(1:n,k) = - s;
  w(k) = b;
  more = 1;
  while ( more )
    more = 0;
    for i = n : -1 : 1
      if ( x(i,k) < 0.0 )
        k = k + 1;
        x(1:n,k) = x(1:n,k-1);
        x(i,k)     = + s;
        x(i+1:n,k) = - s;
        w(k) = b;
        more = 1;
        break;
      end
    end
  end

  return
end
