function truncated_normal_b_cdf_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_B_CDF_TEST tests TRUNCATED_NORMAL_AB_CDF;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_B_CDF_TEST\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_B_CDF evaluates the upper Truncated Normal CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean = mu\n' );
  fprintf ( 1, '    standard deviation = sigma\n' );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval (-oo,b]\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '                                                  Stored         Computed\n' );
  fprintf ( 1, '       X        Mu         S         B             CDF             CDF\n' );
  fprintf ( 1, '\n');

  n_data = 0;

  while ( 1 )

    [ n_data, mu, sigma, b, x, cdf1 ] ...
      = truncated_normal_b_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    cdf2 = truncated_normal_b_cdf ( x, mu, sigma, b );

    fprintf( 1, '  %8.1f  %8.1f  %8.1f  %8.1f  %14g  %14g\n', x, mu, sigma, b, cdf1, cdf2 );

  end

  return
end
