function make_plots ( )

%*****************************************************************************80
%
%% MAKE_PLOTS plots a sequence of COLORED_NOISE datasets.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_PLOTS\n' );
  fprintf ( 1, '  We assume COLORED_NOISE_PRB has just been run,\n' );
  fprintf ( 1, '  creating files alpha_0.00.txt through alpha_2.00.txt.\n' );
  fprintf ( 1, '  This program computes a common axis size for these files\n' );
  fprintf ( 1, '  and plots each data set as a separate PNG file.\n' );

  y000 = load ( 'alpha_0.00.txt' );
  y025 = load ( 'alpha_0.25.txt' );
  y050 = load ( 'alpha_0.50.txt' );
  y075 = load ( 'alpha_0.75.txt' );
  y100 = load ( 'alpha_1.00.txt' );
  y125 = load ( 'alpha_1.25.txt' );
  y150 = load ( 'alpha_1.50.txt' );
  y175 = load ( 'alpha_1.75.txt' );
  y200 = load ( 'alpha_2.00.txt' );
  
  xmin = 1;
  xmax = length ( y000 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of entries in sequence is %d\n', xmax );

  ymin = min ( min ( [ y000; y025; y050; y075; y100; y125; y150; y175; y200 ] ) );
  ymax = max ( max ( [ y000; y025; y050; y075; y100; y125; y150; y175; y200 ] ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y-range of plots is %f to %f\n', ymin, ymax );
  
  gcf = plot ( y000 );
  title ( 'Alpha = 0.00' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_0.00.png', 'png' );
  pause ( 2 )

  gcf = plot ( y025 );
  title ( 'Alpha = 0.25' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_0.25.png', 'png' );
  pause ( 2 )

  gcf = plot ( y050 );
  title ( 'Alpha = 0.50' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_0.50.png', 'png' );
  pause ( 2 )

  gcf = plot ( y075 );
  title ( 'Alpha = 0.75' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_0.75.png', 'png' );
  pause ( 2 )

  gcf = plot ( y100 );
  title ( 'Alpha = 1.00' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_1.00.png', 'png' );
  pause ( 2 )

  gcf = plot ( y125 );
  title ( 'Alpha = 1.25' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_1.25.png', 'png' );
  pause ( 2 )

  gcf = plot ( y150 );
  title ( 'Alpha = 1.50' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_1.50.png', 'png' );
  pause ( 2 )

  gcf = plot ( y175 );
  title ( 'Alpha = 1.75' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_1.75.png', 'png' );
  pause ( 2 )

  gcf = plot ( y200 );
  title ( 'Alpha = 2.00' );
  axis ( [ xmin, xmax, ymin, ymax ] );
  saveas ( gcf, 'alpha_2.00.png', 'png' );
  pause ( 2 )

  close
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_PLOTS\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
