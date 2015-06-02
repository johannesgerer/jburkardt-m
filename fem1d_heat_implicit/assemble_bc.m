function [ a, b ] = assemble_dirichlet ( x_num, x, t, bc_fun, a, b )

%*****************************************************************************80
%
%% ASSEMBLE_DIRICHLET modifies the linear system for Dirichlet boundary conditions.
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
%    Input, real X(X_NUM), the coordinates of nodes.
%
%    Input, real T, the current time.
%
%    Input, real BC_FUN(), a function to set the Dirichlet conditions.
%
%    Input, sparse real A(X_NUM,X_NUM), the coefficient matrix.
%
%    Input, real B(X_NUM), the right hand side.
%
%    Output, sparse real A(X_NUM,X_NUM), the adjusted matrix.
%
%    Output, real B(X_NUM), the adjusted right hand side.
%
  u = zeros ( x_num, 1 );
  u(1:x_num,1) = bc_fun ( x_num, x, t, u );

  a(1,1:x_num) = 0.0;
  a(1,1) = 1.0;
  b(1) = u(1);

  a(x_num,1:x_num) = 0.0;
  a(x_num,x_num) = 1.0;
  b(x_num) = u(x_num);

  return
end
