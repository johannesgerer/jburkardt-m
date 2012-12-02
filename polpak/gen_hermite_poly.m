function p = gen_hermite_poly ( n, x, mu )

%*****************************************************************************80
%
%% GEN_HERMITE_POLY evaluates the generalized Hermite polynomials at X.
%
%  Discussion:
%
%    The generalized Hermite polynomials are orthogonal under the weight
%    function:
%
%      w(x) = |x|^(2*MU) * exp ( - x^2 )
%
%    over the interval (-oo,+oo).
%
%    When MU = 0, the generalized Hermite polynomial reduces to the standard
%    Hermite polynomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Theodore Chihara,
%    An Introduction to Orthogonal Polynomials,
%    Gordon and Breach, 1978,
%    ISBN: 0677041500,
%    LC: QA404.5 C44.
%
%  Parameters:
%
%    Input, integer N, the highest order polynomial to compute.
%
%    Input, real X, the point at which the polynomials are
%    to be evaluated.
%
%    Input, real MU, the parameter.
%    - 1 / 2 < MU.
%
%    Output, real P(1:N+1), the values of the first N+1
%    polynomials at the point X.
%
  OFFSET = 1;

  if ( n < 0 )
    return
  end

  p(0+OFFSET) = 1.0;

  if ( n == 0 )
    return
  end

  p(1+OFFSET) = 2.0 * x;

  for i = 1 : n - 1

    if ( mod ( i, 2 ) == 0 )
      theta = 0.0;
    else
      theta = 2.0 * mu;
    end

    p(i+1+OFFSET) = 2.0 * x * p(i+OFFSET) - 2.0 * ( i + theta ) * p(i-1+OFFSET);

  end

  return
end
