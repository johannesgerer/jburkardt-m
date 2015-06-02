function e1 = fem2d_l1_error_serene ( nx, ny, x, y, u, exact )

%*****************************************************************************80
%
%% FEM2D_L1_ERROR_SERENE estimates the l1 error norm of a finite element solution.
%
%  Discussion:
%
%    We assume the finite element method has been used, over a product
%    region with NX*NY nodes and the serendipity element.
%
%    The coefficients U(1:NX,1:NY) have been computed, and a formula for the
%    exact solution is known.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 June 2014
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
%    Input, real U(*), the finite element coefficients.
%
%    Input, function EQ = EXACT(X,Y), returns the value of the exact
%    solution at the point (X,Y).
%
%    Output, real E1, the little l1 norm of the error.
%
  e1 = 0.0;
  k = 0;
  for j = 1 : ny
    if ( mod ( j, 2 ) == 1 )
      inc = 1;
    else
      inc = 2;
    end
    for i = 1 : inc : nx
      k = k + 1;
      e1 = e1 + abs ( u(k) - exact ( x(i), y(j) ) );
    end
  end
%
%  Average the error.
%
  e1 = e1 / k;

  return
end
