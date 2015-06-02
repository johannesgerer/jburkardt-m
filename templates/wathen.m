function A = wathen ( nx, ny, k )

%*****************************************************************************80
%
%% WATHEN returns the Wathen matrix.
%
%  WATHEN  A = WATHEN(NX,NY) is a random N-by-N finite element matrix
%        where N = 3*NX*NY + 2*NX + 2*NY + 1.
%
%  Discussion:
%
%    A is precisely the "consistent mass matrix" for a regular NX-by-NY
%    grid of 8-node serendipity elements in 2 space dimensions.
%
%    A is symmetric positive definite for any (positive) values of 
%    the "density", RHO(NX,NY), which is chosen randomly in this routine.
%
%    In particular, if D=DIAG(DIAG(A)), then 
%      0.25 <= EIG(INV(D)*A) <= 4.5
%    for any positive integers NX and NY and any densities RHO(NX,NY).
%
%    This diagonally scaled matrix is returned by WATHEN(NX,NY,1).
%
%  Example:
%
%     NX = 3, NY = 2, 
%     NODE_NUM = 29
%
%    23  24  25  26  27  28  29
%    19      20      21      22
%    12  13  14  15  16  17  18
%     8       9      10      11
%     1   2   3   4   5   6   7
%
%  Modified:
%
%    24 March 2006
%
%  Reference: 
%
%    A J Wathen, 
%    Realistic eigenvalue bounds for the Galerkin mass matrix, 
%    IMA Journal of Numerical Analysis,
%    Volume 7, 1987, pages 449-457.
%
%  Parameters:
%
%    Input, integer NX, NY, the number of elements in the X and Y
%    directions.
%
%    Input (optiona), integer K,
%    0, the standard matrix is returned (default);
%    1, the diagonally scaled matrix is returned.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WATHEN - Fatal error!\n' );
    fprintf ( 1, '  Both arguments NX and NY must be specified.\n' );
    error ( 'WATHEN: Both arguments NX and NY must be specified.')
  end
  
  if ( nargin < 3 )
    k = 0; 
  end
%
%  Set up the 8 x 8 E matrix.
%
  e1 = [ 6, -6,  2, -8; ...
        -6, 32, -6, 20; ...
         2, -6,  6, -6; ...
        -8, 20, -6, 32 ];
  
  e2 = [ 3, -8,  2, -6; ...
        -8, 16, -8, 20; ...
         2, -8,  3, -8; ...
        -6, 20, -8, 16 ];
    
  e = [ e1,  e2; ...
        e2', e1 ] / 45.0;
    
  node_num = 3 * nx * ny + 2 * nx + 2 * ny + 1;
%
%  Assign a random value of density at every geometric point.
%
  rand ( 'state', sum ( 100 * clock ) )

  rho = 100.0 * rand ( nx, ny );

  A = zeros ( node_num, node_num );

  for j = 1 : ny
    for i = 1 : nx
%
%  For I = 1, J = 1, (element 1), we are computing
%  the node sequence 14, 13, 12, 8, 1, 2, 3, 9 that
%  defines element 1.
%
      node(1) = 3*j*nx+2*i+2*j+1;
      node(2) = node(1)-1;
      node(3) = node(2)-1;
      node(4) = (3*j-1)*nx+2*j+i-1;
      node(5) = 3*(j-1)*nx+2*i+2*j-3;
      node(6) = node(5)+1;
      node(7) = node(6)+1;
      node(8) = node(4)+1;

      em = e * rho(i,j);

      for krow = 1 : 8
        for kcol = 1 : 8
          A(node(krow),node(kcol)) = A(node(krow),node(kcol)) + em(krow,kcol);
        end
      end

    end
  end

  if ( k == 1 )
    A = diag ( diag(A) ) \ A;
  end

  return
end
