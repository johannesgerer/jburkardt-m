function chrpak_test1015 ( )

%*****************************************************************************80
%
%% TEST1015 tests S_EQI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1015\n' );
  fprintf ( 1, '  S_EQI compares two strings for equality,\n' );
  fprintf ( 1, '  ignoring case and trailing blanks.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   A      B    S_EQI(A,B)\n' );
  fprintf ( 1, '               0 = FALSE, 1 = TRUE\n' );
  fprintf ( 1, '\n' );
 
  a = 'NixoN';
  b = 'niXon';
  fprintf ( 1, '  "%s"  "%s"  %d\n', a, b, s_eqi ( a, b ) );

  a = 'animal';
  b = 'CRACKER';
  fprintf ( 1, '  "%s"  "%s"  %d\n', a, b, s_eqi ( a, b ) );

  a = 'Yes';
  b = 'y';
  fprintf ( 1, '  "%s"  "%s"  %d\n', a, b, s_eqi ( a, b ) );

  a = 'ALPHA';
  b = 'zeta';
  fprintf ( 1, '  "%s"  "%s"  %d\n', a, b, s_eqi ( a, b ) );

  a = 'NIX on';
  b = 'Nixon';
  fprintf ( 1, '  "%s"  "%s"  %d\n', a, b, s_eqi ( a, b ) );

  a = 'blank';
  b = 'blank     ';
  fprintf ( 1, '  "%s"  "%s"  %d\n', a, b, s_eqi ( a, b ) );

  return
end
