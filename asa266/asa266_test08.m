function asa266_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests DIRICHLET_ESTIMATE, DIRICHLET_MEAN, DIRICHLET_VARIANCE.
%
%  Discussion:
%
%    Canned data is used.
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
  elem_num = 3;
  sample_num = 23;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  For samples of a Dirichlet PDF,\n' );
  fprintf ( 1, '  DIRICHLET_ESTIMATE estimates the parameters.\n' );
  fprintf ( 1, '  DIRICHLET_MEAN finds the means;\n' );
  fprintf ( 1, '  DIRICHLET_VARIANCE finds the variances;\n' );
%
%  Set the data
%
  x = zeros ( elem_num, sample_num );

  x(1,1) = 0.178;
  x(1,2) = 0.346;
  x(1,3) = 0.476;

  x(2,1) = 0.162;
  x(2,2) = 0.307;
  x(2,3) = 0.531;

  x(3,1) = 0.083;
  x(3,2) = 0.448;
  x(3,3) = 0.469;

  x(4,1) = 0.087;
  x(4,2) = 0.474;
  x(4,3) = 0.439;

  x(5,1) = 0.078;
  x(5,2) = 0.503;
  x(5,3) = 0.419;

  x(6,1) = 0.040;
  x(6,2) = 0.456;
  x(6,3) = 0.504;

  x(7,1) = 0.049;
  x(7,2) = 0.363;
  x(7,3) = 0.588;

  x(8,1) = 0.100;
  x(8,2) = 0.317;
  x(8,3) = 0.583;

  x(9,1) = 0.075;
  x(9,2) = 0.394;
  x(9,3) = 0.531;

  x(10,1) = 0.084;
  x(10,2) = 0.445;
  x(10,3) = 0.471;

  x(11,1) = 0.060;
  x(11,2) = 0.435;
  x(11,3) = 0.505;

  x(12,1) = 0.089;
  x(12,2) = 0.418;
  x(12,3) = 0.493;

  x(13,1) = 0.050;
  x(13,2) = 0.485;
  x(13,3) = 0.465;

  x(14,1) = 0.073;
  x(14,2) = 0.378;
  x(14,3) = 0.549;

  x(15,1) = 0.064;
  x(15,2) = 0.562;
  x(15,3) = 0.374;

  x(16,1) = 0.085;
  x(16,2) = 0.465;
  x(16,3) = 0.450;

  x(17,1) = 0.094;
  x(17,2) = 0.388;
  x(17,3) = 0.518;

  x(18,1) = 0.014;
  x(18,2) = 0.449;
  x(18,3) = 0.537;

  x(19,1) = 0.060;
  x(19,2) = 0.544;
  x(19,3) = 0.396;

  x(20,1) = 0.031;
  x(20,2) = 0.569;
  x(20,3) = 0.400;

  x(21,1) = 0.025;
  x(21,2) = 0.491;
  x(21,3) = 0.484;

  x(22,1) = 0.045;
  x(22,2) = 0.613;
  x(22,3) = 0.342;

  x(23,1) = 0.0195;
  x(23,2) = 0.526;
  x(23,3) = 0.4545;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sampled data:\n' );
  fprintf ( 1, '\n' );

  for sample_i = 1 : sample_num
    fprintf ( 1, '%6d  %12f  %12f  %12f\n', sample_i, x(sample_i,1:elem_num) );
  end
%
%  Compute the observed averages.
%
  mean = r8col_mean ( sample_num, elem_num, x );

  variance = r8col_variance ( sample_num, elem_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Observed means, variances are:\n' );
  fprintf ( 1, '\n' );
  for elem_i = 1 : elem_num
    fprintf ( 1, '%6d  %12f  %12f\n', elem_i, mean(elem_i), variance(elem_i) );
  end

  init = 1;
  alpha = [];

  [ alpha, rlogl, v, g, niter, s, epsilon, ifault ] = dirichlet_estimate ( ...
    elem_num, sample_num, x, sample_num, init, alpha );

  if ( ifault ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIRICHLET_ESTIMATE - Fatal error!\n' );
    fprintf ( 1, '  Error code IFAULT = %d\n', ifault );
    error ( 'DIRICHLET_ESTIMATE - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index, Estimate, Lower Limit, Upper Limit:\n' );
  fprintf ( 1, '\n' );

  for elem_i = 1 : elem_num
    vari = v((elem_i*(elem_i-1))/2+elem_i);
    aminus = alpha(elem_i) - 1.96 * sqrt ( vari );
    aplus = alpha(elem_i) + 1.96 * sqrt ( vari );
    fprintf ( 1, '%6d  %12f  %12f  %12f\n', elem_i, alpha(elem_i), aminus, aplus );
  end

  mean = dirichlet_mean ( elem_num, alpha );

  variance = dirichlet_variance ( elem_num, alpha );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Expected means, variances are:\n' );
  fprintf ( 1, '\n' );
  for elem_i = 1 : elem_num
   fprintf ( 1, '%6d  %12f  %12f\n', elem_i, mean(elem_i), variance(elem_i) );
  end

  alpha_sum = sum ( alpha(1:elem_num) );

  fprintf ( 1, '\n ' );
  fprintf ( 1, '  Alpha sum is %f\n', alpha_sum );
  fprintf ( 1, '\n ' );
  fprintf ( 1, '  NORMALIZED VALUES:\n ' );
  fprintf ( 1, '  Index, Estimate, Lower Limit, Upper Limit:\n ' );
  fprintf ( 1, '\n' );

  for elem_i = 1 : elem_num
    vari = v((elem_i*(elem_i-1))/2+elem_i);
    aminus = ( alpha(elem_i) - 1.96 * sqrt ( vari ) ) / alpha_sum;
    aplus = ( alpha(elem_i) + 1.96 * sqrt ( vari ) ) / alpha_sum;
    fprintf ( 1, '%6d  %12f  %12f  %12f\n', ...
      elem_i, alpha(elem_i)/alpha_sum, aminus, aplus );
  end

  fprintf ( 1, '\n ' );
  fprintf ( 1, 'Log likelikhood function = %f\n', rlogl );

  return
end
