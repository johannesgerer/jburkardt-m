function a2 = r8vec_copy ( n, a1 )

%*****************************************************************************80
%
%% R8VEC_COPY copies an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, real A1(N), the vector to be copied.
%
%    Output, real A2(N), a copy of A1.
%
  a2(1:n) = a1(1:n);

  return
end
