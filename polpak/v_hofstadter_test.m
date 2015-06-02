function v_hofstadter_test ( )

%*****************************************************************************80
%
%% V_HOFSTADTER_TEST tests V_HOFSTADTER.
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
  fprintf ( 1, 'V_HOFSTADTER_TEST\n' );
  fprintf ( 1, '  V_HOFSTADTER evaluates Hofstadter''s recursive\n' );
  fprintf ( 1, '  V function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N   V(N)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 30
    v = v_hofstadter ( i );
    fprintf ( 1, '  %6d  %6d\n', i, v );
  end

  return
end
