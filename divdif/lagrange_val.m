function yv = lagrange_val ( n, x, y, xv )

%*****************************************************************************80
%
%% LAGRANGE_VAL applies a naive form of Lagrange interpolation.
%
%  Discussion:
%
%    Given N abscissas X, an arbitrary function Y(X) can be
%    interpolated by a polynomial P(X) of order N (and degree N-1)
%    using Lagrange basis polynomials of degree N-1.
%
%    Standard Lagrange interpolation can be rewritten into this form,
%    which is more economical than evaluating the individual Lagrange
%    basis polynomials.
%
%    If we define
%
%      L(I)(XV) = product ( 1 <= J <= N, J /= I )
%        ( XV - X(J) ) / ( X(I) - X(J) )
%
%    then
%
%      P(XV) = sum ( 1 <= I <= N ) Y( X(I) ) * L(I)(XV)
%
%    Applying this form of the interpolation rule directly involves
%    about N^2 work.  There are more efficient forms of the rule.
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
%  Parameters:
%
%    Input, integer N, the number of data points.
%
%    Input, real X(N), the abscissas.
%
%    Input, real Y(N), the function values at the abscissas.
%
%    Input, real XV, a point where an interpolated value is
%    needed.
%
%    Output, real YV, the interpolated function value.
%
  yv = 0.0;

  for i = 1 : n
    poly = 1.0;
    for j = 1 : n
      if ( j ~= i )
        poly = poly * ( xv - x(j) ) / ( x(i) - x(j) );
      end
    end
    yv = yv + y(i) * poly;
  end

  return
end
