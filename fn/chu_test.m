function chu_test ( )

%*****************************************************************************80
%
%% CHU_TEST tests R4_CHU and R8_CHU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHU_TEST:\n' );
  fprintf ( 1, '  Test HYPERGEOMETRIC_U_VALUES, R4_CHU, R8_CHU.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             A               B               X     CHU(A,B,X)\n' );
  fprintf ( 1, '                                                R4_CHU(A,B,X)' ); 
  fprintf ( 1, '         Diff\n' );
  fprintf ( 1, '                                                R8_CHU(A,B,X)' );
  fprintf ( 1, '         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx1 ] = hypergeometric_u_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_chu ( single ( a ), single ( b ), single ( x ) );
    fx3 = r8_chu ( a, b, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.4f  %14.4g  %14.6g\n', a, b, x, fx1 );
    fprintf ( 1, '                                                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                                                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
