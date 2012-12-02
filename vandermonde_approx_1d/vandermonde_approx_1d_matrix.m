function A = vandermonde_approx_1d_matrix ( n, m, x )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_1D_MATRIX computes a Vandermonde 1D approximation matrix.
%
%  Discussion:
%
%    We assume the approximant has the form
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
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
%    Input, real X(N,1), the data values.
%
%    Output, real A(N,M+1), the Vandermonde matrix for X.
%
  A = ( x(1:n,1) * ones(1,m+1) ) .^ ( ones(n,1) * (0:m) );

  return
end
