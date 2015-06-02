function hyper_1f1_values_test ( )

%*****************************************************************************80
%
%% HYPER_1F1_VALUES_TEST demonstrates the use of HYPER_1F1_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPER_1F1_VALUES_TEST:\n' );
  fprintf ( 1, '  HYPER_1F1_VALUES stores values of \n' );
  fprintf ( 1, '  the hypergeometric 1F1 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A      B     X     Hyper_1F1(A,B,C,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = hyper_1f1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8f  %8f  %8f  %24.16g\n', a, b, x, fx );

  end

  return
end
