function cc_print ( m, n, ncc, icc, ccc, acc, title )

%*****************************************************************************80
%
%% CC_PRINT prints a sparse matrix in CC format.
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
%    Input, integer M, the number of rows in the matrix.
%
%    Input, integer N, the number of columns in the matrix.
%
%    Input, integer NCC, the number of CC elements.
%
%    Input, integer ICC(NCC), the CC rows.
%
%    Input, integer CCC(N+1), the compressed CC columns.
%
%    Input, real ACC(NCC), the CC values.
%
%    Input, character ( len = * ) TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '     #     I     J       A\n' );
  fprintf ( 1, '  ----  ----  ----  --------------\n' );
  fprintf ( 1, '\n' );

  if ( ccc(1) == 0 )

    j = 0;
    for k = 1 : ncc
      i = icc(k);
      while ( ccc(j+2) <= k - 1 )
        j = j + 1;
      end
      fprintf ( 1, '  %4d  %4d  %4d  %16.8g\n', k - 1, i, j, acc(k) );
    end

  else

    j = 1;
    for k = 1 : ncc
      i = icc(k);
      while ( ccc(j+1) <= k )
        j = j + 1;
      end
      fprintf ( 1, '  %4d  %4d  %4d  %16.8g\n', k, i, j, acc(k) );
    end

  end

  return
end
