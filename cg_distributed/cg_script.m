%% CG_SCRIPT is a script to call CG_FUN.
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
%    01 April 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_SCRIPT\n' );
  fprintf ( 1, '  Run the conjugate gradient example.\n' );

  [ zeta, x ] = cg_fun ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_SCRIPT\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
