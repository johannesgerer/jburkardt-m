function prob_test0106 ( )

%*****************************************************************************80
%
%% TEST0106 tests BESSEL_I1, BESSEL_I1_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0106:\n' );
  fprintf ( 1, '  BESSEL_I1 evaluates the Bessel function I1(X);\n' );
  fprintf ( 1, '  BESSEL_I1_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X       Exact F       I1(X)\n' );
  fprintf ( 1, '\n' );
  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_i1_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = bessel_i1 ( x );

    fprintf ( 1, '  %8f  %14f  %14f\n', x, fx, fx2 );

  end

  return
end
