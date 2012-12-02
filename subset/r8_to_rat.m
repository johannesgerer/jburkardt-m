function [ iatop, iabot ] = r8_to_rat ( r, ndig )

%*****************************************************************************80
%
%% R8_TO_RAT converts a real value to a rational value.
%
%  Discussion:
%
%    The rational value (IATOP/IABOT) is essentially computed by truncating
%    the decimal representation of the real value after a given number of
%    decimal digits.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the real value to be converted.
%
%    Input, integer NDIG, the number of decimal digits used.
%
%    Output, integer IATOP, IABOT, the numerator and denominator
%    of the rational value that approximates the real number.
%
  factor = 10^ndig;

  if ( 0 < ndig )
    ifac = 10^ndig;
    jfac = 1;
  else
    ifac = 1;
    jfac = 10^(-ndig);
  end

  itop = round ( r * factor ) * jfac;
  ibot = ifac;
%
%  Factor out the greatest common factor.
%
  itemp = i4_gcd ( itop, ibot );

  iatop = floor ( itop / itemp );
  iabot = floor ( ibot / itemp );

  return
end
