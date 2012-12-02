function geometry_test1893 ( )

%*****************************************************************************80
%
%% TEST1893 tests RTP_TO_XYZ and XYZ_TO_RTP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  a = -2.0;
  b =  3.0;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1893\n' );
  fprintf ( 1, '  RTP_TO_XYZ converts XYZ to (R,Theta,Phi) coordinates.\n' );
  fprintf ( 1, '  XYZ_TO_RTP converts (R,Theta,Phi) to XYZ coordinates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      X1     Y1     Z1     R    THETA    PHI    X2     Y2     Z2\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ xyz1(1:3,1), seed ] = r8vec_uniform ( 3, a, b, seed );

    [ r, theta, phi ] = xyz_to_rtp ( xyz1 );
    xyz2 = rtp_to_xyz ( r, theta, phi );

    fprintf ( 1, '  %7f  %7f  %7f  %7f  %7f  %7f  %7f  %7f  %7f\n', ...
      xyz1(1:3,1), r, theta, phi, xyz2(1:3,1) );

  end

  return
end
