function compass_search_test ( )

%*****************************************************************************80
%
%% COMPASS_SEARCH_TEST tests COMPASS_SEARCH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPASS_SEARCH_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the COMPASS_SEARCH library.\n' );

  beale_test ( );
  bohach1_test ( );
  bohach2_test ( );
  broyden_test ( );
  extended_rosenbrock_test ( );
  goldstein_price_test ( );
  himmelblau_test ( );
  local_test ( );
  mckinnon_test ( );
  powell_test ( );
  rosenbrock_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPASS_SEARCH_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
