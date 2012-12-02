function geometry_test0616 ( )

%*****************************************************************************80
%
%% TEST0616 tests PLANE_NORMAL_QR_TO_XYZ and PLANE_NORMAL_XYZ_TO_QR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2010
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0616\n' );
  fprintf ( 1, '  For a normal plane, with point PP and NORMAL vector,\n' );
  fprintf ( 1, '  and in-plane basis vectors PQ and PR,\n' );
  fprintf ( 1, '  PLANE_NORMAL_QR_TO_XYZ converts QR to XYZ coordinates;\n' );
  fprintf ( 1, '  PLANE_NORMAL_XYZ_TO_QR converts XYZ to QR coordinates.\n' );
%
%  Choose PP and NORMAL at random.
%
  [ pp, seed ] = r8vec_uniform_01 ( m, seed );

  [ normal, seed ] = r8vec_uniform_01 ( m, seed );
%
%  Compute in-plane basis vectors PQ and PR.
%
  [ pq, pr ] = plane_normal_basis_3d ( pp, normal );
%
%  Choose random Q, R coordinates.
%
  [ qr1, seed ] = r8mat_uniform_01 ( m - 1, n, seed );
%
%  Convert to XYZ.
%
  xyz = plane_normal_qr_to_xyz ( pp, normal, pq, pr, n, qr1 );
%
%  Convert XYZ to QR.
%
  qr2 = plane_normal_xyz_to_qr ( pp, normal, pq, pr, n, xyz );

  dif = sqrt ( sum ( ( qr1 - qr2 ).^2, 1 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum difference for %d points was %f\n', n, max ( dif ) );

  return
end
