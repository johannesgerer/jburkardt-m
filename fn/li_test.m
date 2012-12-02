function li_test ( )

%*****************************************************************************80
%
%% LI_TEST tests R4_LI and R8_LI.
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
  fprintf ( 1, 'LI_TEST:\n' );
  fprintf ( 1, '  Test LOGARITHMIC_INTEGRAL_VALUES, R4_LI, R8_LI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X           LI(X)\n' );
  fprintf ( 1, '                      R4_LI(X)        Diff\n' );
  fprintf ( 1, '                      R8_LI(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = logarithmic_integral_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_li ( single ( x ) );
    fx3 = r8_li ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
