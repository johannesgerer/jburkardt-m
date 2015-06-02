function r8_agm_test ( )

%*****************************************************************************80
%
%% R8_AGM_TEST tests R8_AGM.
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
  fprintf ( 1, 'R8_AGM_TEST\n' );
  fprintf ( 1, '  R8_AGM computes the arithmetic geometric mean.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A           B          ' );
  fprintf ( 1, '   AGM                       AGM                   Diff\n' );
  fprintf ( 1, '                             ' );
  fprintf ( 1, '  (Tabulated)             R8_AGM(A,B)\n' );

  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, fx ] = agm_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_agm ( a, b );

    fprintf ( 1, '  %10.6f  %10.6f  %24.16f  %24.16f  %10.4g\n', ...
    a, b, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
