function [ o, x, w ] = en_r2_05_6 ( n )

%*****************************************************************************80
%
%% EN_R2_05_6 implements the Stroud rule 5.6 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = ( N + 1 ) * 2^N.
%
%    The rule has precision P = 5.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    The rule requires 5 <= N.
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
%    5 <= N.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 5 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_05_6 - Fatal error!\n' );
    fprintf ( 1, '  5 <= N is required.\n' );
    error ( 'EN_R2_05_6 - Fatal error!' );
  end

  o = 2^n * ( n + 1 );
  volume = sqrt ( pi^n );

  a = volume / 2^n / ( n + 1 );

  r = sqrt ( ( n - sqrt ( 2 ) + ( n - 1 ) * sqrt ( 2 * ( n + 1 ) ) ) / 2 / n );
  s = sqrt ( ( n - sqrt ( 2 ) -             sqrt ( 2 * ( n + 1 ) ) ) / 2 / n );
  t = sqrt ( ( 1 + sqrt ( 2 ) ) / 2 );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  N * 2^N points.
%
  for i = 1 : n

    k = k + 1;
    x(1:n,k) = - s;
    x(i,k)   = - r;
    w(k) = a;

    more = 1;

    while ( more )
      more = 0;
      for j = n : -1 : 1
        if ( x(j,k) < 0.0 )
          k = k + 1;
          x(1:n,k) = x(1:n,k-1);
          x(j,k)     =   abs ( x(j,k) );
          x(j+1:n,k) = - abs ( x(j+1:n,k) );
          w(k) = a;
          more = 1;
          break;
        end
      end
    end

  end
%
%  2^N points.
%
  k = k + 1;
  x(1:n,k) = - t;
  w(k) = a;
  more = 1;
  while ( more )
    more = 0;
    for j = n : -1 : 1
      if ( x(j,k) < 0.0 )
        k = k + 1;
        x(1:n,k) = x(1:n,k-1);
        x(j,k)     =   abs ( x(j,k) );
        x(j+1:n,k) = - abs ( x(j+1:n,k) );
        w(k) = a;
        more = 1;
        break;
      end
    end
  end

  return
end
