%% FACE_POOL runs the example interactively with MATLABPOOL.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FACE_POOL\n' );
  fprintf ( 1, '  Evaluate FACE_FUN directly with MATLABPOOL.\n' );
%
%  Load the MAT file containing the grid coordinates as the variable
%  "Grid" and the element connectivity as the variable "e_conn".
%
  load GRID
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
%  Get 4 "labs" to work on the job.
%
  matlabpool open local 4
  F_conn = face_fun ( Grid, e_conn, ii, val_ii, xj_lb, xj_ub, xk_lb, xk_ub );
  matlabpool close

  face_num = size ( F_conn, 2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of triangles on boundary is %d\n', face_num );
%
%  Display the surface triangulation.
%
  i_pl = setdiff ( 1:3, ii );

  triplot ( F_conn', Grid(:, i_pl(1)), Grid(:, i_pl(2)) );

  if ( ii == 1 )
    title ( 'Triangular faces on X boundary plane' );
    xlabel ( '- Y axis -' );
    ylabel ( '- Z axis -' );
  elseif ( ii == 2 )
    xlabel ( '- X axis -' );
    title ( 'Triangular faces on Y boundary plane' );
    ylabel ( '- Z axis -' );
  elseif ( ii == 3 )
    xlabel ( '- X axis -' );
    ylabel ( '- Y axis -' );
    title ( 'Triangular faces on Z boundary plane' );
  end

  axis equal
  axis tight


