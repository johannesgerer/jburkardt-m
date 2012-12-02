function fem_50 ( )

%*****************************************************************************80
%
%% FEM_50 applies the finite element method to Laplace's equation.
%
%  Discussion:
%
%    FEM_50 is a set of MATLAB routines to apply the finite
%    element method to solving Laplace's equation in an arbitrary
%    region, using about 50 lines of MATLAB code.
%    
%    FEM_50 is partly a demonstration, to show how little it
%    takes to implement the finite element method (at least using
%    every possible MATLAB shortcut.)  The user supplies datafiles
%    that specify the geometry of the region and its arrangement
%    into triangular and quadrilateral elements, and the location
%    and type of the boundary conditions, which can be any mixture
%    of Neumann and Dirichlet.
%    
%    The unknown state variable U(x,y) is assumed to satisfy
%    Laplace's equation:
%      -Uxx(x,y) - Uyy(x,y) = F(x,y) in Omega
%    with Dirichlet boundary conditions
%      U(x,y) = U_D(x,y) on Gamma_D
%    and Neumann boundary conditions on the outward normal derivative:
%      Un(x,y) = G(x,y) on Gamma_N
%    If Gamma designates the boundary of the region Omega,
%    then we presume that
%      Gamma = Gamma_D + Gamma_N
%    but the user is free to determine which boundary conditions to
%    apply.  Note, however, that the problem will generally be singular
%    unless at least one Dirichlet boundary condition is specified.
%    
%    The code uses piecewise linear basis functions for triangular elements,
%    and piecewise isoparametric bilinear basis functions for quadrilateral
%    elements.
%    
%    The user is required to supply a number of data files and MATLAB
%    functions that specify the location of nodes, the grouping of nodes
%    into elements, the location and value of boundary conditions, and 
%    the right hand side function in Laplace's equation.  Note that the
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
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_50:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  A program to demonstrate the finite element method.\n' );
%
%  Read the nodal coordinate data file.
%
  load coordinates.dat;
%
%  Read the triangular element data file.
%
  load elements3.dat;
%
%  Read the quadrilateral element data file.
%
  load elements4.dat;
%
%  Read the Neumann boundary condition data file.
%  I THINK the purpose of the EVAL command is to create an empty NEUMANN array
%  if no Neumann file is found.
%
  eval ( 'load neumann.dat;', 'neumann=[];' );
%
%  Read the Dirichlet boundary condition data file.
%
  load dirichlet.dat;

  A = sparse ( size(coordinates,1), size(coordinates,1) );
  b = sparse ( size(coordinates,1), 1 );
%
%  Assembly.
%
  for j = 1 : size(elements3,1)
    A(elements3(j,:),elements3(j,:)) = A(elements3(j,:),elements3(j,:)) ...
      + stima3(coordinates(elements3(j,:),:));
  end

  for j = 1 : size(elements4,1)
    A(elements4(j,:),elements4(j,:)) = A(elements4(j,:),elements4(j,:)) ...
      + stima4(coordinates(elements4(j,:),:));
  end
%
%  Volume Forces.
%
  for j = 1 : size(elements3,1)
    b(elements3(j,:)) = b(elements3(j,:)) ...
      + det( [1,1,1; coordinates(elements3(j,:),:)'] ) * ...
      f(sum(coordinates(elements3(j,:),:))/3)/6;
  end

  for j = 1 : size(elements4,1)
    b(elements4(j,:)) = b(elements4(j,:)) ...
      + det([1,1,1; coordinates(elements4(j,1:3),:)'] ) * ...
      f(sum(coordinates(elements4(j,:),:))/4)/4;
  end
%
%  Neumann conditions.
%
  if ( ~isempty(neumann) )
    for j = 1 : size(neumann,1)
      b(neumann(j,:)) = b(neumann(j,:)) + ...
        norm(coordinates(neumann(j,1),:) - coordinates(neumann(j,2),:)) * ...
        g(sum(coordinates(neumann(j,:),:))/2)/2;
    end
  end
%
%  Determine which nodes are associated with Dirichlet conditions.
%  Assign the corresponding entries of U, and adjust the right hand side.
%
  u = sparse ( size(coordinates,1), 1 );
  BoundNodes = unique ( dirichlet );
  u(BoundNodes) = u_d ( coordinates(BoundNodes,:) );
  b = b - A * u;
%
%  Compute the solution by solving A * U = B for the remaining unknown values of U.
%
  FreeNodes = setdiff ( 1:size(coordinates,1), BoundNodes );

  u(FreeNodes) = A(FreeNodes,FreeNodes) \ b(FreeNodes);
%
%  Graphic representation.
%
  show ( elements3, elements4, coordinates, full ( u ) );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_50:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
