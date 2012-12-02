function bi_test ( )

%*****************************************************************************80
%
%% BI_TEST tests R4_BI and R8_BI.
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
  fprintf ( 1, 'BI_TEST:\n' );
  fprintf ( 1, '  Test AIRY_BI_VALUES, R4_BI, R8_BI\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X      AIRY_BI(X)\n' );
  fprintf ( 1, '                      R4_BI(X)        Diff\n' );
  fprintf ( 1, '                      R8_BI(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = airy_bi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_bi ( single ( x ) );
    fx3 = r8_bi ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );


  end

  rmpath ( '../test_values' );

  return
end
