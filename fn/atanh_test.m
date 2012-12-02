function atanh_test ( )

%*****************************************************************************80
%
%% ATANH_TEST tests R4_ATANH and R8_ATANH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_values' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ATANH_TEST:\n' );
  fprintf ( 1, '  Test ARCTANH_VALUES, R4_ATANH, R8_ATANH\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X     ARCTANH(X)\n' );
  fprintf ( 1, '                  R4_ATANH(X)         Diff\n' );
  fprintf ( 1, '                  R8_ATANH(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = arctanh_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_atanh ( single ( x ) );
    fx3 = r8_atanh ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14f  %14g\n', x, fx1 );
    fprintf ( 1, '                  %14g  %14g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14g  %14g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
