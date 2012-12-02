function [ o, x, w ] = cn_leg_03_xiu ( n )

%*****************************************************************************80
%
%% CN_LEG_03_XIU implements the Xiu precision 3 rule for region CN_LEG.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongbin Xiu,
%    Numerical integration formulas of degree two,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 1515-1520.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 2 * n;

  x = zeros ( n, o );
  w = zeros ( o, 1 );

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

    if ( i < n )
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * r8_mop ( j ) / sqrt ( 3.0 );
      if ( n == 1 )
        x(i,j) = x(i,j) / sqrt ( 2.0 );
      end
    end

  end

  w(1:o) = volume / o;

  return
end
