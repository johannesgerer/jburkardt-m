function cos_deg_test ( )

%*****************************************************************************80
%
%% COS_DEG_TEST tests R4_COS_DEG and R8_COS_DEG.
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
  fprintf ( 1, 'COS_DEG_TEST:\n' );
  fprintf ( 1, '  Test COS_DEGREE_VALUES, R4_COS_DEG, R8_COS_DEG.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             X     COS_DEG(X)\n' );
  fprintf ( 1, '                R4_COS_DEG(X)         Diff\n' );
  fprintf ( 1, '                R8_COS_DEG(X)         Diff\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = cos_degree_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r4_cos_deg ( single ( x ) );
    fx3 = r8_cos_deg ( x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %14.4f  %14.6g\n', x, fx1 );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx2, abs ( fx1 - fx2 ) );
    fprintf ( 1, '                  %14.6g  %14.6g\n', fx3, abs ( fx1 - fx3 ) );

  end

  rmpath ( '../test_values' );

  return
end
