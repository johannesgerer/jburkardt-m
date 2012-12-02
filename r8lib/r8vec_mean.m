function mean = r8vec_mean ( n, x )

%*****************************************************************************80
%
%% R8VEC_MEAN returns the mean of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real X(N), the vector whose mean is desired.
%
%    Output, real MEAN, the mean, or average,
%    of the vector entries.
%
  mean = sum ( x(1:n) ) / n;

  return
end
