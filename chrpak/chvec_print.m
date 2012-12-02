function chvec_print ( n, a, title )

%*****************************************************************************80
%
%% CHVEC_PRINT prints a character vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, character A(N), the vector to be printed.
%
%    Input, string TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%w\n', title );
  end

  fprintf ( 1, '\n' );
  for ilo = 1 : 80 : n
    ihi = min ( ilo + 79, n );
    for i = ilo, ihi
      j = i + 1 - ilo;
      if ( ch_is_printable ( a(i) ) )
        fprintf ( 1, '%c', a(i) );
      else
        fprintf ( 1, ' ', a(i) );
      end
    end

    fprintf ( 1, '\n' );

  end

  return
end
