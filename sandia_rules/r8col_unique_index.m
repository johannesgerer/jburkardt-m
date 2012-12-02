function unique_index = r8col_unique_index ( m, n, a, tol )

%*****************************************************************************80
%
%% R8COL_UNIQUE_INDEX indexes the first occurrence of values in an R8COL.
%
%  Discussion:
%
%    An R8COL is an M by N array of R8 values.
%    It is regarded as an array of N columns of length M.
%
%    For element A(1:M,J) of the matrix, UNIQUE_INDEX(J) is the uniqueness index
%    of A(1:M,J).  That is, if A_UNIQUE contains the unique elements of A, 
%    gathered in order, then 
%
%      A_UNIQUE ( 1:M, UNIQUE_INDEX(J) ) = A(1:M,J)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 November 2008
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
%    Input, real A(M,N), the array.
%
%    Input, real TOL, a tolerance for equality.
%
%    Output, integer UNIQUE_INDEX(N), the unique index.
%
  unique_index(1:n) = -1;
  unique_num = 0;

  for j1 = 1 : n

    if ( unique_index(j1) == -1 )

      unique_num = unique_num + 1;
      unique_index(j1) = unique_num;

      for j2 = j1 + 1 : n
        if ( max ( abs ( a(1:m,j1) - a(1:m,j2) ) ) <= tol )
          unique_index(j2) = unique_num;
        end
      end

    end

  end

  return
end
