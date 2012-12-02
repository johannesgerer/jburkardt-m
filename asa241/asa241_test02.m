function asa241_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R8_NORMAL_01_CDF_INVERSE, NORMAL_01_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  Let FX = NormalCDF ( X ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NORMAL_01_CDF_VALUES returns some values of ( X, FX ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8_NORMAL_01_CDF_INVERSE takes FX, and computes an\n' );
  fprintf ( 1, '    estimate X2, of the corresponding input argument,\n' );
  fprintf ( 1, '    accurate to about 16 decimal places.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X                       FX               X2\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    x2 = r8_normal_01_cdf_inverse ( fx );

    fprintf ( 1, '  %22.16e  %22.16e  %22.16e\n', x, fx, x2 );

  end

  return
end
