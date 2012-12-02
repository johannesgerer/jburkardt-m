%% MD_SCRIPT is a script to call MD_FUN.
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
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MD_SCRIPT:\n' );
  fprintf ( 1, '  Call MD_FUN to simulate a molecular dynamics problem.\n' );

  nd = 3;
  np = 1000;
  step_num = 100;
  dt = 0.1;

  tic
  [ pe, ke, e_lost ] = md_fun ( nd, np, step_num, dt );
  toc
