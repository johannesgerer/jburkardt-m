%% FEM2D_BATCH_LOCAL uses the BATCH command to run the FEM2D code locally.
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
  clear

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_BATCH_LOCAL:\n' );
  fprintf ( 1, '  Run FEM2D_SCRIPT locally and indirectly.\n' );
%
%  BATCH sends the script for execution.
%
  job = batch ( 'fem2d_script', ...
    'Configuration', 'local', ...
    'CaptureDiary', true, ...
    'FileDependencies', { 'fem2d_fun', 'assemb_co', 'boundary', 'extract',  ...
       'p_data', 'source', 'steps', 'oned_f_int', 'oned_gauss', ...
       'twod_bilinear', 'twod_f_int', 'twod_gauss', 'twod_shape' },  ...
    'matlabpool', 4 );
%
%  WAIT pauses the MATLAB session til the job completes.
%
  wait ( job );
%
%  DIARY displays any output printed while the job ran.
%
  diary ( job );
%
%  LOAD loads the workspace from the job.
%
  load ( job );
%
%  DESTROY destroys data associated with the job.
%
  destroy ( job );
%
%  Generate a surface plot
%
  xx = x(1:param.nodesx, 1);
  yy = x(1:param.nodesx:param.nodesx*param.nodesy, 2);

  figure
  surf ( xx, yy, reshape(z_ss, param.nodesx, param.nodesy)' );
  xlabel ('\bf x' );
  ylabel ('\bf y' );
  zlabel ('\bf T' )
  title ( 'Steady state temperature solution from FEM2D\_BATCH\_LOCAL' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_BATCH_LOCAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );