function simp_plot_2d_demo ( )

%*****************************************************************************80
%
%% SIMP_PLOT_2D_DEMO displays some examples of the use of SIMP_PLOT_2D
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    06 February 2006
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
  fprintf ( 1, 'SIMP_PLOT_2D_DEMO\n' );
  fprintf ( 1, '  Demonstrations of the use of SIMP_PLOT_2D.\n' );
%
%  Problem 1.
%
  [ d, n ] = r8mat_header_read ( 'p01_nodes.txt' );
  p = r8mat_data_read ( 'p01_nodes.txt', d, n );
  t = i4mat_read ( 'p01_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 2.
%
  [ d, n ] = r8mat_header_read ( 'p02_nodes.txt' );
  p = r8mat_data_read ( 'p02_nodes.txt', d, n );
  t = i4mat_read ( 'p02_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 3.
%
  [ d, n ] = r8mat_header_read ( 'p03_nodes.txt' );
  p = r8mat_data_read ( 'p03_nodes.txt', d, n );
  t = i4mat_read ( 'p03_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 4.
%
  [ d, n ] = r8mat_header_read ( 'p04_nodes.txt' );
  p = r8mat_data_read ( 'p04_nodes.txt', d, n );
  t = i4mat_read ( 'p04_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 5.
%
  [ d, n ] = r8mat_header_read ( 'p05_nodes.txt' );
  p = r8mat_data_read ( 'p05_nodes.txt', d, n );
  t = i4mat_read ( 'p05_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 6.
%
  [ d, n ] = r8mat_header_read ( 'p06_nodes.txt' );
  p = r8mat_data_read ( 'p06_nodes.txt', d, n );
  t = i4mat_read ( 'p06_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 7.
%
  [ d, n ] = r8mat_header_read ( 'p07_nodes.txt' );
  p = r8mat_data_read ( 'p07_nodes.txt', d, n );
  t = i4mat_read ( 'p07_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 8.
%
  [ d, n ] = r8mat_header_read ( 'p08_nodes.txt' );
  p = r8mat_data_read ( 'p08_nodes.txt', d, n );
  t = i4mat_read ( 'p08_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 9.
%
  [ d, n ] = r8mat_header_read ( 'p09_nodes.txt' );
  p = r8mat_data_read ( 'p09_nodes.txt', d, n );
  t = i4mat_read ( 'p09_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 10.
%
  [ d, n ] = r8mat_header_read ( 'p10_nodes.txt' );
  p = r8mat_data_read ( 'p10_nodes.txt', d, n );
  t = i4mat_read ( 'p10_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 11.
%
  [ d, n ] = r8mat_header_read ( 'p11_nodes.txt' );
  p = r8mat_data_read ( 'p11_nodes.txt', d, n );
  t = i4mat_read ( 'p11_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 12.
%
  [ d, n ] = r8mat_header_read ( 'p12_nodes.txt' );
  p = r8mat_data_read ( 'p12_nodes.txt', d, n );
  t = i4mat_read ( 'p12_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 13.
%
  [ d, n ] = r8mat_header_read ( 'p13_nodes.txt' );
  p = r8mat_data_read ( 'p13_nodes.txt', d, n );
  t = i4mat_read ( 'p13_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause
%
%  Problem 14.
%
  [ d, n ] = r8mat_header_read ( 'p14_nodes.txt' );
  p = r8mat_data_read ( 'p14_nodes.txt', d, n );
  t = i4mat_read ( 'p14_elements.txt' );
  simp_plot_2d ( p', t' );
%
%  Problem 15.
%
  [ d, n ] = r8mat_header_read ( 'p15_nodes.txt' );
  p = r8mat_data_read ( 'p15_nodes.txt', d, n );
  t = i4mat_read ( 'p15_elements.txt' );
  simp_plot_2d ( p', t' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (press any key)\n' );

  pause

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMP_PLOT_2D_DEMO\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
