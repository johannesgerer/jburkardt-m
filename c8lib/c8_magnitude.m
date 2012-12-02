function value = c8_magnitude ( x )

%*****************************************************************************80
%
%% C8_MAGNITUDE returns the magnitude of a C8.
%
%  Discussion:
%
%    A C8 is a complex double precision value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, the value whose magnitude is desired.
%
%    Output, real VALUE, the magnitude of X.
%
  value = sqrt ( ( real ( x ) )^2 + ( imag ( x ) )^2 );

  return
end
