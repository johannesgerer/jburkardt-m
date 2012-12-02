function chrpak_test102 ( )

%*****************************************************************************80
%
%% TEST102 tests S_ESCAPE_TEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST102\n' );
  fprintf ( 1, '  S_ESCAPE_TEX "protects" characters in a string\n' );
  fprintf ( 1, '  that might otherwise be interpreted as TeX\n' );
  fprintf ( 1, '  escape characters.\n' );

  s1 = 'The file A_B.TXT is {I think__so} of size 2^8 or C\B.';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original string:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "%s".\n', s1 );

  s2 = s_escape_tex ( s1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  De-escaped string:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  "%s".\n', s2 );

  return
end
