function test_interp_1d_test03 ( )

%*****************************************************************************80
%
%% TEST_INTERP_1D_TEST03 plots each function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_1D_TEST03\n' );
  fprintf ( 1, '  Use P00_PLOT to plot each function.\n' );

  prob_num = p00_prob_num ( );
  
  fprintf ( 1, '\n' );

  for prob = 1 : prob_num

    p00_plot ( prob );

  end

  return
end
