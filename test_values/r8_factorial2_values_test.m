function r8_factorial2_values_test ( )

%*****************************************************************************80
%
%% R8_FACTORIAL2_VALUES_TEST demonstrates the use of R8_FACTORIAL2_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_FACTORIAL2_VALUES_TEST:\n' );
  fprintf ( 1, '  R8_FACTORIAL2_VALUES returns values of\n' );
  fprintf ( 1, '  the double factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N         N!!\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, f ] = r8_factorial2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %14.6g\n',  n, f );

  end

  return
end
