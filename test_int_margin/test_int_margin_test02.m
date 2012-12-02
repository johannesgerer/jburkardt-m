function test_int_margin_test02 ( sample_num, margin )

%*****************************************************************************80
%
%% TEST_INT_MARGIN_TEST02 uses simple sampling.
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
  fprintf ( 1, 'TEST_INT_MARGIN_TEST02:\n' );
  fprintf ( 1, '  Use simple sampling to estimate the integral of f(x)\n' );
  fprintf ( 1, '  over the region where margin <= f(x).\n' );
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
  fprintf ( 1, '  Number of sample points = %d\n', sample_num );
  fprintf ( 1, '  MARGIN value = %f\n', margin );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem           Q   Q(MARGIN)  Prob(MARGIN)\n' );
  fprintf ( 1, '\n' );

  problem_num = p00_problem_num ( );

  for problem = 1 : problem_num

    a = 0.0;
    b = 1.0;

    sample_x = a + ( b - a ) * rand ( sample_num, 1 );

    sample_f = p00_f ( problem, sample_num, sample_x );

    q = ( b - a ) * sum ( sample_f ) / sample_num;

    margin_num = sum ( margin <= sample_f );
    pm = margin_num / sample_num;

    wm = ( b - a ) * ( margin_num / sample_num );
    hm = sum ( sample_f ( margin <= sample_f ) ) / margin_num;
    qm = wm * hm;

    fprintf ( 1, '  %7d  %10g  %10g  %10g\n', problem, q, qm, pm );

  end

  return
end
