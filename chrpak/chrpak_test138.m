function chrpak_test138 ( )

%*****************************************************************************80
%
%% TEST138 tests S_WORD_EXTRACT_FIRST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2006
%
%  Author:
%
%    John Burkardt
%
  s = 'Just an incontrovertible sample of text!';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST138\n' );
  fprintf ( 1, '  S_WORD_EXTRACT_FIRST extracts the first word from a string.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Our input string is:\n' );
  fprintf ( 1, '  "%s"\n', s );
  fprintf ( 1, '\n' );

  while ( 1 )

    [ word, s ] = s_word_extract_first ( s );

    if ( s_len_trim ( word ) <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Reached the last word.\n' );
      break
    end

    fprintf ( 1, '  "%s"\n', word );

  end

  return
end



