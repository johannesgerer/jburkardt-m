function blsprice_test ( )

%*****************************************************************************80
%
%% BLSPRICE_TEST demonstrates the use of BLSPRICE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLSPRICE_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BLSPRICE function.\n' );

  blsprice_test01 ( )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLSPRICE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function blsprice_test01 ( )

%*****************************************************************************80
%
%% BLSPRICE_TEST01 executes the example case from the online reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLSPRICE_TEST01:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Call BLSPRICE for the reference case.\n' );

  price = 100.0;
  strike = 95.0;
  rate = 0.1;
  time = 0.25;
  volatility = 0.5;
  yield = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input to blsprice():\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current price of the underlying asset = %g\n', price );
  fprintf ( 1, '  Exercise price of the option = %g\n', strike );
  fprintf ( 1, '  Annualized, continuously compounded risk-free rate of return\n' );
  fprintf ( 1, '  of the option, expressed as a positive decimal = %g\n', rate );
  fprintf ( 1, '  Time to expiration of the option, in years = %g\n', time );
  fprintf ( 1, '  Annualized asset price volatility = %g\n', volatility );
  fprintf ( 1, '  (Optional, default = 0.0) Annualized, continuously compounded\n' );
  fprintf ( 1, '  yield of the underlying asset over the life of the option = %g\n', yield );

  [ call, put ] = blsprice ( price, strike, rate, time, volatility, yield );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output from blsprice():\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  European call price = %g\n', call );
  fprintf ( 1, '  European put price  = %g\n', put );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
