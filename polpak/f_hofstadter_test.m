function f_hofstadter_test ( )

%*****************************************************************************80
%
%% F_HOFSTADTER_TEST tests F_HOFSTADTER.
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
  fprintf ( 1, 'F_HOFSTADTER_TEST' );
  fprintf ( 1, '  F_HOFSTADTER evaluates Hofstadter''s recursive\n' );
  fprintf ( 1, '  F function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N   F(N)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 30
    f = f_hofstadter ( i );
    fprintf ( 1, '  %6d  %6d\n', i, f );
  end

  return
end
