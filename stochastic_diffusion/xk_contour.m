function figure_num = xk_contour ( figure_num )

%*****************************************************************************80
%
%% XK_CONTOUR displays contour plots of a 1D stochastic diffusivity function.
%
%  Discussion:
%
%    The diffusivity function is compute by DIFFUSIVITY_1D_XK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dongbin Xiu, George Karniadakis,
%    Modeling uncertainty in steady state diffusion problems via
%    generalized polynomial chaos,
%    Computer Methods in Applied Mechanics and Engineering,
%    Volume 191, 2002, pages 4927-4948.
%
%  Parameters:
%
%    Input/output, integer FIGURE_NUM, the current number of figures.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'XK_CONTOUR\n' );
  fprintf ( 1, '  Display the stochastic diffusivity function\n' );
  fprintf ( 1, '  defined by DIFFUSIVITY_1D_XK.\n' );
%
%  Initialize the normal random number generator.
%
  seed = -1;
  [ ~, ~ ] = r8vec_normal_01 ( -1, seed );
%
%  Set the spatial grid.
%
  n = 51;
  x_min = -1.0;
  x_max = +1.0;
  x = linspace ( x_min, x_max, n );
%
%  Sample the OMEGA values.
%  Use a seed of 0 for the MATLAB random number generator.
%
  m = 5;
  seed = 123456789;
  if ( seed == 0 )
    omega = randn ( m, 1 );
  else
    [ omega, seed ] = r8vec_normal_01 ( m, seed );
  end
%
%  Compute the diffusivity field.
%
  dc0 = 10.0;
  dc = diffusivity_1d_xk ( dc0, m, omega, n, x );
%
%  Plot the diffusivity field.
%
  figure_num = figure_num + 1;
  figure ( figure_num )
  plot ( x, dc, 'LineWidth', 2 );
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( 'DC(X)' )
  title ( 'XK Stochastic diffusivity function' )
%
%  Once again, the idiotic conventions of the [] operator require
%  me to slap my forehead and write a workaround.
%
  dc_max = max ( dc );
  axis ( [ -1.0, +1.0, 0.0, dc_max ] )

  filename = 'xk_contour.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file stored as "%s".\n', filename );

  return
end
