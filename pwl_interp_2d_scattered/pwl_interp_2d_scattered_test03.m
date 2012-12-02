function pwl_interp_2d_scattered_test03 ( prob )

%*****************************************************************************80
%
%% PWL_INTERP_2D_SCATTERED_TEST03 tests PWL_INTERP_2D_SCATTERED_VALUE.
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
  g = 2;
  nd = g00_size ( g );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_2D_SCATTERED_TEST03\n' );
  fprintf ( 1, '  PWL_INTERP_2D_SCATTERED_VALUE evaluates a\n' );
  fprintf ( 1, '  piecewise linear interpolant to scattered data.\n' );
  fprintf ( 1, '  Here, we use grid number %d\n', g );
  fprintf ( 1, '  with %d scattered points in the unit square\n', nd );
  fprintf ( 1, '  on problem %d\n', prob );
%
%  Get the data points and evaluate the function there.
%
  [ xd, yd ] = g00_xy ( g, nd );

  zd = f00_f0 ( prob, nd, xd, yd );

  xyd(1,1:nd) = xd(1:nd);
  xyd(2,1:nd) = yd(1:nd);
%
%  Set up the Delaunay triangulation.
%
  [ element_num, triangle, element_neighbor ] = r8tris2 ( nd, xyd );
%
%  Define the interpolation points.
%
  k = 0;
  for i = 1 : 5
    for j = 1 : 5
      k = k + 1;
      xyi(1,k) = ( 2 * i - 1 ) / 10.0;
      xyi(2,k) = ( 2 * j - 1 ) / 10.0;
    end
  end

  xi(1:ni,1) = xyi(1,1:ni);
  yi(1:ni,1) = xyi(2,1:ni);

  ze = f00_f0 ( prob, ni, xi, yi );
%
%  Evaluate the interpolant.
%
  zi = pwl_interp_2d_scattered_value ( nd, xyd, zd, element_num, ...
    triangle, element_neighbor, ni, xyi );

  rms = 0.0;
  for k = 1 : ni
    rms = rms + ( zi(k) - ze(k) )^2;
  end
  rms = sqrt ( rms / ni );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS error is %g\n', rms );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     K      Xi(K)       Yi(K)       Zi(K)       Z(X,Y)\n' );
  fprintf ( 1, '\n' );

  for k = 1 : ni
    fprintf ( 1, '  %4d  %10f  %10f  %10f  %10f\n', ...
      k, xyi(1,k), xyi(2,k), zi(k), ze(k) );
  end

  return
end

