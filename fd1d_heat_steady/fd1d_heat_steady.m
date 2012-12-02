function [ x, u ] = fd1d_heat_steady ( n, a, b, ua, ub, k, f )

%*****************************************************************************80
%
%% FD1D_HEAT_STEADY solves the steady 1D heat equation.
%
%  Discussion:
%
%    This program seeks a solution of the steady heat equation:
%
%      - d/dx ( K(X) dUdx ) = F(X)
%
%    over the interval [A,B] with boundary conditions
%
%      U(A) = UA,
%      U(B) = UB.
%
%    The code uses the finite difference method to approximate the
%    second derivative in space.  This results in a sparse linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of grid points.
%
%    Input, real A, B, the interval endpoints.
%
%    Input, real UA, UB, the values prescribed for U at the endpoints.
%
%    Input, function K(X), evaluates the thermal conductance at the N
%    points X.  Set K(X) = 1 if you don't care about this coefficient.
%
%    Input, function F(X), evaluates the heat source term at the N
%    points X.  Set F(X) = 0 if you don't want any heat sources.
%
%    Output, real X(N), the grid points.
%
%    Output, real U(N), the approximation to the solution at the grid points.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_HEAT_STEADY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Finite difference solution of \n' );
  fprintf ( 1, '  the steady 1D heat equation\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    - d/dx ( k(x) dUdx ) = F(x)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  for space interval A <= X <= B with boundary conditions\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    U(A) = UA\n' );
  fprintf ( 1, '    U(B) = UB\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A second order difference approximation is used.\n' );
%
%  Set the X values.
%
  dx = ( b - a ) / ( n - 1 );

  x = ( a : dx : b );
%
%  Set up the matrix.
%
  A = sparse ( n, n );

  A(1,1) = 1.0;
  rhs(1,1) = ua;

  for i = 2 : n - 1
    A(i,i-1) = - k(x(i)-0.5*dx)                    / dx / dx;
    A(i,i) =   ( k(x(i)-0.5*dx) + k(x(i)+0.5*dx) ) / dx / dx;
    A(i,i+1) =                  - k(x(i)+0.5*dx)   / dx / dx;
    rhs(i,1) = f(x(i));
  end

  A(n,n) = 1.0;
  rhs(n,1) = ub;
%
%  Solve the linear system.
%
  u = A \ rhs;
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_HEAT_STEADY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
