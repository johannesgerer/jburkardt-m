function cube_felippa_rule_test ( )

%*****************************************************************************80
%
%% CUBE_FELIPPA_RULE_TEST tests the CUBE_FELIPPA_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 September 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CUBE_FELIPPA_RULE library.\n' );

  degree_max = 4;
  cube_monomial_test ( degree_max );

  degree_max = 6;
  cube_quad_test ( degree_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CUBE_FELIPPA_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
