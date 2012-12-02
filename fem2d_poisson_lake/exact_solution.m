function u = exact_solution ( xy_num, xy )

%*****************************************************************************80
%
%% DIRICHLET_CONDITION sets the value of a Dirichlet boundary condition.
%
%  Discussion:
%
%    The equation is
%
%      - Del H(X,Y) DEL U + K(X,Y) * U = RHS(X,Y)
%
%    This routine is set up for the lake region, with exact solution
%    U = ( X^2 + Y^2 ) / 500^2.
%
%    We use the exact solution to evaluate our boundary condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer XY_NUM, the number of evaluation points.
%
%    Input, real XY(2,XY_NUM), the coordinates of the evaluation points.
%
%    Output, real U(XY_NUM,1), the exact solution value.
%
  u(1:xy_num,1) = ( xy(1,1:xy_num).^2 ...
                  + xy(2,1:xy_num).^2 ) ...
                  / ( 500.0 * 500.0 );

  return
end

