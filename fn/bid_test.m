function bid_test ( )

%*****************************************************************************80
%
%% BID_TEST tests R4_BID and R8_BID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BID_TEST:\n' );
  fprintf ( 1, '  Test AIRY_BI_PRIME_VALUES, R4_BID, R8_BID\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X     AIRY_BID(X)\n' );
  fprintf ( 1, '                     R4_BID(X)        Diff\n' );
  fprintf ( 1, '                     R8_BID(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = airy_bi_prime_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_bid ( single ( x ) );
    fx3 = r8_bid ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
