function value = csc ( theta )

%*****************************************************************************80
%
%% CSC returns the cosecant of X.
%
%  Discussion:
%
%    CSC ( THETA ) = 1.0 / SIN ( THETA )
%
%    CSC is not a built-in function in FORTRAN, and occasionally it
%    is handier, or more concise, to be able to refer to it directly
%    rather than through its definition in terms of the sine function.
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
    fprintf ( 1, 'CSC - Fatal error!\n' );
    fprintf ( 1, '  Cosecant undefined for THETA = %f\n', theta );
    error ( 'CSC - Fatal error!' );
  end

  value = 1.0 / value;

  return
end
