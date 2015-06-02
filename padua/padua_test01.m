function padua_test01 ( )

%*****************************************************************************80
%
%% PADUA_TEST01 tests PADUA_ORDER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PADUA_TEST01\n' );
  fprintf ( 1, '  PADUA_ORDER converts the level L into the order N\n' );
  fprintf ( 1, '  of any Padua rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     L         N\n' );
  fprintf ( 1, '\n' );

  for l = 0 : 10
    n = padua_order ( l );
    fprintf ( 1, '  %4d  %8d\n', l, n );
  end

  return
end