function test_int_margin_test03 ( sample_num, margin )

%*****************************************************************************80
%
%% TEST_INT_MARGIN_TEST03 uses simple sampling with a weight function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, real MARGIN, the margin value.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INT_MARGIN_TEST03:\n' );
  fprintf ( 1, '  F represents a function F(X),\n' );
  fprintf ( 1, '  W represents a weight whose integral over [A,B] should be 1.\n' );
  fprintf ( 1, '  M represents the characteristic function for (X | MARGIN <= F(X)).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Consider the following four weight functions:\n' );
  fprintf ( 1, '  W0(x) = 1;\n' );
  fprintf ( 1, '  W1(x) = gaussian ( mean = 1/6, sigma = 0.20\n' );
  fprintf ( 1, '  W2(x) = gaussian ( mean = 3/6, sigma = 0.20\n' );
  fprintf ( 1, '  W3(x) = gaussian ( mean = 5/6, sigma = 0.20\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use sampling to estimate the following integrals:\n' );
  fprintf ( 1, '  Q(W), Q(F), Q(WM), Q(FWM).\n' );
  if ( nargin < 1 )
    sample_num = 1000;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (Input quantity SAMPLE_NUM not supplied, using default.)\n' );
  end
  if ( nargin < 2 )
    margin = 1.0;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (Input quantity MARGIN not supplied, using default.)\n' );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_NUM = %d\n', sample_num );
  fprintf ( 1, '  MARGIN = %f\n', margin );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P# W#          Q(W)         Q(WF)         Q(WM)        Q(WFM)\n' );

  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    a = 0.0;
    b = 1.0;

    sample_x = a + ( b - a ) * rand ( sample_num, 1 );

    sample_f = p00_f ( problem, sample_num, sample_x );

    sigma = 0.20;

    fprintf ( 1, '\n' );

    qf = ( b - a ) * sum ( sample_f ) / sample_num;
    qfm = ( b - a ) ...
       * sum ( sample_f ( margin <= sample_f ) ) ...
       / sample_num;
    margin_num = sum ( margin <= sample_f );
    pm = margin_num / sample_num;

    fprintf ( 1, '  P%d\n', problem );
    fprintf ( 1, '     W0  %12g  %12g  %12g  %12g\n', 1.0/(b-a), qf, pm, qfm );

    for weight = 1 : 3
      
      mu = ( 2.0 * weight - 1.0 ) / 6.0;
      scale = 0.5 * sqrt ( pi ) * sigma * ( erf ( mu / sigma ) - erf ( ( mu - 1 ) / sigma ) );
      sample_w = gaussian ( mu, sigma, sample_num, sample_x ) / scale;

      qw = ( b - a ) * sum ( sample_w ) / sample_num;

      qwf = ( b - a ) * ( sample_f' * sample_w ) / sample_num;

      qwm = ( b - a ) ...
         * sum ( sample_w ( margin <= sample_f ) ) ...
         / sample_num;

      qwfm = ( b - a ) ...
         * ( sample_f ( margin <= sample_f )' * sample_w ( margin <= sample_f ) ) ...
         / sample_num;

      fprintf ( 1, '     W%d  %12g  %12g  %12g  %12g\n', weight, qw, qwf, qwm, qwfm );

    end

  end

  return
end
