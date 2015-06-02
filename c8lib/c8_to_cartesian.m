function [ x, y ] = c8_to_cartesian ( z )

%*****************************************************************************80
%
%% C8_TO_CARTESIAN converts a C8 to Cartesian form.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex Z, the argument.
%
%    Output, real X, Y, the Cartesian form.
%
  x = real ( z );
  y = imag ( z );

  return
end
