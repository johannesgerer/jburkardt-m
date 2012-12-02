function r = dec_to_r8 ( mantissa, exponent )

%*****************************************************************************80
%
%% DEC_TO_R8 converts a decimal to an R8.
%
%  Discussion:
%
%    A decimal value is represented by MANTISSA * 10**EXPONENT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MANTISSA, EXPONENT, the coefficient and exponent
%    of the decimal value.
%
%    Output, real R, the equivalent real value.
%
  r = mantissa * ( 10 ^ exponent );

  return
end
