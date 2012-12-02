function c = vandermonde_approx_2d_coef ( n, m, x, y, z )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_2D_COEF computes a 2D polynomial approximant.
%
%  Discussion:
%
%    We assume the approximating function has the form of a polynomial
%    in X and Y of total degree M.
%
%      p(x,y) = c00 
%             + c10 * x                + c01 *  y
%             + c20 * x^2   + c11 * xy + c02 * y^2
%             + ...
%             + cm0 * x^(m) + ...      + c0m * y^m.
%
%    If we let T(K) = the K-th triangular number 
%            = sum ( 1 <= I <= K ) I
%    then the number of coefficients in the above polynomial is T(M+1).
%
%    We have n data locations (x(i),y(i)) and values z(i) to approximate:
%
%      p(x(i),y(i)) = z(i)
%
%    This can be cast as an NxT(M+1) linear system for the polynomial
%    coefficients:
%
%      [ 1 x1 y1  x1^2 ... y1^m ] [ c00 ] = [  z1 ]
%      [ 1 x2 y2  x2^2 ... y2^m ] [ c10 ] = [  z2 ]
%      [ 1 x3 y3  x3^2 ... y3^m ] [ c01 ] = [  z3 ]
%      [ ...................... ] [ ... ] = [ ... ]
%      [ 1 xn yn  xn^2 ... yn^m ] [ c0m ] = [  zn ]
%
%    In the typical case, N is greater than T(M+1) (we have more data and 
%    equations than degrees of freedom) and so a least squares solution is 
%    appropriate, in which case the computed polynomial will be a least squares
%    approximant to the data.
%
%    The polynomial defined by the T(M+1) coefficients C could be evaluated 
%    at the Nx2-vector x by the command
%
%      pval = r8poly_value_2d ( m, c, n, x )
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
%    Input, integer M, the maximum degree of the polynomial.
%
%    Input, real X(N,1), Y(N,1), the data locations.
%
%    Input, real Z(N,1), the data values.
%
%    Output, real C(T(M+1),1), the coefficients of the approximating
%    polynomial.  C(1) is the constant term, and C(T(M+1)) multiplies Y^M.
%
  tm = triangle_num ( m + 1 );

  A = vandermonde_approx_2d_matrix ( n, m, tm, x, y );

  c = A \ z(:);

  return
end
