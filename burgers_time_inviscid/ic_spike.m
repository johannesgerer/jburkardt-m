function ui = ic_spike ( x )

%*****************************************************************************80
%
%% IC_SPIKE evaluates the initial condition for a spike function.
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
  ui = max ( 1.0 - 3.0 * abs ( x ), 0.0 );

  return
end
