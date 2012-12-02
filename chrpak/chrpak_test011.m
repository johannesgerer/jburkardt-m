function chrpak_test011 ( )

%*****************************************************************************80
%
%% TEST011 tests CH_CAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST011\n' );
  fprintf ( 1, '  CH_CAP uppercases a character.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  C  CH_CAP(C)\n' );
  fprintf ( 1, '\n' );

  c = 'F';
  fprintf ( 1, '  %c      %c\n', c, ch_cap ( c ) );
  c = 'f';
  fprintf ( 1, '  %c      %c\n', c, ch_cap ( c ) );
  c = '1';
  fprintf ( 1, '  %c      %c\n', c, ch_cap ( c ) );
  c = 'b';
  fprintf ( 1, '  %c      %c\n', c, ch_cap ( c ) );
  c = '&';
  fprintf ( 1, '  %c      %c\n', c, ch_cap ( c ) );

  return
end
