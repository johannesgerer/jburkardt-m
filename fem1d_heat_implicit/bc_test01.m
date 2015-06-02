function u = bc_test01 ( x_num, x, t, u )

%*****************************************************************************80
%
%% BC_TEST01 sets the boundary conditions for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of nodes.
%
%    Input, real  X(X_NUM,1), the coordinates of the points.
%
%    Input, real T, the current time.
%
%    Input, real U(X_NUM,1), the solution at time T.
%
%    Output, real U(X_NUM,1), the solution at time T, with
%    boundary conditions enforced.
%
  u(1,1)     = 90.0;
  u(x_num,1) = 70.0;

  return
end
