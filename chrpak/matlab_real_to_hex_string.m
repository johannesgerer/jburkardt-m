function hex = matlab_real_to_binary_string ( x )

%*****************************************************************************80
%
%% MATLAB_REAL_TO_HEX_STRING converts a MATLAB real number to a hexadecimal string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the MATLAB real number.
%
%    Output, string HEX, the hexadecimal string.
%
  hex = sprintf ( '%bx', x );

  return
end
