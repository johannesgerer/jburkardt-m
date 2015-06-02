function r8_sind_test ( )

%*****************************************************************************80
%
%% R8_SIND_TEST tests R8_SIND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_SIND_TEST\n' );
  fprintf ( 1, '  R8_SIND computes the sine of an angle\n' );
  fprintf ( 1, '  given in degrees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ANGLE    R8_SIND(ANGLE)\n' );
  fprintf ( 1, '\n' );
 
  for i = 0 : 15 : 360
    angle = i;
    fprintf ( 1, '  %8.2f  %14.6g\n', angle, r8_sind ( angle ) );
  end
 
  return
end
