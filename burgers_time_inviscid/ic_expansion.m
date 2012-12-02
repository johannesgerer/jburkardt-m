function ui = ic_expansion ( x )

%*****************************************************************************80
%
%% IC_EXPANSION evaluates the initial condition for an expansion wave.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(*), the node coordinates.
%
%    Output, real UI(*), the value of the initial condition at each node.
%
  ul = 0.5;
  ur = 1.0;

  ui = 1.0 - 0.5 * ( x <= 0.0 );

  return
end
