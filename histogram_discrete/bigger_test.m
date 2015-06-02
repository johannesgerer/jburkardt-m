function bigger_test ( s_num )

%*****************************************************************************80
%
%% BIGGER_TEST tests PDF_DISCRETE_VALUE and CDF_DISCRETE_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer S_NUM, the number of data values to generate.
%
  if ( nargin < 1 )
    s_num = input ( '  Enter S_NUM, the number of data values: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BIGGER_TEST\n' );
  fprintf ( 1, '  PDF_DISCRETE_VALUE evaluates the PDF associated with a\n' );
  fprintf ( 1, '  discrete histogram.\n' );
  fprintf ( 1, '  CDF_DISCRETE_VALUE evaluates the CDF associated with a\n' );
  fprintf ( 1, '  discrete histogram.\n' );
%
%  Set up the discrete histogram from sample data.
%
  s_min = 0.0;
  s_max = 10.0;
  s = s_min + ( s_max - s_min ) * rand ( s_num, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S_MIN = %g\n', s_min );
  fprintf ( 1, '  S_MAX = %g\n', s_max );
  r8vec_print ( s_num, s, '  Sample data:' );

  [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max );

  r8vec2_print ( x_num, x, y, '  Discrete histogram data:' );
%
%  Evaluate the discrete PDF.
%
  v_num = 21;
  v = linspace ( s_min, s_max, v_num );
  pdf = pdf_discrete_value ( x_num, x, y, v_num, v );
  cdf = cdf_discrete_value ( x_num, x, y, v_num, v );
  r8vec3_print ( v_num, v, pdf, cdf, '  Discrete PDF/CDF table:' );

  return
end

