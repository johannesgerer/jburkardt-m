function a = c8vec_nint ( n, a )

%*****************************************************************************80
%
%% C8VEC_NINT rounds the entries of a C8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, complex A(N), the vector to be rounded.
%
%    Output, complex A(N), the rounded vector.
%
  a(1:n) = round ( a(1:n) );

  return
end
