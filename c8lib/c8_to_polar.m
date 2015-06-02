function [ r, theta ] = c8_to_polar ( z )

%*****************************************************************************80
%
%% C8_TO_POLAR converts a C8 to polar form.
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
%    Output, real R, THETA, the polar form.
%
  r = c8_mag ( z );
  theta = c8_arg ( z );

  return
end
