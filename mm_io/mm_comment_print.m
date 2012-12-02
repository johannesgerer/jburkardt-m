function mm_comment_print ( comment )

%*****************************************************************************80
%
%% MM_COMMENT_PRINT prints a comment from a Matrix Market file.
%
%  Discussion:
%
%    Comment lines begin with a '%' character.
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
%    Input, character ( len = * ) COMMENT, the comment.
%
  fprintf ( 1, '%s\n', comment );

  return
end
