function value = f01 ( n )

%*****************************************************************************80
%
%% F01 is a test function.
%
%  Discussion:
%
%    The polynomial has roots 1/2, 7/2, and 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument.
%
%    Output, integer VALUE, the function value.
%
  value = ( 2 * n - 7 ) * ( 2 * n - 1 ) * ( n - 10 );

  return
end
