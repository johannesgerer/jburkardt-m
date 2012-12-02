function a_cum = i4vec_cum0 ( n, a )

%*****************************************************************************80
%
%% I4VEC_CUM0 computes the cumulutive sum of the entries of an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%    This routine returns a vector of length N+1, with the first value
%    being 0.
%
%  Example:
%
%    Input:
%
%      A = (/ 1, 2, 3, 4 /)
%
%    Output:
%
%      A_CUM = (/ 0, 1, 3, 6, 10 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be summed.
%
%    Output, integer A_CUM(1:N+1), the cumulative sum of the entries of A.
%
  a_cum(1) = 0;

  for i = 1 : n
    a_cum(i+1) = a_cum(i) + a(i);
  end

  return
end
