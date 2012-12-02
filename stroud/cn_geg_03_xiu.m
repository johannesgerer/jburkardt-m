function [ o, x, w ] = cn_geg_03_xiu ( n, alpha )

%*****************************************************************************80
%
%% CN_GEG_03_XIU implements the Xiu precision 3 rule for region CN_GEG.
%
%  Discussion:
%
%    The rule has order
%
%      O = 2 * N.
%
%    The rule has precision P = 3.
%
%    CN_GEG is the cube [-1,+1]^N with the Gegenbauer weight function
%
%      w(alpha;x) = product ( 1 <= i <= n ) (1-x(i)^2)^alpha.
%
%    with -1.0 < alpha.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2010
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
%    Input, real ALPHA, the parameter.
%    -1.0 < ALPHA.
%
%    Input, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( alpha <= -1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_GEG_03_XIU - Fatal error!\n' );
    fprintf ( 1, '  ALPHA <= -1.0\n' );
    error ( 'CN_GEG_03_XIU - Fatal error!' );
  end

  o = 2 * n;
  x = zeros ( n, o );
  w = zeros ( o, 1 );

  expon = 0;
  volume = c1_geg_monomial_integral ( alpha, expon );
  volume = volume ^ n;

  for j = 1 : o

    i = 0;
    for r = 1 : floor ( n / 2 )
      arg = ( 2 * r - 1 ) * j * pi / n;
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * cos ( arg ) / sqrt ( 2.0 * alpha + 3.0 );
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * sin ( arg ) / sqrt ( 2.0 * alpha + 3.0 );
    end

    if ( i < n )
      i = i + 1;
      x(i,j) = sqrt ( 2.0 ) * r8_mop ( j ) / sqrt ( 2.0 * alpha + 3.0 );
      if ( n == 1 )
        x(i,j) = x(i,j) / sqrt ( 2.0 );
      end
    end

  end

  w(1:o) = volume / o;

  return
end
