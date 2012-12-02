function ratmat_print ( m, n, a, b, title )

%*****************************************************************************80
%
%% RATMAT_PRINT prints out rational vectors or matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, integer A(M,N), B(M,N), the current rational or decimal
%    matrix.
%
%    Input, character TITLE(*), a label for the object being printed.
%
  ncolum = 80;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end
%
%  Figure out how many rationals we can get in NCOLUM columns.
%
  kmax = 3;

  for i = 1 : m
    for j = 1 : n

      itemp = abs ( a(i,j) );

      while ( 10^(kmax-2) <= itemp )
        kmax = kmax + 1;
      end

      itemp = abs ( b(i,j) );

      while ( 10^(kmax-2) < itemp )
        kmax = kmax + 1;
      end

    end
  end

  kmax = kmax + 1;
  string = sprintf ( '%%%dd', kmax );
  npline = floor ( ncolum / kmax );

  for jmin = 1 : npline : n

    jmax = min ( jmin + npline - 1, n );

    fprintf ( 1, '\n' );

    if ( 1 < jmin | jmax < n )
      fprintf ( 1, 'Columns %d to %d\n', jmin, jmax );
      fprintf ( 1, '\n' );
    end

    for i = 1 : m

      for j = jmin : jmax
        fprintf ( 1, string, a(i,j) );
      end

      for j = jmin : jmax
        fprintf ( 1, string, b(i,j) );
      end

      if ( jmax == n & i == m )

      else
        fprintf ( 1, '\n' );
      end

    end

  end

  return
end
