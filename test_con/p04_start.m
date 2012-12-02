function x = p04_start ( option, nvar )

%*****************************************************************************80
%
%% P04_START returns a starting point for problem 4.
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
  x(1:3) = [ 0.4, 3.0, 0.0 ]';

  return
end
