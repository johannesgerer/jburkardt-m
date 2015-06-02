function 5by3_test ( )

%*****************************************************************************80
%
%% 5BY3_TEST tests GPL_GRID on the 5BY3.GPL file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '5BY3_TEST:\n' );
  fprintf ( 1, '  Read a GPL file that describes a 3D surface using\n' );
  fprintf ( 1, '  a rectangular grid, and display it using surf().\n' );

  filename = '5by3.gpl';
%
%  I should be able to determine M and N from the file...
%
  m = 5;
  n = 3;

  [ x, y, z ] = gpl_grid ( filename, m, n );

  surf ( x, y, z, 'FaceColor', 'interp' );
  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y--->', 'Fontsize', 16 );
  zlabel ( '<---Z(X,Y)--->', 'Fontsize', 16 );
  grid on
  title ( filename, 'Fontsize', 24 )

  png_filename = '5by3.png';
  print ( '-dpng', png_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving PNG snapshot as "%s"\n', png_filename );

  return
end
