function [ x, z_ss ] = fem2d_fun ( param )

%*****************************************************************************80
%
%% FEM2D_FUN demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    The ASSEMB_CO function is called to assemble the finite element system
%    matrix as a distributed sparse matrix.
%
%    We would naturally prefer to apply a solution algorithm that could produce
%    the answer from the distributed version of the matrix, but this was not
%    yet supported at the time the code was written.  Therefore, we somewhat
%    inefficiently must gather the distributed pieces onto the client,
%    and solve the system there.
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
%    Gene Cliff
%
%  Parameters:
%
%    Input, structure PARAM, contains problem parameters.
%
%    Output, real X(), contains the X and Y coordinates of the nodes.
%
%    Output, real Z_SS(), the finite element coefficients that define the
%    estimated solution of the steady state heat equation over the domain.
%

%
%  Assemble the arrays using SPMD.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_FUN:\n' )
  fprintf ( 1, '  Build system matrices as distributed arrays.\n')

  [ M, F, b, x, e_conn ] = assemb_co ( param );
%
%  Compute the steady state solution using the ILU preconditioner
%  and the GMRES iterative solver.
%
  M_g  = gather ( M );
  Fb_g = gather ( F + b );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_FUN:\n' )
  fprintf ( 1, '  Solve linear system using ILU and GMRES.\n')

  setup.type = 'nofill';

  [ L U ] = ilu ( M_g, setup );

  z_ss = gmres ( M_g, Fb_g, 200, 1.0e-06, 10, L, U );

  return
end
