function fem_50_heat ( )

%*****************************************************************************80
%
%% FEM_50_HEAT applies the finite element method to the heat equation.
%
%  Discussion:
%
%    FEM_50_HEAT is a set of MATLAB routines to apply the finite
%    element method to the heat equation in an arbitrary
%    region, using about 50 lines of MATLAB code.
%    
%    FEM_50 is partly a demonstration, to show how little it
%    takes to implement the finite element method (at least using
%    every possible MATLAB shortcut.)  The user supplies datafiles
%    that specify the geometry of the region and its arrangement
%    into triangular elements, and the location and type of the 
%    boundary conditions, which can be any mixture of Neumann and 
%    Dirichlet, and the initial condition for the solution.
% 
%    Note that the current version of FEM_50_HEAT only uses
%    triangular elements.
%
%    The unknown state variable U(x,y,t) is assumed to satisfy
%    the time dependent heat equation:
%
%      dU(x,y,t)/dt = Uxx(x,y,t) + Uyy(x,y,t) + F(x,y,t) in Omega x [0,T]
%
%    with initial conditions
%
%      U(x,y,0) = U_INIT(x,y,0)
%
%    with Dirichlet boundary conditions
%
%      U(x,y,t) = U_D(x,y,t) on Gamma_D
%
%    and Neumann boundary conditions on the outward normal derivative:
%
%      Un(x,y) = G(x,y,t) on Gamma_N
%
%    If Gamma designates the boundary of the region Omega,
%    then we presume that
%
%      Gamma = Gamma_D + Gamma_N
%
%    but the user is free to determine which boundary conditions to
%    apply.  Note, however, that the problem will generally be singular
%    unless at least one Dirichlet boundary condition is specified.
%    
%    The code uses piecewise linear basis functions for triangular elements.
%    
%    The user is required to supply a number of data files and MATLAB
%    functions that specify the location of nodes, the grouping of nodes
%    into elements, the location and value of boundary conditions, and 
%    the right hand side function in the heat equation.  Note that the
%    fact that the geometry is completely up to the user means that
%    just about any two dimensional region can be handled, with arbitrary
%    shape, including holes and islands.
%    
%  Modified:
%
%    29 March 2004
%
%  Author:
%
%    Jochen Alberty, Carsten Carstensen, Stefan Funken.
%
%  Reference:
%
%    Jochen Alberty, Carsten Carstensen, Stefan Funken,
%    Remarks Around 50 Lines of MATLAB:
%    Short Finite Element Implementation,
%    Numerical Algorithms,
%    Volume 20, pages 117-137, 1999.
%
%  Local Parameters:
%
%    Local, real DT, the size of a single time step.
%
%    Local, integer NT, the number of time steps to take.
%
%    Local, real T, the current time.
%
%    Local, real T_FINAL, the final time.
%
%    Local, real T_START, the initial time.
%
  timestamp ( )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_50_HEAT:\n' );
  fprintf ( 1, '  A routine to solve the time dependent heat equation.\n' );
  fprintf ( 1, '  using about 50 lines of MATLAB.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This code was written by\n' );
  fprintf ( 1, '  Jochen Alberty, Carsten Carstensen and Stefan Funken.\n' );
%
%  Read the nodal coordinate data file.
%
  load coordinates.txt;
%
%  Read the triangular element data file.
%
  load elements3.txt;
%
%  Read the Neumann boundary condition data file.
%  I THINK the purpose of the EVAL command is to create an empty NEUMANN array
%  if no Neumann file is found.
%
  eval ( 'load neumann.txt;', 'neumann=[];' );
%
%  Read the Dirichlet boundary condition data file.
%  There must be at least one Dirichlet boundary condition.
%
  load dirichlet.txt;
%
%  Determine the bound and free nodes.
%
  BoundNodes = unique ( dirichlet );
  FreeNodes = setdiff ( 1:size(coordinates,1), BoundNodes );

  A = sparse ( size(coordinates,1), size(coordinates,1) );
  B = sparse ( size(coordinates,1), size(coordinates,1) );

  t_start = 0.0;
  t_final = 1.0;
  nt = 100;

  t = t_start;
  dt = ( t_final - t_start ) / nt;

  U = zeros ( size(coordinates,1), nt+1 );
%
%  Assembly.
%
  for j = 1 : size(elements3,1)
    A(elements3(j,:),elements3(j,:)) = A(elements3(j,:),elements3(j,:)) ...
      + stima3(coordinates(elements3(j,:),:));
  end

  for j = 1 : size(elements3,1)
    B(elements3(j,:),elements3(j,:)) = B(elements3(j,:),elements3(j,:)) ...
      + det ( [1,1,1; coordinates(elements3(j,:),:)' ] )...
      * [ 2, 1, 1; 1, 2, 1; 1, 1, 2 ] / 24;
  end
%
%  Set the initial condition.
%
  U(:,1) = u_init ( coordinates, t );
%
%  Given the solution at step I-1, compute the solution at step I.
%
  for i = 1 : nt

    t = ( ( nt - i ) * t_start   ...
        + (      i ) * t_final ) ...
        /   nt;

    b = sparse ( size(coordinates,1), 1 );

    u = sparse ( size(coordinates,1), 1 );
%
%  Account for the volume forces, evaluated at the new time T.
%
    for j = 1 : size(elements3,1)
      b(elements3(j,:)) = b(elements3(j,:)) ...
        + det( [1,1,1; coordinates(elements3(j,:),:)'] ) * ...
        dt * f ( sum(coordinates(elements3(j,:),:))/3, t ) / 6;
    end
%
%  Account for the Neumann conditions, evaluated at the new time T.
%
    for j = 1 : size(neumann,1)
      b(neumann(j,:)) = b(neumann(j,:)) + ...
        norm(coordinates(neumann(j,1),:) - coordinates(neumann(j,2),:)) * ...
        dt * g ( sum(coordinates(neumann(j,:),:))/2, t ) / 2;
    end
%
%  Account for terms that involve the solution at the previous timestep.
%
    b = b + B * U(:,i);
%
%  Use the Dirichlet conditions, evaluated at the new time T, to eliminate the
%  known state variables.
%
    u(BoundNodes) = u_d ( coordinates(BoundNodes,:), t );

    b = b - ( dt * A  + B ) * u;
%
%  Compute the remaining unknowns by solving ( dt * A + B ) * U = b.
%
    u(FreeNodes) = ( dt * A(FreeNodes,FreeNodes) + B(FreeNodes,FreeNodes) ) ...
      \ b(FreeNodes);

    U(:,i+1) = u;
  
  end

  show ( elements3, coordinates, U, nt, t_start, t_final );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_50_HEAT:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

