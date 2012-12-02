function pwl_interp_1d_test02 ( prob )

%*****************************************************************************80
%
%% PWL_INTERP_1D_TEST02 tests PWL_BASIS_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_1D_TEST02:\n' );
  fprintf ( 1, '  Plot the piecewise linear basis functions for TEST_INTERP problem #%d\n', prob );

  dim_num = p00_dim_num ( prob );

  nd = p00_data_num ( prob );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  xy = p00_data ( prob, dim_num, nd );
  
  xd = reshape ( xy(1,1:nd), nd, 1 );
  r8vec_print ( nd, xd, '  X Data Locations:' );

  figure ( 1 );
  clf
  ni = 181;
  xmin = min ( xd );
  xmax = max ( xd );
  xi = r8vec_linspace ( ni, xmin, xmax );

  hold on

  for k = 1 : nd
    bk = pwl_basis_1d ( nd, xd, k, ni, xi );
    plot ( xi, bk, 'r-', 'Linewidth', 4 );
  end
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( 'Piecewise linear basis functions for problem %d', prob ) )
  grid on
  hold off

  filename = sprintf ( 'p%02d_pwl_basis.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
