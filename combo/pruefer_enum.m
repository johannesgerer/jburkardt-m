function ncode = pruefer_enum ( n )

%*****************************************************************************80
%
%% PRUEFER_ENUM enumerates the Pruefer codes on N-2 digits.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of digits in the code, plus 2.
%    N must be at least 3.
%
%    Output, integer NCODE, the number of distinct elements.
%
  ncode = n^( n - 2 );

  return
end
