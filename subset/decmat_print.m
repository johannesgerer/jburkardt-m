function decmat_print ( m, n, a, b, title )

%*****************************************************************************80
%
%% DECMAT_PRINT prints out decimal vectors and matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, integer A(M,N), B(M,N), the decimal matrix.
%
%    Input, character TITLE(*), a label for the object being printed.
%
  ncolum = 80;
%
%  Figure out how wide we must make each column.
%
  imax = 0;
  jmax = 0;

  for i = 1 : m
    for j = 1 : n
      s = dec_to_s ( a(i,j), b(i,j) );
      lenc = s_len_trim ( s );
      jmax = max ( jmax, lenc );
    end
  end

  kmax = 2 + imax + 1 + jmax;
  npline = floor ( ncolum / kmax );
%
%  Set up the format for the heading.
%
  format_string = sprintf ( '%%%ds', kmax );

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for jmin = 1 : npline : n

    jmax = min ( jmin + npline - 1, n );

    fprintf ( 1, '\n' );

    if ( 1 < jmin | jmax < n )
      fprintf ( 1, '  Columns %d to %d\n', jmin, jmax );
      fprintf ( 1, '\n' );
    end

    for i = 1 : m

      for j = jmin : jmax
        s = dec_to_s ( a(i,j), b(i,j) );
        fprintf ( 1, format_string, s );
      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
