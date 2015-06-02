function value = c8_inv ( z )

%*****************************************************************************80
%
%% C8_INV evaluates the inverse of a C8.
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
%    Output, complex VALUE, the function value.
%
  z_real = real ( z );
  z_imag = imag ( z );

  z_norm = sqrt ( z_real * z_real + z_imag * z_imag );

  value = ( z_real - z_imag * i ) / z_norm / z_norm;

  return
end
