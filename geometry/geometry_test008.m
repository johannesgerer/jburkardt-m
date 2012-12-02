function geometry_test008 ( )

%*****************************************************************************80
%
%% TEST008 tests BASIS_MAP_3D.
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
  u = [ ...
    1.0, 2.0, 3.0; ...
    0.0, 0.0, 1.0; ...
    1.0, 0.0, 2.0 ]';
  v = [ ...
    14.0, 4.0, 4.0; ...
     3.0, 1.0, 0.0; ...
     7.0, 3.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST008\n' );
  fprintf ( 1, '  BASIS_MAP_3D computes the linear transform A\n' );
  fprintf ( 1, '  which maps vectors U1, U2 and U3 to vectors\n' );
  fprintf ( 1, '  V1, V2 and V3.\n' );

  r8mat_print ( 3, 3, u, '  The matrix U' );

  r8mat_print ( 3, 3, v, '  The matrix V' );

  [ a, ierror ] = basis_map_3d ( u, v );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The matrix [ U1 | U2 | U3 ] was singular.\n' );
    fprintf ( 1, '  No transformation was computed.\n' );
    return;
  end

  r8mat_print ( 3, 3, a, '  The transformation matrix' );

  c(1:3,1:3) = a(1:3,1:3) * u(1:3,1:3);

  r8mat_print ( 3, 3, c, '  The product matrix A * [ U1 | U2 | U3 ]' );

  return
end
