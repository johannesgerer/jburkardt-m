function laguerre_polynomial_test ( )

%*****************************************************************************80
%
%% LAGUERRE_POLYNOMIAL_TEST tests the LAGUERRE_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the LAGUERRE_POLYNOMIAL library.\n' );

  laguerre_polynomial_test01 ( );
  laguerre_polynomial_test02 ( );
  laguerre_polynomial_test03 ( );
  laguerre_polynomial_test04 ( );
  laguerre_polynomial_test05 ( );
  laguerre_polynomial_test06 ( );

  p = 5;
  b = 0.0;
  laguerre_polynomial_test07 ( p, b );

  p = 5;
  b = 1.0;
  laguerre_polynomial_test07 ( p, b );

  p = 5;
  e = 0;
  laguerre_polynomial_test08 ( p, e );

  p = 5;
  e = 1;
  laguerre_polynomial_test08 ( p, e );
%
%  Make some plots.
%
  a = 0.0;
  b = 5.0;
  index = [ 0, 1, 2, 3, 4, 5, 10 ];
  filename = 'l_polynomial.png';
  l_polynomial_plot ( a, b, index, filename );

  a = 0.0;
  b = 5.0;
  index = [ 0, 1, 2, 3, 4, 5, 10 ];
  index2 = [ 1, 1, 1, 1, 1, 1, 1 ];
  filename = 'lm1_polynomial.png';
  lm_polynomial_plot ( a, b, index, index2, filename );

  a = 0.0;
  b = 5.0;
  index = [ 0, 1, 2, 3, 4, 5, 10 ];
  index2 = [ 2, 2, 2, 2, 2, 2, 2 ];
  filename = 'lm2_polynomial.png';
  lm_polynomial_plot ( a, b, index, index2, filename );

  a = 0.0;
  b = 5.0;
  index =  [ 0,   1,   2,   3,   4,   5,   10 ];
  index2 = [ 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ];
  filename = 'lf05_function.png';
  lf_function_plot ( a, b, index, index2, filename );

  close
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGUERRE_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
