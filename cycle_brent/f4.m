function value = f4 ( i )

%*****************************************************************************80
%
%% F4 is the iteration function for example 4.
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
  value = mod ( 31421 * i + 6927, 65536 );

  return
end
