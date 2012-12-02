%% SATISFY_SCRIPT is a script to call SATISFY_FUN.
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
  fprintf ( 1, 'SATISFY_SCRIPT:\n' );
  fprintf ( 1, '  Call SATISFY_FUN for 0/1 variable assignments that satisfy a formula.\n' );

  tic
  solutions = satisfy_fun ( );
  toc


