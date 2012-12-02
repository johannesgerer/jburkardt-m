function amax = r8vec_amax ( n, a )

%*****************************************************************************80
%
%% R8VEC_AMAX returns the maximum absolute value in an R8VEC.
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
%    Output, real AMAX, the value of the entry
%    of largest magnitude.
%
  amax = max ( abs ( a(1:n) ) );

  return
end
