function ell_test ( )

%*****************************************************************************80
%
%% ELL_TEST tests GPL_TRIANGLES on ELL.GPL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELL_TEST:\n' );
  fprintf ( 1, '  Read a GPL file that describes a 3D surface using\n' );
  fprintf ( 1, '  triangular patches, and display it.\n' );

  filename = 'ell.gpl';
%
%  I should be able to determine N from the file...
%
  n = 96;

  [ x, y, z ] = gpl_triangles ( filename, n );

  patch ( x, y, z, z, 'FaceColor', 'interp' );

  xlabel ( '<---X--->', 'Fontsize', 16 );
  ylabel ( '<---Y--->', 'Fontsize', 16 );
  zlabel ( '<---Z(X,Y)--->', 'Fontsize', 16 );
  grid on
  view ( 3 )
  title ( filename, 'Fontsize', 24 )

  png_filename = 'ell.png';
  print ( '-dpng', png_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving PNG snapshot as "%s"\n', png_filename );

  return
end
