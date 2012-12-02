function dist_plot_demo ( )

%*****************************************************************************80
%
%% DIST_PLOT_DEMO displays some examples of the use of DIST_PLOT.
%
%  Modified:
%
%    14 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Local parameters:
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIST_PLOT_DEMO\n' );
  fprintf ( 1, '  Demonstrations of the use of DIST_PLOT.\n' );
%
%  Problem 1.
%
  [ d, n ] = r8mat_header_read ( 'p01_nodes.txt' );
  p = r8mat_data_read ( 'p01_nodes.txt', d, n );
  t = i4mat_read ( 'p01_triangles.txt' );
  dist_plot ( p', t', @p01_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 2.
%
  [ d, n ] = r8mat_header_read ( 'p02_nodes.txt' );
  p = r8mat_data_read ( 'p02_nodes.txt', d, n );
  t = i4mat_read ( 'p02_triangles.txt' );
  dist_plot ( p', t', @p02_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 3.
%
  [ d, n ] = r8mat_header_read ( 'p03_nodes.txt' );
  p = r8mat_data_read ( 'p03_nodes.txt', d, n );
  t = i4mat_read ( 'p03_triangles.txt' );
  dist_plot ( p', t', @p03_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 4.
%
  [ d, n ] = r8mat_header_read ( 'p04_nodes.txt' );
  p = r8mat_data_read ( 'p04_nodes.txt', d, n );
  t = i4mat_read ( 'p04_triangles.txt' );
  dist_plot ( p', t', @p04_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 5.
%
  [ d, n ] = r8mat_header_read ( 'p05_nodes.txt' );
  p = r8mat_data_read ( 'p05_nodes.txt', d, n );
  t = i4mat_read ( 'p05_triangles.txt' );
  dist_plot ( p', t', @p05_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 6.
%
  [ d, n ] = r8mat_header_read ( 'p06_nodes.txt' );
  p = r8mat_data_read ( 'p06_nodes.txt', d, n );
  t = i4mat_read ( 'p06_triangles.txt' );
  dist_plot ( p', t', @p06_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 7.
%
  [ d, n ] = r8mat_header_read ( 'p07_nodes.txt' );
  p = r8mat_data_read ( 'p07_nodes.txt', d, n );
  t = i4mat_read ( 'p07_triangles.txt' );
  dist_plot ( p', t', @p07_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 8.
%
  [ d, n ] = r8mat_header_read ( 'p08_nodes.txt' );
  p = r8mat_data_read ( 'p08_nodes.txt', d, n );
  t = i4mat_read ( 'p08_triangles.txt' );
  dist_plot ( p', t', @p08_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 9.
%
  [ d, n ] = r8mat_header_read ( 'p09_nodes.txt' );
  p = r8mat_data_read ( 'p09_nodes.txt', d, n );
  t = i4mat_read ( 'p09_triangles.txt' );
  dist_plot ( p', t', @p09_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 10.
%
  [ d, n ] = r8mat_header_read ( 'p10_nodes.txt' );
  p = r8mat_data_read ( 'p10_nodes.txt', d, n );
  t = i4mat_read ( 'p10_triangles.txt' );
  dist_plot ( p', t', @p10_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 11.
%
  [ d, n ] = r8mat_header_read ( 'p11_nodes.txt' );
  p = r8mat_data_read ( 'p11_nodes.txt', d, n );
  t = i4mat_read ( 'p11_triangles.txt' );
  dist_plot ( p', t', @p11_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 12.
%
  [ d, n ] = r8mat_header_read ( 'p12_nodes.txt' );
  p = r8mat_data_read ( 'p12_nodes.txt', d, n );
  t = i4mat_read ( 'p12_triangles.txt' );
  dist_plot ( p', t', @p12_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 13.
%
  [ d, n ] = r8mat_header_read ( 'p13_nodes.txt' );
  p = r8mat_data_read ( 'p13_nodes.txt', d, n );
  t = i4mat_read ( 'p13_triangles.txt' );
  dist_plot ( p', t', @p13_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 14.
%
  [ d, n ] = r8mat_header_read ( 'p14_nodes.txt' );
  p = r8mat_data_read ( 'p14_nodes.txt', d, n );
  t = i4mat_read ( 'p14_triangles.txt' );
  dist_plot ( p', t', @p14_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 15.
%
  [ d, n ] = r8mat_header_read ( 'p15_nodes.txt' );
  p = r8mat_data_read ( 'p15_nodes.txt', d, n );
  t = i4mat_read ( 'p15_triangles.txt' );
  dist_plot ( p', t', @p15_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 16.
%
  global R1 R2

  R1 = 0.4;
  R2 = 1.0;

  [ d, n ] = r8mat_header_read ( 'p16_nodes.txt' );
  p = r8mat_data_read ( 'p16_nodes.txt', d, n );
  t = i4mat_read ( 'p16_triangles.txt' );
  dist_plot ( p', t', @p16_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 17.
%
  [ d, n ] = r8mat_header_read ( 'p17_nodes.txt' );
  p = r8mat_data_read ( 'p17_nodes.txt', d, n );
  t = i4mat_read ( 'p17_triangles.txt' );
  dist_plot ( p', t', @p17_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 18.
%
  [ d, n ] = r8mat_header_read ( 'p18_nodes.txt' );
  p = r8mat_data_read ( 'p18_nodes.txt', d, n );
  t = i4mat_read ( 'p18_triangles.txt' );
  dist_plot ( p', t', @p18_fd );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIST_PLOT_DEMO\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
