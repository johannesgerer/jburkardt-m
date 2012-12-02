function z = r8vec_convolution_circ ( n, x, y )

%*****************************************************************************80
%
%% R8VEC_CONVOLUTION_CIRC: discrete circular convolution of two R8VEC's.
%
%  Formula:
%
%    z(1+m) = xCCy(m) = sum ( 0 <= k <= n-1 ) x(1+k) * y(1+m-k)
%
%    Here, if the index of Y becomes nonpositive, it is "wrapped around"
%    by having N added to it.
%
%  Discussion:
%
%    The circular convolution is equivalent to multiplication of Y by a
%    circulant matrix formed from the vector X.
%
%  Example:
%
%    Input:
%
%      X = (/ 1, 2, 3, 4 /)
%      Y = (/ 1, 2, 4, 8 /)
%
%    Output:
%
%      Circulant form:
%
%      Z = ( 1 4 3 2 )   ( 1 )
%          ( 2 1 4 3 )   ( 2 )
%          ( 3 2 1 4 ) * ( 4 )
%          ( 4 3 2 1 )   ( 8 )
%
%      The formula:
%
%      Z = (/ 1*1 + 2*8 + 3*4 + 4*2,
%             1*2 + 2*1 + 3*8 + 4*4,
%             1*4 + 2*2 + 3*1 + 4*8,
%             1*8 + 2*4 + 3*2 + 4*1 /)
%
%      Result:
%
%      Z = (/ 37, 44, 43, 26 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vectors.
%
%    Input, real X(N), Y(N), the vectors to be convolved.
%
%    Output, real Z(N), the circular convolution of X and Y.
%
  for m = 1 : n
    z(m) = x(1:m) * y(m:-1:1)' + x(m+1:n) * y(n:-1:m+1)';
  end

  return
end
