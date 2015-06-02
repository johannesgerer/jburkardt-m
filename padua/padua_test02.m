function padua_test02 ( )

%*****************************************************************************80
%
%% PADUA_TEST02 tests PADUA_POINTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PADUA_TEST02\n' );
  fprintf ( 1, '  PADUA_POINTS returns the points of a Padua rule.\n' );

  for l = 0 : 10
    n = padua_order ( l );
    xy = padua_points ( l );
    label = sprintf ( '  Level %d Padua points:', l );
    r8mat_transpose_print ( 2, n, xy, label );
  end

  return
end
