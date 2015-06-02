function toms443_test01 ( )

%*****************************************************************************80
%
%% TOMS443_TEST01 tests WEW_A
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS443_TEST01\n' );
  fprintf ( 1, '  Test WEW_A to evaluate\n' );
  fprintf ( 1, '  Lambert''s W function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      Exact    Computed      Error\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, w1 ] = lambert_w_values ( n_data );

    if ( n_data <= 0 )
      break
    end

    if ( x == 0.0 )
      w2 = 0.0;
    else
      [ w2, en ] = wew_a ( x );
    end

    fprintf ( 1, '  %12.4f  %16.8g  %16.8g  %10.2e\n', ...
      x, w1, w2, abs ( w1 - w2 ) );

  end

  return
end
