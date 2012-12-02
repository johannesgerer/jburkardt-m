function first_index = i4vec_first_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_FIRST_INDEX indexes the first occurrence of values in an I4VEC.
%
%  Discussion:
%
%    For element A(I) of the vector, FIRST_INDEX(I) is the index in A of
%    the first occurrence of the value A(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 August 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, integer A(N), the array.
%
%    Output, integer FIRST_INDEX(N), the first occurrence index.
%
  first_index(1:n) = -1;

  for i = 1 : n

    if ( first_index(i) == -1 )

      first_index(i) = i;

      for j = i + 1 : n
        if ( a(i) == a(j) )
          first_index(j) = i;
        end
      end

    end

  end

  return
end
