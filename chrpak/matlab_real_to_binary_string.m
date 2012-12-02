function binary = matlab_real_to_binary_string ( x )

%*****************************************************************************80
%
%% MATLAB_REAL_TO_BINARY_STRING converts a MATLAB real number to a binary string.
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
%    Output, string BINARY, the binary string.
%

%
%  Convert X to a hexadecimal string.
%
  hex = matlab_real_to_hex_string ( x );
%
%  Convert hexadecimal to binary.
%
  binary = hex_to_binary_string ( hex );

  return
end
