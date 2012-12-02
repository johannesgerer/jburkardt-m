function pwl_interp_2d_scattered_test02 ( )

%*****************************************************************************80
%
%% PWL_INTERP_2D_SCATTERED_TEST02 tests PWL_INTERP_2D_SCATTERED_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2012
%
%  Author:
%
%    John Burkardt
%
  ni = 25;
  node_num = 9;
  element_order = 3;

  node_xy = [ ...
       0.0, 0.0; ...
       0.0, 1.0; ...
       0.2, 0.5; ...
       0.3, 0.6; ...
       0.4, 0.5; ...
       0.6, 0.4; ...
       0.6, 0.5; ...
       1.0, 0.0; ...
       1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  PWL_INTERP_2D_SCATTERED_VALUE evaluates a\n' );
  fprintf ( 1, '  piecewise linear interpolant to scattered data.\n' );
%
%  Set up the Delaunay triangulation.
%
  [ element_num, triangle, element_neighbor ] = r8tris2 ( node_num, node_xy );
%
%  Define the Z data.
%
  for i = 1 : node_num
    x = node_xy(1,i);
    y = node_xy(2,i);
    zd(i) = x + 2.0 * y;
  end
%
%  Define the interpolation points.
%
  k = 0;
  for i = 1 : 5
    for j = 1 : 5
      k = k + 1;
      xyi(1,k) = ( i - 1 ) / 4.0;
      xyi(2,k) = ( j - 1 ) / 4.0;
    end
  end
%
%  Evaluate the interpolant.
%
  zi = pwl_interp_2d_scattered_value ( node_num, node_xy, zd, element_num, ...
    triangle, element_neighbor, ni, xyi );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     K      Xi(K)       Yi(K)       Zi(K)       Z(X,Y)\n' );
  fprintf ( 1, '\n' );
  for k = 1 : ni
    fprintf ( 1, '  %4d  %10f  %10f  %10f  %10f\n', ...
      k, xyi(1,k), xyi(2,k), zi(k), xyi(1,k) + 2.0 * xyi(2,k) );
  end

  return
end

