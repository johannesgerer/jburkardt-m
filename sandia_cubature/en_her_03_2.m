function [ o, x, w ] = en_her_03_2 ( n )

%*****************************************************************************80
%
%% EN_HER_03_2 implements the Stroud rule 3.2 for region EN_HER.
%
%  Discussion:
%
%    The rule has order O = 2^N.
%
%    The rule has precision P = 3.
%
%    EN_HER is the entire N-dimensional space with weight function
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
  o = 2^n;
  volume = sqrt ( pi^n );

  a = volume / o;
  r = sqrt ( 1 / 2 );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  k = 0;
%
%  2^N points.
%
  k = k + 1;
  x(1:n,k) = - r;
  w(k) = a;
  more = 1;

  while ( more )
    more = 0;
    for i = n : -1 : 1
      if ( x(i,k) < 0.0 )
        k = k + 1;
        x(1:n,k) = x(1:n,k-1);
        x(i,k)     = + r;
        x(i+1:n,k) = - r;
        w(k) = a;
        more = 1;
        break;
      end
    end
  end

  return
end
