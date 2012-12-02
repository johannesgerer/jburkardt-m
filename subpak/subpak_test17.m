function subpak_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests GRID4.
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
  nstep1 = 6;
  nstep2 = 10;

  x1 = [ 1.0,  0.0, 20.0, -5.0, 1.0 ];
  x2 = [ 1.0, 10.0,  0.0,  5.0, 2.0 ];
  x3 = [ 1.0,  5.0,  0.0,  0.0, 3.0 ];

  j1 = 2;
  j2 = 5;
  k1 = 3;
  k2 = 9;
   
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  GRID4 computes a 2D planar grid\n' );
  fprintf ( 1, '  containing the DIM_NUM-dimensional\n' );
  fprintf ( 1, '  points X1, X2 and X3.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We compute the points on the following steps:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X1 on step (%d, %d)\n', j1, k1 );
  fprintf ( 1, '  X2 on step (%d, %d)\n', j2, k1 );
  fprintf ( 1, '  X3 on step (%d, %d)\n', j1, k2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will use %d steps in the J direction\n', nstep1 );
  fprintf ( 1, '  and %d steps in the K direction.\n', nstep2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The points X1, X2 and X3 are:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x2(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x3(i) );
  end
  fprintf ( 1, '\n' );
 
  x = grid4 ( j1, j2, k1, k2, dim_num, nstep1, nstep2, x1, x2, x3 );

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
