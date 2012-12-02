function icol = i4col_find ( m, n, a, ivec )

%*****************************************************************************80
%
%% I4COL_FIND seeks a table column equal to an integer vector.
%
%  Example:
%
%    M = 3, N = 4,
%
%    A = (
%      1  2  3  4
%      5  6  7  8
%      9 10 11 12 )
%
%    IVEC = ( 3, 7, 11 )
%
%    ICOL = 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in
%    the table.  M is also the length of IVEC.
%
%    Input, integer A(M,N), an array of N columns of vectors
%    of length M.
%
%    Input, integer IVEC(M), a vector to be matched with the data
%    in the array.
%
%    Output, integer ICOL, the index of the first column of the table
%    which exactly matches every entry of IVEC, or -1 if no match
%    could be found.
%
  if ( m <= 0 )
    icol = -1;
    return
  end

  for j = 1 : n

    i = 1;

    while ( ivec(i) == a(i,j) )

      if ( i == m )
        icol = j;
        return
      end

      i = i + 1;

    end

  end

  icol = -1;

  return
end
