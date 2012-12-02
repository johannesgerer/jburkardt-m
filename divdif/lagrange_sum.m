function yv = lagrange_sum ( n, x, w, y, xv )

%*****************************************************************************80
%
%% LAGRANGE_SUM carries out a Lagrange interpolation rule.
%
%  Discussion:
%
%    It is assumed that LAGRANGE_RULE has already been called to compute
%    the appropriate weights for the given set of abscissas.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jean-Paul Berrut, Lloyd Trefethen,
%    Barycentric Lagrange Interpolation,
%    SIAM Review,
%    Volume 46, Number 3, September 2004, pages 501-517.
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Input, real X(N), the abscissas of the rule.
%
%    Input, real W(N), the weights of the rule.
%
%    Input, real Y(N), the function values at the abscissas.
%
%    Input, real XV, a point where an interpolated value is
%    needed.
%
%    Output, real YV, the interpolated function value.
%
  for i = 1 : n

    if ( xv == x(i) )
      yv = y(i);
      return
    end

  end

  top = 0.0;
  bot = 0.0;

  for i = 1 : n
    top = top + w(i) * y(i) / ( xv - x(i) );
    bot = bot + w(i)        / ( xv - x(i) );
  end

  yv = top / bot;

  return
end
