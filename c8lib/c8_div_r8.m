function value = c8_div_r8 ( z1, r )

%*****************************************************************************80
%
%% C8_DIV_R8 divides a C8 by an R8.
%
%  Discussion:
%
%    A C8 is a complex value.
%    An R8 is a real value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex Z1, the value to be divided.
%
%    Input, real R, the divisor.
%
%    Output, complex VALUE, the function value.
%
  a = c8_real ( z1 ) / r;
  b = c8_imag ( z1 ) / r;

  value = a + b * i;

  return
end