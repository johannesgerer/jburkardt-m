function value = i4vec_index ( n, a, aval )

%*****************************************************************************80
%
%% I4VEC_INDEX returns the location of the first occurrence of a given value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be searched.
%
%    Input, integer AVAL, the value to be indexed.
%
%    Output, integer VALUE, the first location in A which has the
%    value AVAL, or -1 if no such index exists.
%
  for i = 1 : n
    if ( a(i) == aval )
      value = i;
      return
    end
  end

  value = -1;

  return
end
