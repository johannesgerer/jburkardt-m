function geometry_test035 ( )

%*****************************************************************************80
%
%% TEST035 tests LINE_IMP_POINT_DIST_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 3;

  atest = [ 2.0, 2.0, 2.0 ];
  btest = [ 5.0, 5.0, 5.0 ];
  ctest = [ 3.0, 3.0, 3.0 ];
  ptest = [ ...
    0.0, 6.0; ...
    0.0, 5.0; ...
    0.0, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST035\n' );
  fprintf ( 1, '  LINE_IMP_POINT_DIST_2D finds the distance from\n' );
  fprintf ( 1, '    a point X Y to a line A * X + B * Y + C = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   X       Y       A       B       C       DIST\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    a = atest(i);
    b = btest(i);
    c = ctest(i);
    p(1:dim_num) = ptest(1:dim_num,i);

    dist = line_imp_point_dist_2d ( a, b, c, p );

    fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', ...
      p(1:dim_num), a, b, c, dist );

  end

  return
end
