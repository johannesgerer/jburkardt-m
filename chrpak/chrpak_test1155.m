function chrpak_test1155 ( )

%*****************************************************************************80
%
%% TEST1155 tests S_REPLACE_CH_BY_S.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
  s_old = 'No pennies now.';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1155\n' );
  fprintf ( 1,'  S_REPLACE_CH_BY_S replaces one character by a string;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    C  S_REP  Original String  Modified String\n' );
  fprintf ( 1, '\n' );

  c = 'n';
  s_rep = '1\1';

  s_new = s_replace_ch_by_s ( s_old, c, s_rep );

  fprintf ( 1, '     %c   %s   %s  %s\n', c, s_rep, s_old, s_new );

  return
end
