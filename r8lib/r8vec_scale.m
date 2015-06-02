function x = r8vec_scale ( s, n, x )

%*****************************************************************************80
%
%% R8VEC_SCALE multiplies an R8VEC by a scale factor.
%
%  Discussion:
%
%    An R8VEC is a vector of R8 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer S, the scale factor.
%
%    Input, integer N, the length of the vector.
%
%    Input/output, real X(N), the vector to be scaled.
%
  x(1:n) = s * x(1:n);

  return
end
