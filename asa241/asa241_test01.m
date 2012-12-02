function asa241_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests R4_NORMAL_01_CDF_INVERSE, NORMAL_01_CDF_VALUES.
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
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  Let FX = NormalCDF ( X ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NORMAL_01_CDF_VALUES returns some values of ( X, FX ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R4_NORMAL_01_CDF_INVERSE takes FX and computes\n' );
  fprintf ( 1, '    an estimate X2, of the corresponding input argument,\n' );
  fprintf ( 1, '    accurate to about 7 decimal places.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X                       FX               X2\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    x2 = r4_normal_01_cdf_inverse ( fx );
    
    fprintf ( 1, '  %22.16e  %22.16e  %22.16e\n', x, fx, x2 );

  end

  return
end
