function ai_test ( )

%*****************************************************************************80
%
%% AI_TEST tests R4_AI and R8_AI.
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
  fprintf ( 1, 'AI_TEST:\n' );
  fprintf ( 1, '  Test AIRY_AI_VALUES, R4_AI, R8_AI\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X      AIRY_AI(X)\n' );
  fprintf ( 1, '                      R4_AI(X)        Diff\n' );
  fprintf ( 1, '                      R8_AI(X)        Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = airy_ai_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_ai ( single ( x ) );
    fx3 = r8_ai ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
