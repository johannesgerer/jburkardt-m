function monomial_test ( )

%*****************************************************************************80
%
%% MONOMIAL_TEST tests the MONOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the MONOMIAL library.\n' );

  mono_between_enum_test ( );
  mono_between_next_grevlex_test ( );
  mono_between_next_grlex_test ( );
  mono_between_random_test ( );

  mono_next_grevlex_test ( );
  mono_next_grlex_test ( );
  mono_print_test ( );
  mono_rank_grlex_test ( );

  mono_total_enum_test ( );
  mono_total_next_grevlex_test ( );
  mono_total_next_grlex_test ( );
  mono_total_random_test ( );

  mono_unrank_grlex_test ( );

  mono_upto_enum_test ( );
  mono_upto_next_grevlex_test ( );
  mono_upto_next_grlex_test ( );
  mono_upto_random_test ( );

  mono_value_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

