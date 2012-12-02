function [ o, x, w ] = en_r2_07_1 ( n, option )

%*****************************************************************************80
%
%% EN_R2_07_1 implements the Stroud rule 7.1 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = 2^N + 2 * N^2 + 1.
%
%    The rule has precision P = 7.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    There are two versions of the rule, chosen by setting the
%    OPTION variable to 1 or 2.  
%
%    Option 1 is only valid for N = 3, 4, 6 or 7.
%    Option 2 is only valid for N = 3 or 4.
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
%    N = 3, 4, 6 or 7.
%
%    Input, integer OPTION, chooses rule option 1 or 2.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( nargin < 2 )
    option = 1;
  end

  if ( option < 1 | 2 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_07_1 - Fatal error!\n' );
    fprintf ( 1, '  1 <= OPTION <= 2 required.\n' );
    error ( 'EN_R2_07_1 - Fatal error!' )
  end

  if ( option == 1 )
    if ( n ~= 3 & n ~= 4 & n ~= 6 & n ~= 7 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'EN_R2_07_1 - Fatal error!' );
      fprintf ( 1, '  OPTION 1 requires N =  3, 4, 6 or 7.\n' );
      error ( 'EN_R2_07_1 - Fatal error!' )
    end
  end

  if ( option == 2 )
    if ( n ~= 3 & n ~= 4 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'EN_R2_07_1 - Fatal error!' );
      fprintf ( 1, '  OPTION 2 requires N =  3 or 4.\n' );
      error ( 'EN_R2_07_1 - Fatal error!' )
    end
  end

  o = 2^n + 2 * n^2 + 1;
  volume = sqrt ( pi^n );

  if ( option == 1 )
    r = sqrt ( ( 3 * ( 8 - n ) - ( n - 2 ) * sqrt ( 3 * ( 8 - n ) ) ) / 2 / ( 5 - n ) );
    s = sqrt ( ( 3 *       n   -       2   * sqrt ( 3 * ( 8 - n ) ) ) / 2 / ( 3 * n - 8 ) );
    t = sqrt ( ( 6 + sqrt ( 3 * ( 8 - n ) ) ) / 2 );
  elseif ( option == 2 & n < 5 )
    r = sqrt ( ( 3 * ( 8 - n ) + ( n - 2 ) * sqrt ( 3 * ( 8 - n ) ) ) / 2 / ( 5 - n ) );
    s = sqrt ( ( 3 *       n   +       2   * sqrt ( 3 * ( 8 - n ) ) ) / 2 / ( 3 * n - 8 ) );
    t = sqrt ( ( 6 - sqrt ( 3 * ( 8 - n ) ) ) / 2 );
  end

  b = ( 8 - n ) * volume / 8 / r^6;
  c = volume / 2^(n+3) / s^6;
  d = volume / 16 / t^6;
  a = volume - 2 * n * b - 2^n * c - 2 * n * ( n - 1 ) * d;

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  1 point.
%
  k = k + 1;
% x(1:n,k) = 0.0;
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
%  2^N points.
%
  k = k + 1;
  x(1:n,k) = - s;
  w(k) = c;
  more = 1;
  while ( more )
    more = 0;
    for i = n : -1 : 1
      if ( x(i,k) < 0.0 )
        k = k + 1;
        x(1:n,k) = x(1:n,k-1);
        x(i,k)     =   abs ( x(i,k) );
        x(i+1:n,k) = - abs ( x(i+1:n,k) );
        w(k) = c;
        more = 1;
        break;
      end
    end
  end
%
%  2 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - t;
      x(j,k) = - t;
      w(k) = d;
      k = k + 1;
      x(i,k) = - t;
      x(j,k) = + t;
      w(k) = d;
      k = k + 1;
      x(i,k) = + t;
      x(j,k) = - t;
      w(k) = d;
      k = k + 1;
      x(i,k) = + t;
      x(j,k) = + t;
      w(k) = d;
    end
  end

  return
end
