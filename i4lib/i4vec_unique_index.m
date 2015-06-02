function unique_index = i4vec_unique_index ( n, a )

%*****************************************************************************80
%
%% I4VEC_UNIQUE_INDEX indexes the first occurrence of values in an I4VEC.
%
%  Discussion:
%
%    For element A(I) of the vector, FIRST_UNIQUE(I) is the uniqueness index
%    of A(I).  That is, if A_UNIQUE contains the unique elements of A, 
%    gathered in order, then 
%
%      A_UNIQUE ( UNIQUE_INDEX(I) ) = A(I)
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
%    Output, integer UNIQUE_INDEX(N), the unique index.
%
  unique_index(1:n) = -1;
  unique_num = 0;

  for i = 1 : n

    if ( unique_index(i) == -1 )

      unique_num = unique_num + 1;
      unique_index(i) = unique_num;

      for j = i + 1 : n
        if ( a(i) == a(j) )
          unique_index(j) = unique_num;
        end
      end

    end

  end

  return
end
