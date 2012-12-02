function M = stima3 ( vertices )

%*****************************************************************************80
%
%% STIMA3 determines the local stiffness matrix for a triangular element.
%
%  Discussion:
%
%    Although this routine is intended for 2D usage, the same formulas
%    work for tetrahedral elements in 3D.  The spatial dimension intended
%    is determined implicitly, from the spatial dimension of the vertices.
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
%    Input, real VERTICES(1:(D+1),1:D), contains the D-dimensional 
%    coordinates of the vertices.
%
%    Output, real M(1:(D+1),1:(D+1)), the local stiffness matrix 
%    for the element.
%
  d = size ( vertices, 2 );

  D_eta = [ ones(1,d+1); vertices' ] \ [ zeros(1,d); eye(d) ];

  M = det ( [ ones(1,d+1); vertices' ] ) * D_eta * D_eta' / prod ( 1:d );

  return
end
