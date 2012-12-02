function mm_comment_write ( output_unit, comment )

%*****************************************************************************80
%
%% MM_COMMENT_WRITE writes a comment to a Matrix Market file.
%
%  Discussion:
%
%    Comments may be written AFTER the header line and BEFORE the size line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OUTPUT_UNIT, the output unit identifier.
%
%    Input, character ( len = * ) COMMENT, the comment to be written.
%    This routine will prepend a "%  " comment marker to the string.
%
  if ( s_len_trim ( comment ) == 0 )
    fprintf ( output_unit, '%%\n' );
  else
    fprintf ( output_unit, '%%  %s\n', comment );
  end

  return
end
