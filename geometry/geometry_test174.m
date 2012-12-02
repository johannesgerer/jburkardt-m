function geometry_test174 ( )

%*****************************************************************************80
%
%% TEST174 tests RADEC_TO_XYZ, XYZ_TO_RADEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  ntest = 6;

  ptest = [ ...
     1.0,  0.0,  0.0; ...
     0.0,  1.0,  0.0; ...
     0.0,  0.0,  1.0; ...
     1.0,  1.0,  1.0; ...
     5.0, -2.0, -1.0; ...
    -2.0, -2.0, -2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST174\n' );
  fprintf ( 1, '  RADEC_TO_XYZ converts XYZ to RADEC coordinates.\n' );
  fprintf ( 1, '  XYZ_TO_RADEC converts RADEC to XYZ coordinates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          P1          RA     DEC           P2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p1(1:3,1) = ptest(1:3,i);

    [ ra, dec ] = xyz_to_radec ( p1 );
    p2 = radec_to_xyz ( ra, dec );

    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      p1(1:3,1), ra, dec, p2(1:3,1) );

  end

  return
end
