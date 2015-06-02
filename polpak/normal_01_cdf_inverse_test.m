function normal_01_cdf_inverse_test ( )

%*****************************************************************************80
%
%% NORMAL_01_CDF_INVERSE_TEST tests NORMAL_01_CDF_INVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_CDF_INVERSE_TEST:\n' );
  fprintf ( 1, '  NORMAL_01_CDF_INVERSE inverts the Normal 01 CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    FX            X    NORMAL_01_CDF_INVERSE(FX)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x1, fx ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    x2 = normal_01_cdf_inverse ( fx );

    fprintf ( 1, '  %6f  %12f  %12f\n', fx, x1, x2 );

  end

  return
end
