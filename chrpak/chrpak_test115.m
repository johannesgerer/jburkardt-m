function chrpak_test115 ( )

%*****************************************************************************80
%
%% TEST115 tests S_REPLACE_CH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
  s_old = 'No pennies now.';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST115\n' );
  fprintf ( 1,'  S_REPLACE_CH replaces one character by another;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    C1  C2  Original String  Modified String\n' );
  fprintf ( 1, '\n' );

  c1 = 'n';
  c2 = 't';

  s = s_replace_ch ( s_old, c1, c2 );

  fprintf ( 1, '     %c   %c   %s  %s\n', c1, c2, s_old, s );

  return
end
