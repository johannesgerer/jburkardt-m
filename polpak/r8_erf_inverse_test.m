function r8_erf_inverse_test ( )

%*****************************************************************************80
%
%% R8_ERF_INVERSE_TEST tests R8_ERF_INVERSE.
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
  fprintf ( 1, 'R8_ERF_INVERSE_TEST:\n' );
  fprintf ( 1, '  R8_ERF_INVERSE inverts the error function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    FX            X    R8_ERF_INVERSE(FX)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x1, fx ] = erf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    x2 = r8_erf_inverse ( fx );

    fprintf ( 1, '  %6f  %12f  %12f\n', fx, x1, x2 );

  end

  return
end
