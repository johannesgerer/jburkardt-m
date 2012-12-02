function z = r8vec_convolution ( m, x, n, y )

%*****************************************************************************80
%
%% R8VEC_CONVOLUTION returns the convolution of two R8VEC's.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    The I-th entry of the convolution can be formed by summing the products
%    that lie along the I-th diagonal of the following table:
%
%    Y3 : 3   4   5   6   7
%    Y2 : 2   3   4   5   6
%    Y1 : 1   2   3   4   5
%       +------------------
%        X1  X2  X3  X4  X5
%
%    which will result in:
%
%    Z = ( X1 * Y1,
%          X1 * Y2 + X2 * Y1,
%          X1 * Y3 + X2 * Y2 + X3 * Y1,
%                    X2 * Y3 + X3 * Y2 + X4 * Y1,
%                              X3 * Y3 + X4 * Y2 + X5 * Y1,
%                                        X4 * Y3 + X5 * Y2,
%                                                  X5 * Y3 )
%
%  Example:
%
%    Input:
%
%      X = (/ 1, 2, 3, 4 /)
%      Y = (/ -1, 5, 3 /)
%
%    Output:
%
%      Z = (/ -1, 3, 10, 17, 29, 12 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the dimension of X.
%
%    Input, real X(M), the first vector to be convolved.
%
%    Input, integer N, the dimension of Y.
%
%    Input, real Y(N), the second vector to be convolved.
%
%    Output, real Z(M+N-1), the convolution of X and Y.
%
  z(1:m+n-1,1) = 0.0;

  for j = 1 : n
    z(j:j+m-1,1) = z(j:j+m-1,1) + x(1:m,1) * y(j,1);
  end

  return
end
