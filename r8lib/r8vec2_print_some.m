function r8vec2_print_some ( n, x1, x2, max_print, title )

%*****************************************************************************80
%
%% R8VEC2_PRINT_SOME prints "some" of an R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is two R8VEC's.
%
%    An R8VEC is a vector of R8 values.
%
%    The user specifies MAX_PRINT, the maximum number of lines to print.
%
%    If N, the size of the vectors, is no more than MAX_PRINT, then
%    the entire vectors are printed, one entry of each per line.
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
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of the vectors.
%
%    Input, real X1(N), X2(N), the vector to be printed.
%
%    Input, integer MAX_PRINT, the maximum number of lines to print.
%
%    Input, string TITLE, a title.
%
  if ( max_print <= 0 )
    return
  end

  if ( n <= 0 )
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  if ( n <= max_print )

    for i = 1 : n
      fprintf ( 1, '%6d: %14g  %14g\n', i, x1(i), x2(i) );
    end

  elseif ( 3 <= max_print )

    for i = 1 : max_print-2
      fprintf ( 1, '%6d: %14g  %14g\n', i, x1(i), x2(i) );
    end
    fprintf ( 1, '......  ..............  ..............\n' );
    i = n;
    fprintf ( 1, '%6d: %14g  %14g\n', i, x1(i), x2(i) );

  else

    for i = 1 : max_print - 1
      fprintf ( 1, '%6d: %14g  %14g\n', i, x1(i), x2(i) );
    end
    i = max_print;
    fprintf ( 1, '%6d: %14g  %14g  ...more entries...\n', i, x1(i), x2(i) );

  end

  return
end
