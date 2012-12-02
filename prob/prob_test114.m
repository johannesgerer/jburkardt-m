function prob_test114 ( )

%*****************************************************************************80
%
%% TEST114 tests NAKAGAMI_MEAN, NAKAGAMI_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST114\n' );
  fprintf ( 1, '  For the Nakagami PDF:\n' );
  fprintf ( 1, '  NAKAGAMI_MEAN computes the mean;\n' );
  fprintf ( 1, '  NAKAGAMI_VARIANCE computes the variance.\n' );

  a = 1.0;
  b = 2.0;
  c = 3.0;

  check = nakagami_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST114 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = nakagami_mean ( a, b, c );
  variance = nakagami_variance ( a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF parameter C =             %14f\n', c );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  return
end
