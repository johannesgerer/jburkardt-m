function x = p08_start ( option, nvar )

%*****************************************************************************80
%
%% P08_START returns a starting point for problem 8.
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

  [ ival1, ival2, val1, val2 ] = p08_hx ( option );

  x(ival1) = val1;
  x(ival2) = val2;

  return
end
