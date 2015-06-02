function padua_test04 ( )

%*****************************************************************************80
%
%% PADUA_TEST04 tests PADUA_POINTS and PADUA_POINTS_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PADUA_TEST04\n' );
  fprintf ( 1, '  PADUA_POINTS computes the points of a Padua rule.\n' );
  fprintf ( 1, '  PADUA_POINTS_SET looks them up in a table.\n' );
 
  for l = 3 : 4
    n = padua_order ( l );
    xy1 = padua_points ( l );
    [ x2, y2 ] = padua_points_set ( l );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Level %d  Padua points\n', l );
    fprintf ( 1, '\n' );
    for j = 1 : n
      fprintf ( 1, '  %4d  %14.6g  %14.6g\n', j, xy1(1,j), xy1(2,j) );
      fprintf ( 1, '        %14.6g  %14.6g\n',    x2(j), y2(j) );
    end
  end

  return
end
