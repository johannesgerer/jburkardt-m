function ui = ic_gaussian ( x )

%*****************************************************************************80
%
%% IC_GAUSSIAN evaluates the initial condition for a Gaussian.
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
  ui = exp ( - 2.0 * x.^2 );

  return
end
