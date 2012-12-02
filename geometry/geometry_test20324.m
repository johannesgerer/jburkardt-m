function geometry_test20324 ( )

%*****************************************************************************80
%
%% TEST20324 tests TETRAHEDRON_SAMPLE_3D, TETRAHEDRON_BARYCENTRIC_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  seed = 123456789;
  t = [ ...
     1.0, 4.0, 3.0; ...
     2.0, 4.0, 3.0; ...
     1.0, 6.0, 3.0; ...
     1.0, 4.0, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20324\n' );
  fprintf ( 1, '  TETRAHEDRON_SAMPLE_3D samples a tetrahedron.\n' );
  fprintf ( 1, '  TETRAHEDRON_BARYCENTRIC_3D converts XYZ to XSI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are computing the XSI coordinates just to verify\n' );
  fprintf ( 1, '  that the points are inside the tetrahedron.\n' );

  r8mat_transpose_print ( dim_num, 4, t, '  Tetrahedron vertices' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (X,Y,Z)   (XSI1,XSI2,XSI3,XSI4):\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ p, seed ] = tetrahedron_sample_3d ( t, 1, seed );
    xsi = tetrahedron_barycentric_3d ( t, p );
    fprintf ( 1, '  %8f  %8f  %8f    %8f  %8f  %8f  %8f\n', ...
      p(1:dim_num), xsi(1:dim_num+1) );
  end

  return
end
