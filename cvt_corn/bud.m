function [ nb, ni, np, p_xy, p_type ] = bud ( pr_bud, pr_bud_angular, ...
  r, nb, ni, np, p_xy, p_type )

%*****************************************************************************80
%
%% BUD carries out the budding process.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PR_BUD, the probability that a boundary point will bud.
%
%    Input, real PR_BUD_ANGULAR, the probability that a boundary point bud
%    will be constrained to the boundary.
%
%    Input, real R, the radius of the circle.
%
%    Input, integer NB, the updated number of boundary points.
%
%    Input, integer NI, the updated number of interior points.
%
%    Input, integer NP, the total number of points.
%
%    Input, real P_XY(2,NP), the point coordinates.
%
%    Input, integer P_TYPE(NP),
%    1, the point is constrained to the circle.
%    2, the point is constrainted to the disk.
%
%    Output, integer NB, the updated number of boundary points.
%
%    Output, integer NI, the updated number of interior points.
%
%    Output, integer NP, the updated total number of points.
%
%    Output, real P_XY(2,NP), the point coordinates.
%
%    Output, integer P_TYPE(NP),
%    1, the point is constrained to the circle.
%    2, the point is constrainted to the disk.
%    -1, the point is a new point, constrained to the circle.
%    -2, the point is a new point, constrained to the disk.
%
  r1 = rand ( 1, np );
  r2 = rand ( 1, np );

  b = find ( p_type == 1 & r1 <= pr_bud & r2 <= pr_bud_angular );
  i = find ( p_type == 1 & r1 <= pr_bud & pr_bud_angular < r2 );

  nb_inc = length ( b );
  ni_inc = length ( i );

  b_xy = bud_angular ( nb_inc, p_xy(1:2,b) );
  b_type(1:nb_inc) = -1;

  i_xy = bud_radial ( ni_inc, p_xy(1:2,i) );
  i_type(1:ni_inc) = -2;

  p_xy = [ b_xy, p_xy, i_xy ];
  p_type = [ b_type, p_type, i_type ];

  nb = nb + nb_inc;
  ni = ni + ni_inc;
  np = nb + ni;

% fprintf ( 1, 'BUD: size(P_XY)=%d,%d\n', size(p_xy) );
% fprintf ( 1, '     NB = %d, NI = %d, NP = %d\n', nb, ni, np );

  return
end

