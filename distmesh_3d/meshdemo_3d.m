function meshdemo_3d ( )

%*****************************************************************************80
%
%% MESHDEMO_3D displays some 3D examples of the use of DISTMESH.
%
%  Modified:
%
%    12 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Local parameters:
%
%    Local, integer ITERATION_MAX, the maximum number of iterations that DISTMESH
%    should take.  (The program might take fewer iterations if it detects convergence.)
%
%    Local, real H, the desired initial spacing.  If a uniform mesh density is used,
%    this is the approximate spacing throughout the region.
%
%    Local, pointer FH, an inline formula, or the name of an M file, which calculates
%    the mesh density function.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHDEMO_3D\n' );
  fprintf ( 1, '  Demonstrations of the use of DISTMESH_3D.\n' );
%
%  Problem 1.
%
  iteration_max = 200;
  h = 0.40;
  fh = @fh01;
  meshdemo_3d_01 ( iteration_max );

  disp ( sprintf ( '   (press any key)' ) )
  disp ( ' ' )
  pause
%
%  Problem 2.
%
  iteration_max = 200;
  h = 0.10;
  fh = @fh02;
  meshdemo_3d_02 ( iteration_max );

  disp ( sprintf ( '   (press any key)' ) )
  disp ( ' ' )
  pause
%
%  Problem 3.
%
  iteration_max = 200;
  h = 0.15;
  fh = @fh03;
  meshdemo_3d_03 ( iteration_max );

  disp ( sprintf ( '   (press any key)' ) )
  disp ( ' ' )
  pause
%
%  Problem 4.
%
  iteration_max = 200;
  h = 0.1;
  fh = @fh04;
  meshdemo_3d_04 ( iteration_max );

  disp ( sprintf ( '   (press any key)' ) )
  disp ( ' ' )
  pause
%
%  Problem 5.
%
  iteration_max = 200;
  h = 0.1;
  fh = @fh05;
  meshdemo_3d_05 ( iteration_max );

  disp ( sprintf ( '   (press any key)' ) )
  disp ( ' ' )
  pause

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHDEMO_3D\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
