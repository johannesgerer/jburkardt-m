function felippa_test ( )

%*****************************************************************************80
%
%% FELIPPA_TEST tests FELIPPA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FELIPPA_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FELIPPA library.\n' );

  degree_max = 4;

  hexa_unit_monomial_test ( degree_max );
  line_unit_monomial_test ( degree_max );
  pyra_unit_monomial_test ( degree_max );
  quad_unit_monomial_test ( degree_max );
  tetr_unit_monomial_test ( degree_max );
  trig_unit_monomial_test ( degree_max );
  wedg_unit_monomial_test ( degree_max );

  degree_max = 6;
  hexa_unit_quad_test ( degree_max );

  degree_max = 10;
  line_unit_quad_test ( degree_max );

  degree_max = 5;
  pyra_unit_quad_test ( degree_max );

  degree_max = 10;
  quad_unit_quad_test ( degree_max );

  degree_max = 4;
  tetr_unit_quad_test ( degree_max );

  degree_max = 7;
  trig_unit_quad_test ( degree_max );

  degree_max = 8;
  wedg_unit_quad_test ( degree_max );

  wedg_unit_write_test ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FELIPPA_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
