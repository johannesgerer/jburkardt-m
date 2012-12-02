function polpak_test040 ( )

%*****************************************************************************80
%
%% TEST040 tests H_HOFSTADTER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST040\n' );
  fprintf ( 1, '  H_HOFSTADTER evaluates Hofstadter''s recursive\n' );
  fprintf ( 1, '  H function.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     N   H(N)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 30
    h = h_hofstadter ( i );
    fprintf ( 1, '  %4d  %4d\n', i, h );
  end

  return
end
