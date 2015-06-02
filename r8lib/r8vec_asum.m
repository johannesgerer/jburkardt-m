function value = r8vec_asum ( n, a )

%*****************************************************************************80
%
%% R8VEC_ASUM sums the absolute values of the entries of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2015
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
%    Output, real VALUE, the sum of the absolute values of the entries.
%
  value = sum ( abs ( a(1:n) ) );

  return
end
