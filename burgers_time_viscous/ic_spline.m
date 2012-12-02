function ui = ic_spline ( x )

%*****************************************************************************80
%
%% IC_SPLINE evaluates the initial condition as a spline through data.
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
  xk = [ -1.0, -0.8, -0.6, -0.4, -0.2, 0.0, 0.2, 0.4, 0.6,  0.8, 1.0 ];
  uk = [  0.0,  1.0,  0.0, -0.6,  0.1, 0.8, 0.7, 1.0, 0.2, -0.4, 0.0 ];

  pp = spline ( xk, uk );
  ui = ppval ( pp, x );

  return
end
