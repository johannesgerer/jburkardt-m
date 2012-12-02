function [ row, col, a ] = st_sort_a ( nrow, ncol, nnzero, row, col, a )

%*****************************************************************************80
%
%% ST_SORT_A sorts the entries of an ST matrix by column.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NROW, the number of rows in the matrix.
%
%    Input, integer NCOL, the number of columns in the matrix.
%
%    Input, integer NNZERO, the number of nonzeros in the matrix.
%
%    Input, integer ROW(NNZERO), COL(NNZERO), the row and column indices.
%
%    Input, real  A(NNZERO), the matrix entries.
%
%    Output, integer ( kind = 4 ) ROW(NNZERO), COL(NNZERO), the sorted indices.
%
%    Output, real A(NNZERO), the sorted entries.
%

%
%  Initialize.
%
  i = 0;
  indx = 0;
  isgn = 0;
  j = 0;
%
%  Call the external heap sorter.
%
  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( nnzero, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      rij    = row(i);
      row(i) = row(j);
      row(j) = rij;

      cij    = col(i);
      col(i) = col(j);
      col(j) = cij;

      aij  = a(i);
      a(i) = a(j);
      a(j) = aij;
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      if ( col(i) == col(j) )

        if ( row(i) < row(j) )
          isgn = - 1;
        elseif ( row(i) == row(j) )
          isgn = 0;
        elseif ( row(j) < row(i) )
          isgn = + 1;
        end

      elseif ( col(i) < col(j) )

        isgn = - 1;

      elseif ( col(j) < col(i) )

        isgn = + 1;

      end

    elseif ( indx == 0 )

      break

    end

  end

  return
end
