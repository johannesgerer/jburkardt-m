function value = f5 ( i )

%*****************************************************************************80
%
%% F5 is the iteration function for example 4.
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
  value = mod ( 16383 * i + 1, 65536 );

  return
end
