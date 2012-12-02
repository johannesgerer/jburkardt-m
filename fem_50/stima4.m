function M = stima4 ( vertices )

%*****************************************************************************80
%
%% STIMA4 determines the local stiffness matrix for a quadrilateral element.
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
%    Input, real VERTICES(1:4,1:2), contains the coordinates of the vertices.
%
%    Output, real M(1:4,1:4), the local stiffness matrix for the element.
%
  D_Phi = [ vertices(2,:) - vertices(1,:); vertices(4,:) - vertices(1,:) ]';

  B = inv ( D_Phi' * D_Phi );

  C1 =  [  2, -2; -2,  2 ] * B(1,1) ...
      + [  3,  0;  0, -3 ] * B(1,2) ...
      + [  2,  1;  1,  2 ] * B(2,2);

  C2 =  [ -1,  1;  1, -1 ] * B(1,1) ...
      + [ -3,  0;  0,  3 ] * B(1,2) ...
      + [ -1, -2; -2, -1 ] * B(2,2);

  M = det ( D_Phi ) * [ C1 C2; C2 C1 ] / 6;

  return
end
