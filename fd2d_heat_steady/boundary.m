function [ A, rhs ] = boundary ( nx, ny, x, y, A, rhs )

%*****************************************************************************80
%
%% BOUNDARY sets up the matrix and right hand side at boundary nodes.
%
%  Discussion:
%
%    For this simple problem, the boundary conditions specify that the solution
%    is 10 on the left size, 100 on the right side, and 0 on the top and bottom.
%
%    Nodes are assigned a single index K, which increases as:
%
%    (NY-1)*NX+1  (NY-1)*NX+2  ...  NY * NX
%           ....         ....  ...    .....
%           NX+1         NX+2  ...   2 * NX
%              1            2  ...       NX
%
%    The index K of a node on the lower boundary satisfies:
%      1 <= K <= NX
%    The index K of a node on the upper boundary satisfies:
%      (NY-1)*NX+1 <= K <= NY * NX
%    The index K of a node on the left boundary satisfies:
%      mod ( K, NX ) = 1
%    The index K of a node on the right boundary satisfies:
%      mod ( K, NX ) = 0
%
%    If we number rows from bottom I = 1 to top I = NY
%    and columns from left J = 1 to right J = NX, then the relationship
%    between the single index K and the row and column indices I and J is:
%      K = ( I - 1 ) * NX + J
%    and
%      J = 1 + mod ( K - 1, NX )
%      I = 1 + ( K - J ) / NX
%      
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the number of grid points in X and Y.
%
%    Input, real X(NX), Y(NY), the coordinates of grid lines.
%
%    Input, real sparse A(N,N), the system matrix, with the entries for the
%    interior nodes filled in.
%
%    Input, real RHS(N), the system right hand side, with the entries for the
%    interior nodes filled in.
%
%    Output, real sparse A(N,N), the system matrix, with the entries for all 
%    nodes filled in.
%
%    Output, real RHS(N), the system right hand side, with the entries for 
%    all nodes filled in.
%

%
%  Left boundary.
%
  j = 1;
  for i = 1 : ny
    kc = ( i - 1 ) * nx + j;
    xc = x(j);
    yc = y(i);
    A(kc,kc) = 1.0;
    rhs(kc,1) = 10.0;
  end
%
%  Right boundary.
%
  j = nx;
  for i = 1 : ny
    kc = ( i - 1 ) * nx + j;
    xc = x(j);
    yc = y(i);
    A(kc,kc) = 1.0;
    rhs(kc,1) = 100.0;
  end
%
%  Lower boundary.
%
  i = 1;
  for j = 1 : nx
    kc = ( i - 1 ) * nx + j;
    xc = x(j);
    yc = y(i);
    A(kc,kc) = 1.0;
    rhs(kc,1) = 0.0;
  end
%
%  Upper boundary.
%
  i = ny;
  for j = 1 : nx
    kc = ( i - 1 ) * nx + j;
    xc = x(j);
    yc = y(i);
    A(kc,kc) = 1.0;
    rhs(kc,1) = 0.0;
  end

  return
end