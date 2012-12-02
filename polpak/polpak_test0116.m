function polpak_test0116 ( )

%*****************************************************************************80
%
%% TEST0116 tests ERROR_F and ERF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0116\n' );
  fprintf ( 1, '  ERROR_F evaluates the error function.\n' );
  fprintf ( 1, '  ERF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X      Exact F       ERROR_F(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = erf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = error_f ( x );

    fprintf ( 1, '  %6f  %12f  %12f\n', x, fx, fx2 );

  end

  return
end
