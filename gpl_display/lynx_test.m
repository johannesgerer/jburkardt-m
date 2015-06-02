function lynx_test ( )

%*****************************************************************************80
%
%% LYNX_TEST tests GPL_CURVE on LYNX.GPL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LYNX_TEST:\n' );
  fprintf ( 1, '  Read a GPL file that describes a single 1D, 2D or 3D\n' );
  fprintf ( 1, '  curve, and display it.\n' );

  filename = 'lynx.gpl';
%
%  I should be able to determine M and N from the file...
%
  m = gpl_dimension ( filename );
  n = 101;

  x = gpl_curve ( filename, m, n );

  plot ( x(1,:), 'r-', 'Linewidth', 3 );
  xlabel ( '<---I--->', 'Fontsize', 16 );
  ylabel ( '<---X(I)--->', 'Fontsize', 16 );
  title ( filename, 'Fontsize', 24 )
  grid on

  png_filename = 'lynx.png';
  print ( '-dpng', png_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving PNG snapshot as "%s"\n', png_filename );

  return
end
