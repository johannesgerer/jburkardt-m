function psi_test ( )

%*****************************************************************************80
%
%% PSI_TEST tests R4_PSI and R8_PSI.
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
  fprintf ( 1, 'PSI_TEST:\n' );
  fprintf ( 1, '  Test PSI_VALUES, R4_PSI, R8_PSI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X         PSI(X)\n' );
  fprintf ( 1, '                    R4_PSI(X)         Diff\n' );
  fprintf ( 1, '                    R8_PSI(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = psi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_psi ( single ( x ) );
    fx3 = r8_psi ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
