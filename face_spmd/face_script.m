%% FACE_SCRIPT is a script to run FACE_FUN.
%
%  Discussion:
%
%    Find the faces and nodes for a given boundary.
%
%    The boundary surface is a rectangular subset of a 'max' boundary
%    on a x' or 'y' or 'z' surface (Cartesian coordinates).
%
%    Grid is matrix with 'x', 'y' 'z' cordinates of the grid points in 3 columns.
%
%    e_conn is a 4 by n_elements array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2010
%
%  Author:
%
%    Gene Cliff, John Burkardt
%

%
%  Load the MAT file containing the grid coordinates as the variable
%  "Grid" and the element connectivity as the variable "e_conn".
%
  load GRID;
%
%  We will be looking for tetrahedrons which have one face lying
%  on a plane defining one side of the box.  To define this box
%  we must specify:
%
%  II, the index of the "I" variable which is constant on the plane.
%  If the constant variable is X, then II is 1, and so on.
%
%  VAL_II, the value of the constant "I" variable.
%
%  XJ_LB, XJ_UB, the upper and lower bounds for the "J" nonconstant variable.
%
%  XK_LB, XK_UB, the upper and lower bounds for the "K" nonconstant variable.
%
%  The "J" and "K" variables are the first and second variables to follow
%  the "I" variable, assuming that we are counting with wrap around.
%  There are thus three possibilities for I, J and K:
%
%    I  J  K
%   -- -- --
%    1  2  3
%    2  3  1
%    3  1  2
%
%  Our choices below specify that we are looking at the plane Z = 3.0,
%  and more specifically, the box in that plane for which
%  -1.0 <= X <= +1.0, and -1.0 <= Y <= +1.0.
%
  ii = 3;
  val_ii = 3.0;
  xj_lb = -1.0;
  xj_ub = +1.0;
  xk_lb = -1.0;
  xk_ub = +1.0;
%
%  Call FACE_FUN to compute a list of the triangular faces of the
%  tetrahedral elements which lie on the boundary plane.
%
  F_conn = face_fun ( Grid, e_conn, ii, val_ii, xj_lb, xj_ub, xk_lb, xk_ub );