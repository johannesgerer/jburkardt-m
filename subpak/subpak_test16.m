function subpak_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests GRID3N.
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
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  GRID3N computes a point from a 2D\n' );
  fprintf ( 1, '  grid in the plane containing the\n' );
  fprintf ( 1, '  DIM_NUM-dimensional points X1, X2 and X3.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we will use %d steps from\n', nstep1 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x1(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  to\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x2(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  and %d steps to\n', nstep2 );
  for i = 1 : dim_num
    fprintf ( 1, '  %12f', x3(i) );
  end
  fprintf ( 1, '\n' );
 
  for j = 1 : nstep1
    fprintf ( 1, '\n' );
    for k = 1 : nstep2 
      x = grid3n ( j, k, dim_num, nstep1, nstep2, x1, x2, x3 );
      fprintf ( 1, '  %3d  %3d', j, k );
      for i = 1 : dim_num
        fprintf ( 1, '  %12f', x(i) );
      end
      fprintf ( 1, '\n' );
 
    end
  end

  return
end
