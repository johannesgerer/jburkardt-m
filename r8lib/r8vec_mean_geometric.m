function mean = r8vec_mean_geometric ( n, x )

%*****************************************************************************80
%
%% R8VEC_MEAN_GEOMETRIC returns the geometric mean of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2014
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
%    Output, real MEAN, the geometric mean of the vector entries.
%
  mean = exp ( sum ( log ( x(1:n) ) ) / n );

  return
end
