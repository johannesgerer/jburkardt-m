function r8_cotd_test ( )

%*****************************************************************************80
%
%% R8_COTD_TEST tests R8_COTD.
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
  fprintf ( 1, 'R8_COTD_TEST\n' );
  fprintf ( 1, '  R8_COTD computes the cotangent of an angle\n' );
  fprintf ( 1, '  given in degrees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ANGLE    R8_COTD(ANGLE)\n' );
  fprintf ( 1, '\n' );
 
  for i = 0 : 15 : 360
    angle = i;
    if ( mod ( i, 180 ) == 0 )
      fprintf ( 1, '  %8.2f    Undefined\n', angle );
    else
      fprintf ( 1, '  %8.2f  %14.6g\n', angle, r8_cotd ( angle ) );
    end
  end
 
  return
end
