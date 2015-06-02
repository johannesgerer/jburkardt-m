function c = i4_division ( a, b )

%*****************************************************************************80
%
%% I4_DIVISION returns the result of integer division.
%
%  Discussion:
%
%    This routine computes C = A / B, where the result is rounded to the
%    integer value nearest 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the number to be divided,
%    and the divisor.
%
%    Output, integer C, the rounded result of the division.
%
  if ( a * b < 0.0 )
    s = -1;
  else
    s = +1;
  end

  a = abs ( a );
  b = abs ( b );
  c = s * floor ( a / b );

  return
end

