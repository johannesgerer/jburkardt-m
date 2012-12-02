function geompack_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests R8TRIS2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  ndim = 2;
  g_num = 9;

  g_xy = [ ...
       0.0, 0.0; ...
       0.0, 1.0; ...
       0.2, 0.5; ...
       0.3, 0.6; ...
       0.4, 0.5; ...
       0.6, 0.4; ...
       0.6, 0.5; ...
       1.0, 0.0; ...
       1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  R8TRIS2 computes the Delaunay triangulation of a\n' );
  fprintf ( 1, '  pointset in 2D.\n' );
%
%  Set up the Delaunay triangulation.
%
  [ tri_num, nod_tri, tnbr ] = r8tris2 ( g_num, g_xy );

  triangulation_print ( g_num, tri_num, g_xy, nod_tri, tnbr );

  return
end
