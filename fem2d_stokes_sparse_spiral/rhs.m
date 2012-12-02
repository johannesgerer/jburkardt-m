function [ u_rhs, v_rhs, p_rhs ] = rhs ( node_num, node_xy )

%*****************************************************************************80
%
%% RHS gives the right-hand side of the differential equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Output, real U_RHS(NODE_NUM), V_RHS(NODE_NUM), P_RHS(NODE_NUM), 
%    the right hand sides of the differential equations at the nodes.
%
  nu = constants ( );

  p_rhs(1:node_num) = 0.0;

  for i = 1 : node_num

    x = node_xy(1,i);
    y = node_xy(2,i);
        
    u_rhs(i) = - nu * ( d2g(x) * dg(y) +  g(x) * d3g(y) );
    v_rhs(i) = + nu * ( d3g(x) *  g(y) + dg(x) * d2g(y) );     
    
  end
  
  return
end
function y = g ( z )

  c = 0.8;
  y = ( 1 - z ).^2 .* ( 1 - cos ( c * pi * z ) );

  return
end
function y = dg ( z )

  c = 0.8;
  y = -2 *          ( 1 - z )    .* ( 1 - cos ( c * pi * z )) ...
    +      c * pi * ( 1 - z ).^2 .*       sin ( c * pi * z );

  return
end
function y = d2g ( z )

  c = 0.8;
  y = 2 *                          ( 1 - cos ( c * pi * z ) ) ...
    - 4 *  c * pi     * ( 1 - z )     .* sin ( c * pi * z )...
    +    ( c * pi )^2 * ( 1 - z ) .^2 .* cos ( c * pi * z );

  return
end
function y = d3g ( z )

  c = 0.8;
  y = 6 *   c * pi                   * sin ( c * pi * z )...
    - 6 * ( c * pi )^2 * ( 1 - z )   * cos ( c * pi * z )... 
    -     ( c * pi )^3 * ( 1 - z )^2 * sin ( c * pi * z );

  return
end
