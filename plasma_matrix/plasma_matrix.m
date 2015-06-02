function [ J, F ] = plasma_matrix ( N )

%*****************************************************************************80
%
%% PLASMA_MATRIX computes the jacobian matrix and residual for a plasma.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Modified:
%
%    20 January 2014
%
%  Author:
%
%    James Cheung
%
%  Parameters:
%
%    Input, integer N, the number of nodes in the X and Y directions.
%
%    Output, real sparse J(N*N,N*N), the Jacobian matrix.
%
%    Output, real F(N*N,1), the residual vector.
%
%  Local parameters:
%
%    Local, real A, B, the left and right endpoints of the X and Y intervals.
%
%    Local, real H, the spacing between nodes.
%
%    Local, real N(N,N), 
%
%    Local, integer NUMNODES, the number of nodes.
%
%    Local, real X(N), the X coordinates of the grid.
%
%    Local, real Y(N), the Y coordinates of the grid.
%
  a = -10.0;
  b = +10.0;

  if ( nargin < 1 )
    N = 101;
  end

  x = linspace ( a, b, N )';
  y = x;
  h = x(2) - x(1);
%
%  Set up the plasma density.
%
  numNodes = N * N;
  n = zeros ( numNodes, 1 );
  phi = zeros ( numNodes, 1 );

  nr = 0.25;
  k = 0;

  for i = 1 : N
    for j = 1 : N

      k = k + 1;

      if ( abs ( x(i) ) < 5.0 && abs ( y(j) ) < 5.0 )
        n(k) = 1.0;
      else
        n(k) = nr;
      end

      phi(k) = log ( n(k) );

    end
  end
%
%  Compute the F vector and Jacobian matrix J.
%
%  Bottom
%
  F = zeros ( numNodes, 1 );
  J = spalloc ( numNodes, numNodes, 5*numNodes );

  F(1) = -4*phi(1)+2*phi(2)+2*phi(N+1) ...
    -h^2*exp(phi(1))+h^2*n(1);
  J(1,1) = -4-h^2*exp(phi(1));
  J(1,2) = 2;
  J(1,N+1) = 2;

  for i=2:N-1
    F(i) = phi(i-1)-4*phi(i)+phi(i+1)+2*phi(i+N) ...
      -h^2*exp(phi(i))+h^2*n(i);
    J(i,i-1) = 1;
    J(i,i) = -4-h^2*exp(phi(i));
    J(i,i+1) = 1;
    J(i,N+i) = 2;
  end

  F(N) = 2*phi(N-1)-4*phi(N)+2*phi(2*N) ...
    -h^2*exp(phi(N))+h^2*n(N);        
  J(N,N-1) = 2;
  J(N,N) = -4-h^2*exp(phi(N));
  J(N,N+N) = 2;
%
%  Middle
%
  for i=2:N-1

    z = (i-1)*N;

    F(z+1) = phi(z+1-N)-4*phi(z+1)+2*phi(z+2)+phi(z+1+N) ...
      - h^2*exp(phi(z+1)) + h^2*n(z+1);
    J(z+1,z-N+1) = 1;
    J(z+1,z+1) = -4-h^2*exp(phi(z+1));
    J(z+1,z+2) = 2;
    J(z+1,z+N+1) = 1;

    for j=2:N-1
      F(z+j) = phi(z+j-1)+phi(z+j-N)-4*phi(z+j)+phi(z+j+1)+phi(z+N+j) ...
        -h^2*exp(phi(z+j))+h^2*n(z+j);
      J(z+j,z-N+j) = 1;
      J(z+j,z+j-1) = 1;
      J(z+j,z+j) = -4-h^2*exp(phi(z+j));
      J(z+j,z+j+1) = 1;
      J(z+j,z+N+j) = 1;
    end

    F(z+N) = 2*phi(z+N-1)+phi(z)-4*phi(z+N)+phi(z+2*N) ...
      -h^2*exp(phi(z+N))+h^2*n(z+N);
    J(z+N,z) = 1;
    J(z+N,z+N-1) = 2;
    J(z+N,z+N) = -4-h^2*exp(phi(z+N));
    J(z+N,z+2*N) = 1;

  end
%
%  Top
%
  z = (N-1)*N;

  F(z+1) = 2*phi(z-N+1)-4*phi(z+1)+2*phi(z+2) ...
    - h^2*exp(phi(z+1))+h^2*n(z+1);
  J(z+1,z-N+1) = 2;
  J(z+1,z+1) = -4-h^2*exp(phi(z+1));
  J(z+1,z+2) = 2;

  for i=2:N-1
    F(z+i) = phi(z+i-1)+2*phi(z+i-N)-4*phi(z+i)+phi(z+i+1) ...
      -h^2*exp(phi(z+i))+h^2*n(z+i);
    J(z+i,z-N+i) = 2;
    J(z+i,z+i-1) = 1;
    J(z+i,z+i) = -4-h^2*exp(phi(z+i));
    J(z+i,z+i+1) = 1;
  end

  F(z+N) = 2*phi(z+N-1)+2*phi(z)-4*phi(z+N) ...
    -h^2*exp(phi(z+N))+h^2*n(z+N);
  J(z+N,z) = 2;
  J(z+N,z+N-1)=2;
  J(z+N,z+N) = -4-h^2*exp(phi(z+N));

  return
end
