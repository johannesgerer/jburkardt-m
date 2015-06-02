function normal_01_cdf_test ( )

%*****************************************************************************80
%
%% NORMAL_01_CDF_TEST tests NORMAL_01_CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_CDF_TEST\n' );
  fprintf ( 1, '  NORMAL_01_CDF evaluates the Normal 01 CDF;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X              CDF                       CDF\n' );
  fprintf ( 1, '                     (exact)                   (computed)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, cdf1 ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    cdf2 = normal_01_cdf ( x );

    fprintf ( 1, '  %14.6g  %24.16g  %24.16g\n', x, cdf1, cdf2 );

  end

  return
end
