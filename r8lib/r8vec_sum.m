function value = r8vec_sum ( n, a )

%*****************************************************************************80
%
%% R8VEC_SUM returns the sum of the entries of an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
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
%    Output, real VALUE, the sum of the entries.
%
  value = sum ( a(1:n) );

  return
end
