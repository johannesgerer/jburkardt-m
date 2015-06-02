function normal_01_cdf_inv_test ( )

%*****************************************************************************80
%
%% NORMAL_01_CDF_INV_TEST tests NORMAL_01_CDF_INV.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_CDF_INV_TEST\n' );
  fprintf ( 1, '  NORMAL_01_CDF_INV inverts the Normal 01 CDF;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      CDF             X                         X\n' );
  fprintf ( 1, '                     (exact)                   (computed)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x1, cdf ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    x2 = normal_01_cdf_inv ( cdf );

    fprintf ( 1, '  %14.6g  %24.16g  %24.16g\n', cdf, x1, x2 );

  end

  return
end
