function v = pn_polynomial_value ( m, n, x )

%*****************************************************************************80
%
%% PN_POLYNOMIAL_VALUE evaluates the normalized Legendre polynomials Pn(n,x).
%
%  Discussion:
%
%    The normalized Legendre polynomials are orthonormal under the inner product 
%    defined as integration from -1 to 1:
%
%      Integral ( -1 <= x <= +1 ) Pn(i,x) * Pn(j,x) dx = delta(i,j)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer M, the number of evaluation points.
%
%    Input, integer N, the highest order polynomial to evaluate.
%    Note that polynomials 0 through N will be evaluated.
%
%    Input, real X(M,1), the evaluation points.
%
%    Output, real V(M,1:N+1), the values of the Legendre polynomials 
%    of order 0 through N,
%
  v = p_polynomial_value ( m, n, x );

  for j = 0 : n
    norm = sqrt ( 2.0 / ( 2 * j + 1 ) );
    v(1:m,j+1) = v(1:m,j+1) / norm;
  end
 
  return
end
