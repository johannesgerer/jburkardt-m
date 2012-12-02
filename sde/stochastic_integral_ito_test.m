function stochastic_integral_ito_test ( )

%*****************************************************************************80
%
%% STOCHASTIC_INTEGRAL_ITO_TEST tests STOCHASTIC_INTEGRAL_ITO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STOCHASTIC_INTEGRAL_ITO_TEST:\n' );
  fprintf ( 1, '  Estimate the Ito integral of W(t) dW over [0,1].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                                             Abs      Rel\n' );
  fprintf ( 1, '         N        Exact        Estimate      Error    Error\n' );
  fprintf ( 1, '\n' );

  n = 100;
  seed = 123456789;

  for i = 1 : 7

    [ estimate, exact, error ] = stochastic_integral_ito ( n, seed );

    fprintf ( 1, '  %8d  %12.8g  %12.8g  %8.2g  %8.2g\n', n, exact, estimate, ...
      error, error / exact );

    n = n * 4;

  end

  return
end
