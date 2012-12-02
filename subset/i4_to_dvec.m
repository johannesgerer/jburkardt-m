function dvec = i4_to_dvec ( i, n )

%*****************************************************************************80
%
%% I4_TO_DVEC makes a signed decimal vector from an integer.
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
%    Input, integer I, an integer to be represented.
%
%    Input, integer N, the dimension of the vector.
%
%    Output, integer DVEC(N), the signed decimal representation.
%
  base = 10;
  i2 = abs ( i );

  for j = 1 : n-1
    dvec(j) = mod ( i2, base );
    i2 = floor ( i2 / base );
  end

  dvec(n) = 0;

  if ( i < 0 )
    dvec = dvec_complementx ( n, dvec );
  end

  return
end
