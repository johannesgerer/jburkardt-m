function r8ss_print_some ( n, na, diag, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8SS_PRINT_SOME prints some of a R8SS matrix.
%
%  Discussion:
%
%    The R8SS storage format is used for real symmetric skyline matrices.
%    This storage is appropriate when the nonzero entries of the
%    matrix are generally close to the diagonal, but the number
%    of nonzeroes above each diagonal varies in an irregular fashion.
%
%    In this case, the strategy is essentially to assign column J
%    its own bandwidth, and store the strips of nonzeros one after
%    another.   Note that what's important is the location of the
%    furthest nonzero from the diagonal.  A slot will be set up for
%    every entry between that and the diagonal, whether or not
%    those entries are zero.
%
%    A skyline matrix can be Gauss-eliminated without disrupting
%    the storage scheme, as long as no pivoting is required.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer NA, the dimension of the array A.
%
%    Input, integer DIAG(N), the indices in A of the N diagonal elements.
%
%    Input, real A(NA), the R8SS matrix.
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
  for j2lo = jlo : incx : jhi

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
    i2hi = min ( ihi, n );

    for i = i2lo : i2hi

      fprintf ( 1, '%4d  ', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        aij = 0.0E+00;

        if ( j < i )
          if ( i == 1 )
            ijm1 = 0;
          else
            ijm1 = diag(i-1);
          end
          ij = diag(i);
          if ( ijm1 < ij+j-i )
            aij = a(ij+j-i);
          end
        elseif ( j == i )
          ij = diag(j);
          aij = a(ij);
        elseif ( i < j )
          if ( j == 1 )
            ijm1 = 0;
          else
            ijm1 = diag(j-1);
          end
          ij = diag(j);
          if ( ijm1 < ij+i-j )
            aij = a(ij+i-j);
          end
        end

        fprintf ( 1, '%12g  ', aij );

      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
