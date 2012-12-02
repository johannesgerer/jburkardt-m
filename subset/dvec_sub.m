function dvec3 = dvec_sub ( n, dvec1, dvec2 )

%*****************************************************************************80
%
%% DVEC_SUB subtracts two decimal vectors.
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
%    Input, integer DVEC1(N), DVEC2(N), the vectors to be subtracted.
%
%    Output, integer DVEC3(N), the value of DVEC1 - DVEC2.
%
  dvec4(1:n) = dvec_complementx ( n, dvec2 );

  dvec3 = dvec_add ( n, dvec1, dvec4 );

  return
end
