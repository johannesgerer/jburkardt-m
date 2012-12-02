function value = dvec_to_i4 ( n, dvec )

%*****************************************************************************80
%
%% DVEC_TO_I4 makes an integer from a (signed) decimal vector.
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
%    Input, integer N, the dimension of the vector.
%
%    Input, integer DVEC(N), the decimal representation.
%
%    Output, integer VALUE, the integer.
%
  base = 10;
  dvec2(1:n) = dvec(1:n);

  i_sign = 1;

  if ( dvec2(n) == base - 1 )
    i_sign = -1;
    dvec2(1:n-1) = dvec_complementx ( n-1, dvec2 );
  end

  value = 0;
  for j = n-1 : -1 : 1
    value = base * value + dvec2(j);
  end

  value = i_sign * value;

  return
end
