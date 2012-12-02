%% HIGH_CARD_SCRIPT is a script to call HIGH_CARD_FUN.
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
  m = 100;
  n = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_SCRIPT\n' );
  fprintf ( 1, '  Call HIGH_CARD_FUN to estimate the game statistics.\n' );

  tic
  p = high_card_fun ( m, n );
  toc

