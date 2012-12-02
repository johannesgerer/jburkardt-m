function subpak_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests GRID1.
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
  nstep = 11;

  x1 = [ 1.0,  0.0, 20.0, -5.0, 1.0 ];
  x2 = [ 1.0, 10.0,  0.0,  5.0, 2.0 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  GRID1 computes a 1D grid between\n' );
  fprintf ( 1, '  two DIM_NUM dimensional points X1 and X2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we will use %d steps\n', nstep );
  fprintf ( 1, '  going from\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  to\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x2(i) );
  end
  fprintf ( 1, '\n' );
 
  x = grid1 ( dim_num, nstep, x1, x2 );
 
  r8mat_transpose_print ( dim_num, nstep, x, '  The grid matrix:' );
 
  return
end
