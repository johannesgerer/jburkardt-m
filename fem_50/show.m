function show ( elements3, elements4, coordinates, u )

%*****************************************************************************80
%
%% SHOW displays the solution of the finite element computation.
%
%  Modified:
%
%    23 February 2004
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
%  Parameters:
%
%    Input, integer ELEMENTS3(N3,3), the nodes that make up each triangle.
%
%    Input, integer ELEMENTS4(N4,4), the nodes that make up each quadrilateral.
%
%    Input, real COORDINATES(N,1:2), the coordinates of each node.
%
%    Input, real U(N), the finite element coefficients which represent the solution.
%    There is one coefficient associated with each node.
%
  hold off
%
%  Display the information associated with triangular elements.
%
  trisurf ( elements3, coordinates(:,1), coordinates(:,2), u' );
%
%  Retain the previous image, 
%  and overlay the information associated with quadrilateral elements.
%
  hold on
  trisurf ( elements4, coordinates(:,1), coordinates(:,2), u', ...
    'EdgeColor', 'interp', 'FaceColor', 'interp' );
%
%  Define the initial viewing angle.
%
  view ( -67.5, 30 );

  title ( 'Solution to the Problem' )

  return
end
