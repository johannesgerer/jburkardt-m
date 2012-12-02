function r8but_print_some ( n, mu, a, ilo, jlo, ihi, jhi,title )

%*****************************************************************************80
%
%% R8BUT_PRINT_SOME prints some of a R8BUT matrix.
%
%  Discussion:
%
%    The R8BUT storage format is used for a banded upper triangular matrix.
%    The matrix is assumed to be zero above the MU-th superdiagonal.
%    The matrix is stored in an MU+1 by N array.
%    Columns are preserved.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%  Example:
%
%    N = 5, MU = 2
%
%    A11 A12 A13   0   0
%      0 A22 A23 A24   0
%      0   0 A33 A34 A35
%      0   0   0 A44 A45
%      0   0   0   0 A55
%                --- ---
%                    ---
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
%
%    Input, integer MU, the upper bandwidth.
%
%    Input, real A(MU+1,N), the R8BUT matrix.
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
    i2lo = max ( i2lo, j2lo );
    i2hi = min ( ihi, n );
    i2hi = min ( i2hi, j2hi + mu );

    for i = i2lo : i2hi

      fprintf ( 1, '%4d  ', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        if ( i <= j & j <= i + mu )
          fprintf ( 1, '%12f  ', a(i-j+mu+1,j) );
        else
          fprintf ( 1, '              ' );
        end

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
