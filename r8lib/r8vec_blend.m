function x = r8vec_blend ( n, t1, x1, t2, x2 )

%*****************************************************************************80
%
%% R8VEC_BLEND interpolates an R8VEC, given two vectors and weight factors.
%
%  Formula:
%
%    x(i) = t * x1(i) + (1-t) * x2(i)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in each  vector.
%
%    Input, real T1, the weight factor for vector 1.
%
%    Input, real X1(N), the first vector.
%
%    Input, real T2, the weight factor for vector 2.
%
%    Input, real X2(N), the second vector.
%
%    Output, real X(N), the interpolated or extrapolated value.
%
  x(1:n) = t1 * x1(1:n) + t2 * x2(1:n);

  return
end
