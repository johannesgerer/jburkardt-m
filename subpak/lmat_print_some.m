function lmat_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% LMAT_PRINT_SOME prints some of an LMAT.
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

  for j2lo = max ( jlo, 1 ) : incx : min ( jhi, n )

    j2hi = j2lo + incx - 1;
    j2hi = min ( j2hi, n );
    j2hi = min ( j2hi, jhi );

    inc = j2hi + 1 - j2lo;

    fprintf ( 1, '\n' );

    if ( 100 <= j2hi )
      fprintf ( 1, '      ' );
      for j = j2lo : j2hi
        fprintf ( 1, ' %1d', floor ( j / 100 ) );
      end
      fprintf ( 1, '\n' );
    end

    if ( 10 <= j2hi )
      fprintf ( 1, '      ' );
      for j = j2lo : j2hi
        fprintf ( 1, ' %1d', mod ( floor ( j / 10 ), 10 ) );
      end
      fprintf ( 1, '\n' );
    end

    fprintf ( 1, '  Col ' );
    for j = j2lo : j2hi
      fprintf ( 1, ' %1d', mod ( j, 10 ) );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  Row\n' );
    fprintf ( 1, '\n' );

    i2lo = max ( ilo, 1 );
    i2hi = min ( ihi, m );

    for i = i2lo : i2hi
      fprintf ( 1, '%5d:', i );
      for j = j2lo : j2hi
        fprintf ( 1, ' %1d', a(i,j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
