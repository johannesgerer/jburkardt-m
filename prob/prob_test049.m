function prob_test049 ( )

%*****************************************************************************80
%
%% TEST049 tests DIRICHLET_MIX_MEAN, DIRICHLET_MIX_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  comp_num = 2;
  elem_num = 3;
  sample_num = 1000;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST049\n' );
  fprintf ( 1, '  For the Dirichlet Mixture PDF:\n' );
  fprintf ( 1, '  DIRICHLET_MIX_SAMPLE samples;\n' );
  fprintf ( 1, '  DIRICHLET_MIX_MEAN computes the mean;\n' );

  a(1:3,1:2) = [ 0.250, 1.500; ...
                 0.500, 0.500; ...
                 1.250, 2.000 ];

  comp_weight(1:2) = [ 1.0, 2.0 ];

  check = dirichlet_mix_check ( comp_num, elem_num, a, comp_weight );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST049 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of elements ELEM_NUM =   %6d\n', elem_num );
  fprintf ( 1, '  Number of components COMP_NUM = %6d\n', comp_num );
  fprintf ( 1, '  PDF parameters A(ELEM,COMP):\n' );
  fprintf ( 1, '\n' );
  for elem_i = 1 : elem_num
    fprintf ( 1, '  %14f  %14f\n', a(elem_i,1:comp_num) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Component weights:\n' );
  fprintf ( 1, '\n' );
  for comp_i = 1 : comp_num
    fprintf ( 1, '  %6d  %14f\n', comp_i, comp_weight(comp_i) );
  end

  mean(1:elem_num) = dirichlet_mix_mean ( comp_num, elem_num, a, comp_weight );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean:\n' );
  fprintf ( 1, '\n' );

  for elem_i = 1 : elem_num
    fprintf ( 1, '  %6d  %14f\n', elem_i, mean(elem_i) );
  end

  for sample_i = 1 : sample_num
    [ x(1:elem_num,sample_i), comp, seed ] = dirichlet_mix_sample ( ...
      comp_num, elem_num, a, comp_weight, seed );
  end

  xmax(1:elem_num) = r8row_max ( elem_num, sample_num, x );

  xmin(1:elem_num) = r8row_min ( elem_num, sample_num, x );

  mean(1:elem_num) = r8row_mean ( elem_num, sample_num, x );

  variance(1:elem_num) = r8row_variance ( elem_num, sample_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size = %6d\n', sample_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Observed Min, Max, Mean, Variance:\n' );
  fprintf ( 1, '\n' );

  for elem_i = 1 : elem_num
    fprintf ( 1, '  %6d  %14f  %14f  %14f  %14f\n', elem_i, xmin(elem_i), ...
      xmax(elem_i), mean(elem_i), variance(elem_i) );
  end

  return
end
