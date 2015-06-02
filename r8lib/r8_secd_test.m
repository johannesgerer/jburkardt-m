function r8_sectest ( )

%*****************************************************************************80
%
%% R8_SECD_TEST tests R8_SECD.
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
  fprintf ( 1, 'R8_SECD_TEST\n' );
  fprintf ( 1, '  R8_SECD computes the secant of an angle\n' );
  fprintf ( 1, '  given in degrees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ANGLE    R8_SECD(ANGLE)\n' );
  fprintf ( 1, '\n' );
 
  for i = 0 : 15 : 360
    angle = i;
    if ( mod ( i + 90, 180 ) == 0 )
      fprintf ( 1, '  %8.2f    Undefined\n', angle );
    else
      fprintf ( 1, '  %8.2f  %14.6g\n', angle, r8_secd ( angle ) );
    end
  end
 
  return
end
