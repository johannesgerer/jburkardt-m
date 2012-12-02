function amin = r8vec_amin ( n, a )

%*****************************************************************************80
%
%% R8VEC_AMIN returns the minimum absolute value in an R8VEC.
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
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), the array.
%
%    Output, real AMIN, the value of the entry
%    of smallest magnitude.
%
  amin = min ( abs ( a(1:n) ) );

  return
end
