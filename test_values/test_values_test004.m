function test_values_test004 ( )

%*****************************************************************************80
%
%% TEST004 demonstrates the use of AIRY_AI_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST004:\n' );
  fprintf ( 1, '  AIRY_AI_VALUES stores values of \n' );
  fprintf ( 1, '  the Airy function Ai(x).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Ai(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, ai ] = airy_ai_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, ai );

  end

  return
end
