function solution_test ( )

%*****************************************************************************80
%
%% SOLUTION_TEST tests GPL_SQUARES on SOLUTION.GPL.
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
  fprintf ( 1, 'SOLUTION_TEST:\n' );
  fprintf ( 1, '  Read a GPL file that describes a 3D surface using\n' );
  fprintf ( 1, '  square patches, and display it.\n' );

  filename = 'solution.gpl';
%
%  I should be able to determine N from the file...
%
  n = 1024;

  [ x, y, z ] = gpl_squares ( filename, n );

  patch ( x, y, z, z, 'FaceColor', 'interp' );

  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y--->', 'Fontsize', 16 );
  zlabel ( '<---Z(X,Y)--->', 'Fontsize', 16 );
  grid on
  title ( filename, 'Fontsize', 24 )

  png_filename = 'solution.png';
  print ( '-dpng', png_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving PNG snapshot as "%s"\n', png_filename );

  return
end
