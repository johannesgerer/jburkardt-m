function value = i4_divp ( i, j )

%*****************************************************************************80
%
%% I4_DIVP returns the smallest multiple of J greater than or equal to I.
%
%  Example:
%
%    I  J  VALUE
%
%    0  4    0
%    1  4    1
%    2  4    1
%    3  4    1
%    4  4    1
%    5  4    2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the number to be analyzed.
%
%    Input, integer J, the number, multiples of which will
%    be compared against I.  J may not be zero.
%
%    Output, integer VALUE, the smallest multiple of J that
%    is greater than or equal to I.
%
  if ( j ~= 0 )
    value = 1 + floor ( ( i - 1 ) / j );
  else
    value = 0;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_DIVP - Fatal error!\n' );
    fprintf ( 1, '  The input value of J was zero!\n' );
    error ( 'I4_DIVP - Fatal error!\n' );
  end

  return
end
