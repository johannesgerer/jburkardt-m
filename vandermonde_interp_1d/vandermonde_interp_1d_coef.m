function c = vandermonde_interp_1d_coef ( n, x, y )

%*****************************************************************************80
%
%% VANDERMONDE_INTERP_1D_COEF computes a 1D polynomial interpolant.
%
%  Discussion:
%
%    We assume the interpolant has the form
%
%      p(x) = c1 + c2 * x + c3 * x^2 + ... + cn * x^(n-1).
%
%    We have n data values (x(i),y(i)) which must be interpolated:
%
%      p(x(i)) = c1 + c2 * x(i) + c3 * x(i)^2 + ... + cn * x(i)^(n-1) = y(i)
%
%    This can be cast as an NxN linear system for the polynomial
%    coefficients:
%
%      [ 1 x1 x1^2 ... x1^(n-1) ] [  c1 ] = [  y1 ]
%      [ 1 x2 x2^2 ... x2^(n-1) ] [  c2 ] = [  y2 ]
%      [ ...................... ] [ ... ] = [ ... ]
%      [ 1 xn xn^2 ... xn^(n-1) ] [  cn ] = [  yn ]
%
%    and if the x values are distinct, the system is theoretically
%    invertible, so we can retrieve the coefficient vector c and
%    evaluate the interpolant.
%
%    The polynomial could be evaluated at the n-vector x by the command
%
%      pval = polyval ( c, x );
%
%    ...except that MATLAB assumes that c(1) multiplies x^(n-1).
%
%    so instead, you might use
%
%      pval = r8poly_value ( n - 1, c, n, x )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points.
%
%    Input, real X(N,1), Y(N,1), the data values.
%
%    Output, real C(N,1), the coefficients of the interpolating
%    polynomial.  C(1) is the constant term, and C(N) multiplies X^(N-1).
%
  A = vandermonde_interp_1d_matrix ( n, x );

  c = A \ y(:);

  return
end
