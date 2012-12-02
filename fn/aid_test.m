function aid_test ( )

%*****************************************************************************80
%
%% AID_TEST tests R4_AID and R8_AID.
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
  fprintf ( 1, 'AID_TEST:\n' );
  fprintf ( 1, '  Test AIRY_AI_PRIME_VALUES, R4_AID, R8_AID\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X     AIRY_AID(X)\n' );
  fprintf ( 1, '                     R4_AID(X)        Diff\n' );
  fprintf ( 1, '                     R8_AID(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = airy_ai_prime_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_aid ( single ( x ) );
    fx3 = r8_aid ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
