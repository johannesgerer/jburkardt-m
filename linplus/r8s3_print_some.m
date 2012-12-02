function r8s3_print_some ( m, n, nz_num, isym, row, col, a, ilo, jlo, ...
  ihi, jhi, title )

%*****************************************************************************80
%
%% R8S3_PRINT_SOME prints some of a R8S3 matrix.
%
%  Discussion:
%
%    The R8S3 storage format corresponds to the SLAP Triad format.
%
%    The R8S3 storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.  The entries may be given in any order.  No
%    check is made for the erroneous case in which a given matrix entry is
%    specified more than once.
%
%    There is a symmetry option for square matrices.  If the symmetric storage
%    option is used, the format specifies that only nonzeroes on the diagonal
%    and lower triangle are stored.  However, this routine makes no attempt
%    to enforce this.  The only thing it does is to "reflect" any nonzero
%    offdiagonal value.  Moreover, no check is made for the erroneous case
%    in which both A(I,J) and A(J,I) are specified, but with different values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2006
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
%    Input, integer ISYM, is 0 if the matrix is not symmetric, and 1
%    if the matrix is symmetric.  The symmetric case only makes sense
%    if the matrix is also square, that is, M = N.  In this case, only
%    the nonzeroes on the diagonal and in the lower triangle are stored.
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
  incx = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title ) ;
%
%  Print the columns of the matrix, in strips of 5.
%
  for j2lo = jlo : incx : jhi

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col:  ' );
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

        if ( i == row(k) & j2lo <= col(k) & col(k) <= j2hi )

          j2 = col(k) - j2lo + 1;
          aij(j2) = a(k);

          if ( aij(j2) ~= 0.0 )
            nonzero = 1;
          end

        elseif ( isym == 1 & m == n & ...
          i == col(k) & j2lo <= row(k) & row(k) <= j2hi )

          j2 = row(k) - j2lo + 1;
          aij(j2) = a(k);

          if ( aij(j2) ~= 0.0 )
            nonzero = 1;
          end

        end

      end

      if ( nonzero )
        fprintf ( 1, '%5d ', i );
        for j2 = 1 : inc
          fprintf ( 1, '%14f', aij(j2) );
        end
        fprintf ( 1, '\n' );
      end

    end

  end

  fprintf ( 1, '\n' );

  return
end
