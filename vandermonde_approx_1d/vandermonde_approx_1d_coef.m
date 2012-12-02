function c = vandermonde_approx_1d_coef ( n, m, x, y )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_1D_COEF computes a 1D polynomial approximant.
%
%  Discussion:
%
%    We assume the approximating function has the form
%
%      p(x) = c1 + c2 * x + c3 * x^2 + ... + cm+1 * x^m.
%
%    We have n data values (x(i),y(i)) which must be approximated:
%
%      p(x(i)) = c1 + c2 * x(i) + c3 * x(i)^2 + ... + cm+1 * x(i)^m = y(i)
%
%    This can be cast as an Nx(M+1) linear system for the polynomial
%    coefficients:
%
%      [ 1 x1 x1^2 ... x1^m ] [  c1   ] = [  y1 ]
%      [ 1 x2 x2^2 ... x2^m ] [  c2   ] = [  y2 ]
%      [ .................. ] [ ...   ] = [ ... ]
%      [ 1 xn xn^2 ... xn^m ] [  cm+1 ] = [  yn ]
%
%    In the typical case, N is greater than M+1 (we have more data and equations
%    than degrees of freedom) and so a least squares solution is appropriate,
%    in which case the computed polynomial will be a least squares approximant
%    to the data.
%
%    The polynomial could be evaluated at the n-vector x by the command
%
%      pval = polyval ( c, x );
%
%    ...except that MATLAB assumes that c(1) multiplies x^m.
%
%    so instead, you might use
%
%      pval = poly_value ( m, c, n, x )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points.
%
%    Input, integer M, the degree of the polynomial.
%
%    Input, real X(N,1), Y(N,1), the data values.
%
%    Output, real C(M+1,1), the coefficients of the approximating
%    polynomial.  C(1) is the constant term, and C(M+1) multiplies X^M.
%
  A = vandermonde_approx_1d_matrix ( n, m, x );

  c = A \ y(:);

  return
end
