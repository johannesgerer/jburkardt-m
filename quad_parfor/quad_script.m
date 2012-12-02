%% QUAD_SCRIPT is a script to call QUAD_FUN.
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
%    23 May 2012
%
%  Author:
%
%    John Burkardt
%
  n = 100000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SCRIPT\n' );
  fprintf ( 1, '  Call QUAD_FUN to estimate integral using %d points\n', n );

  tic
  value = quad_fun ( n );
  toc



