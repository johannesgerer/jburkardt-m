function [ o, x, w ] = cn_leg_05_2 ( n )

%*****************************************************************************80
%
%% CN_LEG_05_2 implements the Stroud rule CN:5-2 for region CN_LEG.
%
%  Discussion:
%
%    The rule has order
%
%      O = 2 N^2 + 1.
%
%    The rule has precision P = 5.
%
%    CN_LEG is the cube [-1,+1]^N with the Legendre weight function
%
%      w(x) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2010
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
%    N must be at least 2.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_LEG_05_2 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2.\n' );
    error ( 'CN_LEG_05_2 - Fatal error!' );
  end

  o = 2 * n^2 + 1;

  w = zeros ( o, 1 );
  x = zeros ( n, o );

  expon = 0;
  volume = c1_leg_monomial_integral ( expon );
  volume = volume ^ n;

  b0 = ( 25 * n * n - 115 * n + 162 ) * volume / 162.0;
  b1 = ( 70 - 25 * n ) * volume / 162.0;
  b2 = 25.0 * volume / 324.0;

  r = sqrt ( 3.0 / 5.0 );

  k = 0;

  k = k + 1;
  for i = 1 : n
    x(i,k) = 0.0;
  end
  w(k) = b0;

  for i1 = 1 : n

    k = k + 1;
    for i = 1 : n
      x(i,k) = 0.0;
    end
    x(i1,k) = + r;
    w(k) = b1;

    k = k + 1;
    for i = 1 : n
      x(i,k) = 0.0;
    end
    x(i1,k) = - r;
    w(k) = b1;

  end

  for i1 = 1 : n - 1
    for i2 = i1 + 1 : n

      k = k + 1;
      for i = 1 : n
        x(i,k) = 0.0;
      end
      x(i1,k) = + r;
      x(i2,k) = + r;
      w(k) = b2;

      k = k + 1;
      for i = 1 : n
        x(i,k) = 0.0;
      end
      x(i1,k) = + r;
      x(i2,k) = - r;
      w(k) = b2;

      k = k + 1;
      for i = 1 : n
        x(i,k) = 0.0;
      end
      x(i1,k) = - r;
      x(i2,k) = + r;
      w(k) = b2;

      k = k + 1;
      for i = 1 : n
        x(i,k) = 0.0;
      end
      x(i1,k) = - r;
      x(i2,k) = - r;
      w(k) = b2;

    end
  end

  return
end
