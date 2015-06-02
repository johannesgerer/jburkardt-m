function value = r8_csc ( theta )

%*****************************************************************************80
%
%% R8_CSC returns the cosecant of X.
%
%  Discussion:
%
%    R8_CSC ( THETA ) = 1.0 / SIN ( THETA )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real THETA, the angle, in radians, whose cosecant is desired.
%    It must be the case that SIN ( THETA ) is not zero.
%
%    Output, real VALUE, the cosecant of THETA.
%
  value = sin ( theta );

  if ( value == 0.0 )
    fprinf ( 1, '\n' );
    fprintf ( 1, 'R8_CSC - Fatal error!\n' );
    fprintf ( 1, '  Cosecant undefined for THETA = %f\n', theta );
    error ( 'R8_CSC - Fatal error!' );
  end

  value = 1.0 / value;

  return
end
