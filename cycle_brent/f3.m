function value = f3 ( i )

%*****************************************************************************80
%
%% F3 is the iteration function for example 3.
%
%  Discussion:
%
%    This function has a cycle of length 50000
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the argument of the function.
%
%    Output, integer VALUE, the value of the function.
%
  value = mod ( 123 * i + 456, 1000000 );

  return
end
