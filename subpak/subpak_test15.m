function subpak_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests GRID3.
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
  nstep1 = 3;
  nstep2 = 6;

  x1 = [ 1.0,  0.0, 20.0, -5.0, 1.0 ];
  x2 = [ 1.0, 10.0,  0.0,  5.0, 2.0 ];
  x3 = [ 1.0,  5.0,  0.0,  0.0, 3.0 ];
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  GRID3 computes a 2D grid in the plane\n' );
  fprintf ( 1, '  containing the DIM_NUM-dimensional\n' );
  fprintf ( 1, '  points X1, X2 and X3.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we will use %d steps\n', nstep1 );
  fprintf ( 1, '  going from \n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  to\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x2(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and %d steps\n', nstep2 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x3(i) );
  end
  fprintf ( 1, '\n' );
 
  x = grid3 ( dim_num, nstep1, nstep2, x1, x2, x3 );
 
  for j = 1 : nstep1
    fprintf ( 1, '\n' );
    for k = 1 : nstep2
      fprintf ( 1, '  %3d  %3d', j, k );
      for i = 1 : dim_num
        fprintf ( 1, '  %12f', x(i,j,k) );
      end
      fprintf ( 1, '\n' );
    end
  end

  return
end
