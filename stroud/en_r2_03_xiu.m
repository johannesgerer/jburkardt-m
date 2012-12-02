function [ o, x, w ] = en_r2_03_xiu ( n, o, x, w )

%*****************************************************************************80
%
%% EN_R2_03_XIU implements the Xiu precision 3 rule for region EN_R2.
%
%  Discussion:
%
%    The rule has order
%
%      O = 2 * N.
%
%    The rule has precision P = 3.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = product ( 1 <= i <= n ) ( exp ( - x(i)^2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2010
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
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  o = 2 * n;

  volume = sqrt ( pi ^ n );

  x = zeros ( n, o );
  w = zeros ( o, 1 );

  for j = 1 : o

    i = 0;
    for r = 1 : floor ( n / 2 )
      arg = ( 2 * r - 1 ) * j * pi / n;
      i = i + 1;
      x(i,j) = cos ( arg );
      i = i + 1;
      x(i,j) = sin ( arg );
    end

    if ( i < n )
      i = i + 1;
      x(i,j) = r8_mop ( j );
      if ( n == 1 )
        x(i,j) = x(i,j) / sqrt ( 2.0 );
      end
    end

  end

  w(1:o) = volume / o;

  return
end
