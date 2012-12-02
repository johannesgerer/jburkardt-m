function A = vandermonde_interp_2d_matrix ( n, m, x, y )

%*****************************************************************************80
%
%% VANDERMONDE_INTERP_2D_MATRIX computes a Vandermonde 2D interpolation matrix.
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
%    and we assume that N = T(M+1).
%
%    This can be cast as an NxN linear system for the polynomial
%    coefficients:
%
%      [ 1 x1 y1  x1^2 ... y1^m ] [ c00 ] = [  z1 ]
%      [ 1 x2 y2  x2^2 ... y2^m ] [ c10 ] = [  z2 ]
%      [ 1 x3 y3  x3^2 ... y3^m ] [ c01 ] = [  z3 ]
%      [ ...................... ] [ ... ] = [ ... ]
%      [ 1 xn yn  xn^2 ... yn^m ] [ c0n ] = [  zn ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points.  It is necessary that
%    N = T(M+1), where T(K) is the K-th triangular number.
%
%    Input, integer M, the degree of the polynomial.
%
%    Input, real X(N,1), Y(N,1), the data locations.
%
%    Output, real A(N,T(M+1)), the Vandermonde matrix for X.
%
  tmp1 = triangle_num ( m + 1 );

  if ( n ~= tmp1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VANDERMONDE_INTERP_2D_MATRIX - Fatal error!\n' );
    fprintf ( 1, '  For interpolation, we need N = T(M+1).\n' );
    fprintf ( 1, '  But we have N = %d\n', n );
    fprintf ( 1, '  M = %d\n', m )
    fprintf ( 1, '  and T(M+1) = %d\n', tmp1 );
    error ( 'VANDERMONDE_INTERP_2D_MATRIX - Fatal error!' );
  end

  A = zeros ( n, n );
  j = 0;

  for s = 0 : m
    for ex = s : -1 : 0
      ey = s - ex;
      j = j + 1;
      A(1:n,j) = x(1:n,1) .^ ex .* y(1:n,1) .^ ey; 
    end
  end
 
  return
end
