%% FEM2D_SCRIPT carries out the finite element assembly and solution procedures.
%
%  Discussion:
%
%    The BATCH command runs scripts, not functions.  So we have to write
%    this short script if we want to work with BATCH!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_SCRIPT\n' );
  fprintf ( 1, '  Call FEM2D_FUN to set up and solve the system.\n' );
%
%  Get the problem parameters.
%
  param = p_data ( );
%
%  Set up the mesh, the linear system, and solve.
%
  [ x, z_ss ] = fem2d_fun ( param );

