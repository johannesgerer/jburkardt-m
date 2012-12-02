function [ f, g, x0, y0 ] = line_exp2par_2d ( p1, p2 )

%*****************************************************************************80
%
%% LINE_EXP2PAR_2D converts a line from explicit to parametric form in 2D.
%
%  Discussion:
%
%    The explicit form of a line in 2D is:
%
%      ( P1, P2 ) = ( (X1,Y1), (X2,Y2) ).
%
%    The parametric form of a line in 2D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%
%    We normalize by choosing F*F+G*G=1 and 0 <= F.
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
%    Input, real P1(2,1), P2(2,1), two points on the line.
%
%    Output, real F, G, X0, Y0, the parametric parameters
%    of the line.
%
  x0 = p1(1,1);
  y0 = p1(2,1);

  f = p2(1,1) - p1(1,1);
  g = p2(2,1) - p1(2,1);

  norm = sqrt ( f * f + g * g );

  if ( norm ~= 0.0 )
    f = f / norm;
    g = g / norm;
  end

  if ( f < 0.0 )
    f = -f;
    g = -g;
  end

  return
end
