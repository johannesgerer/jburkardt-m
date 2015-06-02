function coordinate_search_test ( )

%*****************************************************************************80
%
%% COORDINATE_SEARCH_TEST tests the COORDINATE_SEARCH library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COORDINATE_SEARCH_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the COORDINATE_SEARCH library.\n' );

  beale_test ( );
  bohach1_test ( );
  bohach2_test ( );
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
  fprintf ( 1, 'COORDINATE_SEARCH_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
