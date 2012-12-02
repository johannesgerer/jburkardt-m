function ytb_print ( n, a, title )

%*****************************************************************************80
%
%% YTB_PRINT prints a Young tableau.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer that is partitioned.
%
%    Input, integer A(N), describes the Young tableau.
%    A(I) is the row of the tableau on which I occurs.
%
%    Input, character ( len = * ) TITLE, an optional title.
%
  if ( s_len_trim ( title ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );

  row = 0;

  while ( 1 )

    row = row + 1;

    row_length = 0;

    for j = 1 : n

      if ( a(j) == row )
        row_length = row_length + 1;
        fprintf ( 1, '%4d  ', j );
      end

    end

    if ( row_length <= 0 )
      break;
    end

    fprintf ( 1, '\n' );

  end

  return
end
