function [ o, x, w ] = cn_leg_03_1 ( n )

%*****************************************************************************80
%
%% CN_LEG_03_1 implements the Stroud rule CN:3-1 for region CN_LEG.
%
%  Discussion:
%
%    The rule has order
%
%      O = 2 * N.
%
%    The rule has precision P = 3.
%
%    CN_LEG is the cube [-1,+1]^N with the Legendre weight function
%
%      w(x) = 1.
%
%    The necessary treatment of the final coordinate of points when
%    N is odd seems to vary from what Stroud declares%
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
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 2 * n;

  w = zeros ( o, 1 );
  x = zeros ( n, o );

  expon = 0;
  volume = c1_leg_monomial_integral ( expon );
  volume = volume ^ n;

  for j = 1 : o

    i = 0;

    for r = 1 : floor ( n / 2 )
      arg = ( 2 * r - 1 ) * j * pi / n;
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * cos ( arg ) / sqrt ( 3.0 );
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * sin ( arg ) / sqrt ( 3.0 );
    end
%
%  The following code does not correspond to what Stroud declares.
%
    if ( i < n )

      i = i + 1;
      if ( n == 1 )
        x(i,j) =                r8_mop ( j ) / sqrt ( 3.0 );
      else
        x(i,j) = sqrt ( 2.0 ) * r8_mop ( j ) / sqrt ( 3.0 );
      end
    end

  end

  w(1:o) = volume / o;

  return
end
