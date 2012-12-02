function i4vec_print_some ( n, a, max_print, title )

%*****************************************************************************80
%
%% I4VEC_PRINT_SOME prints "some" of an integer vector.
%
%  Discussion:
%
%    The user specifies MAX_PRINT, the maximum number of lines to print.
%
%    If N, the size of the vector, is no more than MAX_PRINT, then
%    the entire vector is printed, one entry per line.
%
%    Otherwise, if possible, the first MAX_PRINT-2 entries are printed,
%    followed by a line of periods suggesting an omission,
%    and the last entry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, integer A(N), the vector to be printed.
%
%    Input, integer MAX_PRINT, the maximum number of lines to print.
%
%    Input, string TITLE, an optional title.
%
  if ( max_print <= 0 )
    return;
  end

  if ( n <= 0 )
    return;
  end

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
    fprintf ( 1, '\n' );
  end

  if ( n <= max_print )

    for i = 1 : n
      fprintf ( 1, '%6d  %10d\n', i, a(i) );
    end

  elseif ( 3 <= max_print )

    for i = 1 : max_print-2
      fprintf ( 1, '%6d  %10d\n', i, a(i) );
    end
    fprintf ( 1, '......  ..............\n' );
    i = n;
    fprintf ( 1, '%6d  %10d\n', i, a(i) );

  else

    for i = 1 : max_print-1
      fprintf ( 1, '%6d  %10d\n', i, a(i) );
    end
    i = max_print;
    fprintf ( 1, '(%6d  %10d  ...more entries...\n)', i, a(i) );

  end

  return
end
