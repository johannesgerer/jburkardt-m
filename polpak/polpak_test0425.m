function polpak_test0425 ( )

%*****************************************************************************80
%
%% TEST0425 tests R8_HYPER_2F1.
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
  fprintf ( 1, 'TEST0425:\n' );
  fprintf ( 1, '  R8_HYPER_2F1 evaluates the hypergeometric 2F1 function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A       B       C       X      ' );
  fprintf ( 1, ' 2F1                       2F1                     DIFF\n' );
  fprintf ( 1, '                                     ' );
  fprintf ( 1, '(tabulated)               (computed)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, c, x, fx ] = hyper_2f1_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_hyper_2f1 ( a, b, c, x );

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %24.16e  %24.16e  %10.4e\n', ...
      a, b, c, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
