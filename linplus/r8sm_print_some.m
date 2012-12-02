function r8sm_print_some ( m, n, a, u, v, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8SM_PRINT_SOME prints some of a R8SM matrix.
%
%  Discussion:
%
%    The R8SM storage format is used for an M by N Sherman Morrison matrix B,
%    which is defined by an M by N matrix A, an M vector U, and
%    an N vector V, by B = A - U * V'
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%
%    Input, real A(M,N), the R8SM matrix.
%
%    Input, real U(M), V(N), the R8SM vectors.
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
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi

      fprintf ( 1, '%4d  ', i );
%
%  Print out (up to) 5 entries in row I, that lie in the current strip.
%
      for j2 = 1 : inc

        j = j2lo - 1 + j2;

        aij = a(i,j) - u(i) * v(j);
        fprintf ( 1, '%12f  ', aij );

      end

      fprintf ( 1, '\n' );

    end

  end

  fprintf ( 1, '\n' );

  return
end
