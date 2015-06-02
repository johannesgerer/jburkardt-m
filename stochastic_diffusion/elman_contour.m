function figure_num = elman_contour ( figure_num )

%*****************************************************************************80
%
%% ELMAN_CONTOUR displays a contour plot of a 2D stochastic diffusivity function.
%
%  Discussion:
%
%    The diffusivity function is compute by DIFFUSIVITY_2D_ELMAN.
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
%    Howard Elman, Darran Furnaval,
%    Solving the stochastic steady-state diffusion problem using multigrid,
%    IMA Journal on Numerical Analysis,
%    Volume 27, Number 4, 2007, pages 675-688.
%
%  Parameters:
%
%    Input/output, integer FIGURE_NUM, the current number of figures.
%
  if ( nargin < 1 )
    figure_num = 0;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELMAN_CONTOUR\n' );
  fprintf ( 1, '  Display contour or surface plots of the stochastic\n' );
  fprintf ( 1, '  diffusivity function defined by DIFFUSIVITY_2D_ELMAN.\n' );
%
%  Initialize the normal random number generator.
%
  seed = -1;
  [ ~, ~ ] = r8vec_normal_01 ( -1, seed );
%
%  Specify the X and Y evaluation points.
%
  nx = 51;
  a = 1.0;
  xvec = linspace ( -a, +a, nx );
  yvec = linspace ( -a, +a, nx );

  [ xmat, ymat ] = meshgrid ( xvec, yvec );
%
%  Sample OMEGA.
%
  m_1d = 5;
  msq = m_1d * m_1d;
  seed = 123456789;
  if ( seed == 0 )
    omega = randn ( msq, 1 );
  else
    [ omega, seed ] = r8vec_normal_01 ( msq, seed );
  end
%
%  Compute the diffusivity field.
%
  cl = 0.1;
  dc0 = 10.0;
  dc = diffusivity_2d_elman ( a, cl, dc0, m_1d, omega, nx, nx, xmat, ymat );
%
%  Make a surface plot.
%
  figure_num = figure_num + 1;
  figure ( figure_num );
  surf ( ymat, xmat, dc, 'EdgeColor', 'interp' )
  xlabel ( 'Y' )
  ylabel ( 'X' )
  zlabel ( 'DC(X,Y)' )
  title ( 'ELMAN Stochastic diffusivity function' )

  filename = 'elman_contour.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file stored as "%s".\n', filename );

  return
end
