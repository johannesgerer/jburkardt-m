function subpak_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests GRID2N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 5;

  x1 = [ 1.0,  0.0, 20.0, -5.0, 1.0 ];
  x2 = [ 1.0, 10.0,  0.0,  5.0, 2.0 ];

  j1 = 3;
  j2 = 13;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  GRID2N computes points from a 1D grid\n' );
  fprintf ( 1, '  between two DIM_NUM dimensional points\n' );
  fprintf ( 1, '  X1 and X2, one at a time, with X1 and X2\n' );
  fprintf ( 1, '  having user specified J coordinates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, on step %d we would compute\n', j1 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and on step %d we would compute\n', j2 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x2(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
 
  for j = 1 : 20
    x = grid2n ( j, j1, j2, dim_num, x1, x2 );
    fprintf ( 1, '  %3d', j );
    for i = 1 : dim_num
      fprintf ( 1, '  %12f', x(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
