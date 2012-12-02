function w = lagrange_rule ( n, x )

%*****************************************************************************80
%
%% LAGRANGE_RULE computes the weights of a Lagrange interpolation rule.
%
%  Discussion:
%
%    Given N abscissas X, an arbitrary function F(X) can be
%    interpolated by a polynomial P(X) of order N (and degree N-1)
%    using weights that depend only on X.
%
%    Standard Lagrange interpolation can be rewritten into this form,
%    which is more economical than evaluating the individual Lagrange
%    basis polynomials.
%
%    If we define
%
%      W(I) = 1 / product ( 1 <= J <= N, J /= I ) ( X(J) - X(I) )
%
%    then
%
%      P(XV) = sum ( 1 <= I <= N ) W(I) * F( X(I) ) / ( XV - X(I) )
%            / sum ( 1 <= I <= N ) W(I)             / ( XV - X(I) )
%
%    except when XV = X(J), for some J, when we set:
%
%      P(X(J)) = F(X(J))
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
%    Output, real W(N), the weights of the rule.
%
  w(1:n) = 1.0;

  for ( i = 1 : n )
    for ( j = 1 : i - 1 )
      w(j) = ( x(i) - x(j) ) * w(j);
    end
    w(i) = prod ( ( x(1:i-1) - x(i) ) );
  end

  w(1:n) = 1.0 ./ w(1:n);

  return
end
