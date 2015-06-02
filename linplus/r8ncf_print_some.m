function r8ncf_print_some ( m, n, nz_num, rowcol, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8NCF_PRINT_SOME prints some of a R8NCF matrix.
%
%  Discussion:
%
%    The R8NCF storage format stores NZ_NUM, the number of nonzeros, 
%    a real array containing the nonzero values, a 2 by NZ_NUM integer 
%    array storing the row and column of each nonzero entry.
%
%    The R8NCF format is used by NSPCG.  NSPCG requires that the information
%    for the diagonal entries of the matrix must come first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, integer NZ_NUM, the number of nonzero elements in the matrix.
%
%    Input, integer ROWCOL(2,NZ_NUM), the row and column indices
%    of the nonzero elements.
%
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, integer ILO, JLO, IHI, JHI, the first row and
%    column, and the last row and column to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  incx = 5;
%
%  Print the columns of the matrix, in strips of 5.
%
  for j2lo = jlo: incx: jhi

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col: ' );

    for j = j2lo : j2hi
      fprintf ( 1, '%7d       ', j );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '  ---\n' );
%
%  Determine the range of the rows in this strip.
%
    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      nonzero = 0;

      ctemp(1:inc) = 0.0;

      for k = 1 : nz_num

        if ( i == rowcol(1,k) & j2lo <= rowcol(2,k) & rowcol(2,k) <= j2hi )

          j2 = rowcol(2,k) - j2lo + 1;

          if ( a(k) ~= 0.0 )
            nonzero = 1;
            ctemp(j2) = a(k);
          end

        end

      end

      if ( nonzero )
        fprintf ( 1, '%4d  %12g  %12g  %12g  %12g  %12g\n', i, ctemp(1:inc) );
      end

    end

  end

  return
end
