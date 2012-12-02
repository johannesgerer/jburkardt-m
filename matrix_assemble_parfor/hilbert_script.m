%% HILBERT_SCRIPT is a script to call HILBERT_FUN.
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
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  m = 100;
  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HILBERT_SCRIPT\n' );
  fprintf ( 1, '  Call HILBERT_FUN to set up the Hilbert matrix.\n', n );

  tic;
  a = hilbert_fun ( m, n );
  toc;



