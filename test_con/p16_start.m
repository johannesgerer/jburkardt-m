function x = p16_start ( option, nvar )

%*****************************************************************************80
%
%% P16_START returns a starting point for problem 16.
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

  x(1:nvar-1) = 1.0;
  x(nvar) = 0.0;

  return
end
