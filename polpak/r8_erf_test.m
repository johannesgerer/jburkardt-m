function r8_erf_test ( )

%*****************************************************************************80
%
%% R8_ERF_TEST tests R8_ERF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_ERF_TEST:\n' );
  fprintf ( 1, '  R8_ERF evaluates the error function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X      Exact F   R8_ERF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = erf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_erf ( x );

    fprintf ( 1, '  %6f  %12f  %12f\n', x, fx, fx2 );

  end

  return
end
