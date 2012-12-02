function a = r8vec_nint ( n, a )

%*****************************************************************************80
%
%% R8VEC_NINT rounds entries of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), the vector to be rounded.
%
%    Output, real A(N), the rounded vector.
%
  a(1:n) = round ( a(1:n) );

  return
end
