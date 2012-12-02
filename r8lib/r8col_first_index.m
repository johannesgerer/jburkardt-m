function first_index = r8col_first_index ( m, n, a, tol )

%*****************************************************************************80
%
%% R8COL_FIRST_INDEX indexes the first occurrence of values in an R8COL.
%
%  Discussion:
%
%    An R8COL is an M by N array of R8 values.
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
%    Output, integer FIRST_INDEX(N), the first occurrence index.
%
  first_index(1:n) = -1;

  for j1 = 1 : n

    if ( first_index(j1) == -1 )

      first_index(j1) = j1;

      for j2 = j1 + 1 : n
        if ( max ( abs ( a(1:m,j1) - a(1:m,j2) ) ) <= tol )
          first_index(j2) = j1;
        end
      end

    end

  end

  return
end
