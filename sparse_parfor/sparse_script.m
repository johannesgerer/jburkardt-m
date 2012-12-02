%% SPARSE_SCRIPT is a script to call SPARSE_FUN.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_SCRIPT\n' );
  fprintf ( 1, '  Call SPARSE_FUN to estimate the game statistics.\n' );

  tic
  A_sparse = sparse_fun ( );
  toc

