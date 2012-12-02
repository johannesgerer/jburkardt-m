function subpak_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests GRID2.
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
  nstep = 20;

  x1 = [ 1.0,  0.0, 20.0, -5.0, 1.0 ];
  x2 = [ 1.0, 10.0,  0.0,  5.0, 2.0 ];

  j1 = 3;
  j2 = 13;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  GRID2 computes a 1 D grid between\n' );
  fprintf ( 1, '  two DIM_NUM dimensional points X1 and X2,\n' );
  fprintf ( 1, '  computing X1 and X2 at user specified times.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we will use %d steps\n', nstep );
  fprintf ( 1, '  and on step %d we will compute\n', j1 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and on step %d we will compute\n', j2 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x2(i) );
  end
  fprintf ( 1, '\n' );
 
  x = grid2 ( j1, j2, dim_num, nstep, x1, x2 );
 
  r8mat_print ( dim_num, nstep, x, '  The grid matrix:' );

  return
end
