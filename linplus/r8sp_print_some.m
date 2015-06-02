function r8sp_print_some ( m, n, nz_num, row, col, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8SP_PRINT_SOME prints some of a R8SP matrix.
%
%  Discussion:
%
%    This version of R8SP_PRINT_SOME has been specifically modified to allow,
%    and correctly handle, the case in which a single matrix location
%    A(I,J) is referenced more than once by the sparse matrix structure.
%    In such cases, the routine prints out the sum of all the values.
%
%    The R8SP storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.
%
%    It is possible that a pair of indices (I,J) may occur more than
%    once.  Presumably, in this case, the intent is that the actual value
%    of A(I,J) is the sum of all such entries.  This is not a good thing
%    to do, but I seem to have come across this in MATLAB.
%
%    The R8SP format is used by CSPARSE ("sparse triplet"), DLAP/SLAP 
%    ("nonsymmetric SLAP triad"), by MATLAB, and by SPARSEKIT ("COO" format).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2006
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
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
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

      aij(1:inc) = 0.0;

      for k = 1 : nz_num

        if ( i == row(k) && j2lo <= col(k) && col(k) <= j2hi )

          j2 = col(k) - j2lo + 1;

          if ( a(k) ~= 0.0 )
            nonzero = 1;
            aij(j2) = aij(j2) + a(k);
          end

        end

      end

      if ( nonzero )
        fprintf ( 1, '%4d', i );
        for j = 1 : inc
          fprintf ( 1, '  %12g', aij(j) );
        end
        fprintf ( 1, '\n' );
      end

    end

  end

  return
end
