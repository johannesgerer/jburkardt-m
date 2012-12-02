function first_index = i4col_first_index ( m, n, a )

%*****************************************************************************80
%
%% I4COL_FIRST_INDEX indexes the first occurrence of values in an I4COL.
%
%  Discussion:
%
%    An I4COL is an M by N array of I4 values.
%    It is regarded as an array of N columns of length M.
%
%    For element A(1:M,J) of the matrix, FIRST_INDEX(J) is the index in A of
%    the first column whose entries are equal to A(1:M,J).
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
%    Input, integer M, N, the number of rows and columns of A.
%    The length of an "element" of A, and the number of "elements".
%
%    Input, integer A(M,N), the array.
%
%    Output, integer FIRST_INDEX(N), the first occurrence index.
%
  first_index(1:n) = -1;

  for j1 = 1 : n

    if ( first_index(j1) == -1 )

      first_index(j1) = j1;

      for j2 = j1 + 1 : n
        if ( all ( a(1:m,j1) == a(1:m,j2) ) )
          first_index(j2) = j1;
        end
      end

    end

  end

  return
end
