function r8_cosd_test ( )

%*****************************************************************************80
%
%% R8_COSD_TEST tests R8_COSD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_COSD_TEST\n' );
  fprintf ( 1, '  R8_COSD computes the cosine of an angle\n' );
  fprintf ( 1, '  given in degrees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ANGLE    R8_COSD(ANGLE)\n' );
  fprintf ( 1, '\n' );
 
  for i = 0 : 15 : 360
    angle = i;
    fprintf ( 1, '  %8.2f  %14.6g\n', angle, r8_cosd ( angle ) );
  end
 
  return
end
