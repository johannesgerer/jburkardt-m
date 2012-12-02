%% HIGH_CARD_POOL uses the MATLABPOOL command to execute the HIGH_CARD_FUN function.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
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
  fprintf ( 1, 'HIGH_CARD_POOL\n' );
  fprintf ( 1, '  Call HIGH_CARD_FUN to estimate the game statistics.\n' );

  matlabpool open local 4

  tic
  p = high_card_fun ( m, n );
  toc

  matlabpool close
%
%  Plot the results.
%
  high_card_display ( m, p );
