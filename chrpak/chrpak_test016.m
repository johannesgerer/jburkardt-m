function chrpak_test016 ( )

%*****************************************************************************80
%
%% TEST016 tests CH_LOW.
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
  fprintf ( 1, 'TEST016\n' );
  fprintf ( 1, '  CH_LOW lowercases a character.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  C  CH_LOW(C)\n' );
  fprintf ( 1, '\n' );

  c = 'F';
  fprintf ( 1, '  %c      %c\n', c, ch_low ( c ) );
  c = 'f';
  fprintf ( 1, '  %c      %c\n', c, ch_low ( c ) );
  c = '1';
  fprintf ( 1, '  %c      %c\n', c, ch_low ( c ) );
  c = 'b';
  fprintf ( 1, '  %c      %c\n', c, ch_low ( c ) );
  c = '&';
  fprintf ( 1, '  %c      %c\n', c, ch_low ( c ) );

  return
end
