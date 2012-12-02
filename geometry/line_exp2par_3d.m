function [ f, g, h, x0, y0, z0 ] = line_exp2par_3d ( p1, p2 )

%*****************************************************************************80
%
%% LINE_EXP2PAR_3D converts a line from explicit to parametric form in 3D.
%
%  Discussion:
%
%    The explicit form of a line in 3D is:
%
%      ( P1, P2 ) = ( (X1,Y1,Z1), (X2,Y2,Z2) ).
%
%    The parametric form of a line in 3D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%      Z = Z0 + H * T
%
%    We normalize by choosing F*F+G*G+H*H=1 and 0 <= F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), two points on the line.
%
%    Output, real F, G, H, X0, Y0, Z0, the parametric parameters
%    of the line.
%
  x0 = p1(1,1);
  y0 = p1(2,1);
  z0 = p1(3,1);

  f = p2(1,1) - p1(1,1);
  g = p2(2,1) - p1(2,1);
  h = p2(3,1) - p1(3,1);

  norm = sqrt ( f * f + g * g + h * h );

  if ( norm ~= 0.0 )
    f = f / norm;
    g = g / norm;
    h = h / norm;
  end

  if ( f < 0.0 )
    f = -f;
    g = -g;
    h = -h;
  end

  return
end
