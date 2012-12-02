function lmat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% LMAT_TRANSPOSE_PRINT_SOME prints some of an LMAT, transposed.
%
%  Discussion:
%
%    An LMAT is an array of L values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, logical A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, a title.
%
  incx = 35;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;

    fprintf ( 1, '\n' );

    if ( 100 <= i2hi )
      fprintf ( 1, '      ' );
      for i = i2lo : i2hi
        fprintf ( 1, ' %1d', floor ( i / 100 ) );
      end
      fprintf ( 1, '\n' );
    end

    if ( 10 <= i2hi )
      fprintf ( 1, '      ' );
      for i = i2lo : i2hi
        fprintf ( 1, ' %1d', mod ( floor ( i / 10 ), 10 ) );
      end
      fprintf ( 1, '\n' );
    end

    fprintf ( 1, '  Row ' );
    for i = i2lo : i2hi
      fprintf ( 1, ' %1d', mod ( i, 10 ) );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  Col\n' );
    fprintf ( 1, '\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi
      fprintf ( 1, '%5d:', j );
      for i = i2lo : i2hi
        fprintf ( 1, ' %1d', a(i,j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
