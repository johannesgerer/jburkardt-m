function x = p09_start ( option, nvar )

%*****************************************************************************80
%
%% P09_START returns a starting point for problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Output, real X(NVAR), the starting point.
%
  x = zeros ( nvar, 1 );

  [ height, ival, val ] = p09_gx ( option );

  x(ival) = val;

  return
end
