function asa266_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests DIRICHLET_MIX_SAMPLE, DIRICHLET_MIX_MEAN, DIRICHLET_MIX_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
  comp_num = 3;
  comp_max = comp_num;
  elem_num = 3;
  sample_num = 200;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  For a Dirichlet mixture distribution,\n' );
  fprintf ( 1, '  DIRICHLET_MIX_SAMPLE samples;\n' );
  fprintf ( 1, '  DIRICHLET_MIX_MEAN computes means;\n' );
  fprintf ( 1, '  DIRICHLET_MIX_VARIANCE computes variances.\n' );
%
%  Report.
%
  alpha(1,1) = 0.05;
  alpha(1,2) = 0.20;
  alpha(1,3) = 0.75;

  alpha(2,1) = 0.85;
  alpha(2,2) = 0.10;
  alpha(2,3) = 0.05;

  alpha(3,1) = 0.00;
  alpha(3,2) = 0.50;
  alpha(3,3) = 0.50;

  comp_weight(1:3) = [ 3.0, 2.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Component Weight\n' );
  fprintf ( 1, '\n' );
  for comp_i = 1 : comp_num
    fprintf ( 1, '  %4d  %12f\n', comp_i, comp_weight(comp_i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Component  Parameters Means Variances\n' );
  fprintf ( 1, '\n' );
  for comp_i = 1 : comp_num
    fprintf ( 1, '\n' );
    fprintf ( 1, '%d\n', comp_i );
    for elem_i = 1 : elem_num
      a(elem_i) = alpha(comp_i,elem_i);
    end
    mean = dirichlet_mean ( elem_num, a );
    variance = dirichlet_variance ( elem_num, a );
    for elem_i = 1 : elem_num
      fprintf ( 1, '  %4d  %12f  %12f  %2f\n', ...
        elem_i, alpha(comp_i,elem_i), mean(elem_i), variance(elem_i) );
    end
  end

  mean = dirichlet_mix_mean ( comp_max, comp_num, elem_num, alpha, comp_weight );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element  Mean\n' );
  fprintf ( 1, '\n' );
  for elem_i = 1 : elem_num
    fprintf ( 1, '  %4d  %12f\n', elem_i, mean(elem_i) );
  end
%
%  Sample the distribution.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of samples is %d\n', sample_num );

  for sample_i = 1 : sample_num

    [ comp_i, x, seed ] = dirichlet_mix_sample ( comp_max, comp_num, ...
      elem_num, alpha, comp_weight, seed );

    x_sample(sample_i,1:elem_num) = x(1:elem_num);

    comp_sample(sample_i) = comp_i;

  end
%
%  Print some results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'First few samples:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Sample  Component  X\n' );
  fprintf ( 1, '\n' );

  for sample_i = 1 : min ( sample_num, 10 )

    fprintf ( 1, '  %2d  %2d  %12f  %12f  %12f\n', ...
      sample_i, comp_sample(sample_i), x_sample(sample_i,1:elem_num) );

  end
%
%  Compute the observed averages.
%
  mean = r8col_mean ( sample_num, elem_num, x_sample );

  variance = r8col_variance ( sample_num, elem_num, x_sample );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Element  Observed mean, variance\n' );
  fprintf ( 1, '\n' );
  for elem_i = 1 : elem_num
    fprintf ( 1, '  %4d  %12f  %12f\n', ...
      elem_i, mean(elem_i), variance(elem_i) );
  end

  return
end
