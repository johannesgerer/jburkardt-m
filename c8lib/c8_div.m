function value = c8_div ( z1, z2 )

%*****************************************************************************80
%
%% C8_DIV divides two C8's.
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
%    09 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex Z1, Z2, the arguments.
%
%    Output, complex VALUE, the function value.
%
  a = c8_real ( z1 );
  b = c8_imag ( z1 );
  c = c8_real ( z2 );
  d = c8_imag ( z2 );

  e = c * c + d * d;

  f = ( a * c + b * d ) / e;
  g = ( b * c - a * d ) / e;

  value = f + g * i;

  return
end