function [ o, x, w ] = en_her_05_5 ( n )

%*****************************************************************************80
%
%% EN_HER_05_5 implements the Stroud rule 5.5 for region EN_HER.
%
%  Discussion:
%
%    The rule has order O = N * 2^N + 1.
%
%    The rule has precision P = 5.
%
%    EN_HER is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    There is a second version of this rule; however it results in
%    complex abscissas, and so it has been disabled.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2010
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
  o = n * 2^n + 1;
  volume = sqrt ( pi^n );

  a = 2 * volume / ( n + 2 );
  b =     volume / ( n + 2 ) / 2^n;

  option = 1;

  if ( option == 1 )
    r = sqrt ( ( n + 2 + ( n - 1 ) * sqrt ( 2 * ( n + 2 ) ) ) / 2 / n );
    s = sqrt ( ( n + 2 -             sqrt ( 2 * ( n + 2 ) ) ) / 2 / n );
  elseif ( option == 2 )
    r = sqrt ( ( n + 2 - ( n - 1 ) * sqrt ( 2 * ( n + 2 ) ) ) / 2 / n );
    s = sqrt ( ( n + 2 +             sqrt ( 2 * ( n + 2 ) ) ) / 2 / n );
  end

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
%  N * 2^N points:
%  N choices for location of R, 2^N choices of sign pattern.
%
  for i = 1 : n

    k = k + 1;
    x(1:n,k) = - s;
    x(i,k)   = - r;
    w(k) = b;

    more = 1;

    while ( more )
      more = 0;
      for j = n : -1 : 1
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

  return
end
