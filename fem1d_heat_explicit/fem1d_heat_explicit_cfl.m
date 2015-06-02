function cfl = fem1d_heat_explicit_cfl ( x_num, k, x, dt )

%*****************************************************************************80
%
%% FEM1D_HEAT_EXPLICIT_CFL: compute the Courant-Friedrichs-Loewy coefficient.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 January 2012
%
%  Author:
% 
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Second Edition,
%    Prentice Hall, 1999,
%    ISBN: 0-13-012641-1,
%    LC: QA297.P45.
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real K(X_NUM,1), the heat conductivity coefficient.
%
%    Input, real NODE_X(X_NUM,1), the coordinates of the nodes.
%
%    Input, real DT, the time step.
%
%    Output, real CFL, the Courant-Friedrichs-Loewy coefficient.
%
  cfl = dt * max ( k(2:x_num-1,1) ...
    ./ ( 0.5 * ( x(3:x_num,1) - x(1:x_num-2,1) ) ).^2 );

  if ( 0.5 <= cfl )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FEM1D_HEAT_EXPLICIT_CFL - Fatal error!\n' );
    fprintf ( 1, '  CFL condition failed.\n' );
    fprintf ( 1, '  0.5 <= K * dT / dX / dX = %f\n', cfl );
    error ( 'FEM1D_HEAT_EXPLICIT_CFL - Fatal error!' );
  end

  return
end
