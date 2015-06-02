function e1 = fem2d_l1_error ( nx, ny, x, y, u, exact )

%*****************************************************************************80
%
%% FEM2D_L1_ERROR estimates the l1 error norm of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over a product
%    region with NX*NY nodes.
%
%    The coefficients U(1:NX,1:NY) have been computed, and a formula for the
%    exact solution is known.
%
%    This function estimates E1, the little l1 norm of the error:
%      E1 = sum ( 1 <= I <= NX, 1 <= J <= NY ) abs ( U(i,j) - EXACT(X(i),Y(J)) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the number of nodes in the X and Y directions.
%
%    Input, real X(NX), Y(NY), the X and Y grid values.
%
%    Input, real U(NX,NY), the finite element coefficients.
%
%    Input, function EQ = EXACT(X,Y), returns the value of the exact
%    solution at the point (X,Y).
%
%    Output, real E1, the little l1 norm of the error.
%
  e1 = 0.0;
  for j = 1 : ny
    for i = 1 : nx
      e1 = e1 + abs ( u(i,j) - exact ( x(i), y(j) ) );
    end
  end

  e1 = e1 / nx / ny;

  return
end
