function value = r8vec_distinct ( n, a )

%*****************************************************************************80
%
%% R8VEC_DISTINCT is true if the entries in an R8VEC are distinct.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A(N), the vector to be checked.
%
%    Output, logical VALUE is TRUE if the elements of A are distinct.
%
  for i = 2 : n
    for j = 1 : i - 1
      if ( a(i) == a(j) )
        value = 0;
        return
      end
    end
  end

  value = 1;

  return
end
