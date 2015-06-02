function [ ist, jst, ast ] = st_sort_a ( m, n, nst, ist, jst, ast )

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
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, integer NST, the number of nonzeros.
%
%    Input/output, integer IST(NST), JST(NST), the row and column indices.
%
%    Input/output, real AST(NST), the nonzero matrix values.
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

    [ indx, i, j ] = sort_heap_external ( nst, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      rij    = ist(i);
      ist(i) = ist(j);
      ist(j) = rij;

      cij    = jst(i);
      jst(i) = jst(j);
      jst(j) = cij;

      aij    = ast(i);
      ast(i) = ast(j);
      ast(j) = aij;
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      if ( jst(i) == jst(j) )

        if ( ist(i) < ist(j) )
          isgn = - 1;
        elseif ( ist(i) == ist(j) )
          isgn = 0;
        elseif ( ist(j) < ist(i) )
          isgn = + 1;
        end

      elseif ( jst(i) < jst(j) )

        isgn = - 1;

      elseif ( jst(j) < jst(i) )

        isgn = + 1;

      end

    elseif ( indx == 0 )

      break

    end

  end

  return
end
