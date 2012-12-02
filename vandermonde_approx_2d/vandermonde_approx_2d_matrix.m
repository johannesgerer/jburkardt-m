function A = vandermonde_approx_2d_matrix ( n, m, tm, x, y )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_2D_MATRIX computes a Vandermonde 2D approximation matrix.
%
%  Discussion:
%
%    We assume the approximating function has the form of a polynomial
%    in X and Y of total degree M.
%
%      p(x,y) = c00 
%             + c10 * x                + c01 * y
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
%    Input, integer TM, the M+1st triangle number.
%
%    Input, real X(N,1), Y(N,1), the data locations.
%
%    Output, real A(N,T(M+1)), the Vandermonde matrix for X.
%
  A = zeros ( n, tm );
  j = 0;

  for s = 0 : m
    for ex = s : -1 : 0
      ey = s - ex;
      j = j + 1;
      A(1:n,j) = x(1:n) .^ ex .* y(1:n) .^ ey; 
    end
  end
 
  return
end
