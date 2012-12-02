%% FEM2D_POOL uses the MATLABPOOL command to run the FEM2D code interactively.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_POOL:\n' );
  fprintf ( 1, '  Run FEM2D_SCRIPT locally and interactively\n' );

  matlabpool open local 4

  fem2d_script

  matlabpool close
%
%  Generate a surface plot
%
  xx = x(1:param.nodesx, 1);
  yy = x(1:param.nodesx:param.nodesx*param.nodesy, 2);

  figure
  surf ( xx, yy, reshape ( z_ss, param.nodesx, param.nodesy )' );
  xlabel ( '\bf x' );
  ylabel ( '\bf y' );
  zlabel ( '\bf T' );
  title ( 'Steady state temperature solution from FEM2D\_POOL' );
