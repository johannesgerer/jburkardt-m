function a_cum = r8vec_cum ( n, a )

%*****************************************************************************80
%
%% R8VEC_CUM computes the cumulutive sums of an R8VEC.
%
%  Example:
%
%    Input:
%
%      A = (/ 1.0, 2.0, 3.0, 4.0 /)
%
%    Output:
%
%      A_CUM = (/ 1.0, 3.0, 6.0, 10.0 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), the vector to be summed.
%
%    Output, real A_CUM(N), the cumulative sums.
%
  a_cum(1) = a(1);

  for i = 2 : n
    a_cum(i+1) = a_cum(i) + a(i);
  end

  return
end
