function hermite_polynomial_test03 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST03 tests HF_FUNCTION_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST03:\n' );
  fprintf ( 1, '  HF_FUNCTION_VALUES stores values of\n' );
  fprintf ( 1, '  the Hermite function Hf(n,x).\n' );
  fprintf ( 1, '  HF_FUNCTION_VALUE evaluates the function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X          Hf(N,X)                   Hf(N,X)                     Error\n' );

  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = hf_function_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2_vec = hf_function_value ( 1, n, x );
    fx2 = fx2_vec(1,n+1);
    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24.16e  %24.16e  %8.2g\n', n, x, fx1, fx2, e );

  end

  return
end
