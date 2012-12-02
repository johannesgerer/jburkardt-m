function prob_test0105 ( )

%*****************************************************************************80
%
%% TEST0105 tests BESSEL_I0, BESSEL_I0_VALUES.
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
  fprintf ( 1, 'TEST0105:\n' );
  fprintf ( 1, '  BESSEL_I0 evaluates the Bessel function I0(X);\n' );
  fprintf ( 1, '  BESSEL_I0_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X       Exact F       I0(X)\n' );
  fprintf ( 1, '\n' );
  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = bessel_i0_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = bessel_i0 ( x );

    fprintf ( 1, '  %8f  %14f  %14f\n', x, fx, fx2 );

  end

  return
end
