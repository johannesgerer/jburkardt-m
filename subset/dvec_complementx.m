function dvec2 = dvec_complement2 ( n, dvec1 )

%*****************************************************************************80
%
%% DVEC_COMPLEMENTX computes the ten's complement of a DVEC.
%
%  Discussion:
%
%    A DVEC is an integer vector of decimal digits, intended to
%    represent an integer.  DVEC(1) is the units digit, DVEC(N-1)
%    is the coefficient of 10**(N-2), and DVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer DVEC1(N), the vector to be complemented.
%
%    Output, integer DVEC2(N), the ten's complemented vector.
%
  base = 10;

  dvec3(1:n) = ( base - 1 ) - dvec1(1:n);

  dvec4(1) = 1;
  dvec4(2:n) = 0;

  dvec2 = dvec_add ( n, dvec3, dvec4 );

  return
end
