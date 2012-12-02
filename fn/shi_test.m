function shi_test ( )

%*****************************************************************************80
%
%% SHI_TEST tests R4_SHI and R8_SHI.
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
  fprintf ( 1, 'SHI_TEST:\n' );
  fprintf ( 1, '  Test SHI_VALUES, R4_SHI, R8_SHI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X          SHI(X)\n' );
  fprintf ( 1, '                     R4_SHI(X)        Diff\n' );
  fprintf ( 1, '                     R8_SHI(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = shi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_shi ( single ( x ) );
    fx3 = r8_shi ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
