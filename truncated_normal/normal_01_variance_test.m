function normal_01_variance_test ( )

%*****************************************************************************80
%
%% NORMAL_01_VARIANCE_TEST tests NORMAL_01_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_VARIANCE_TEST\n' );
  fprintf ( 1, '  NORMAL_01_VARIANCE returns the Normal 01 variance.\n' );

  variance = normal_01_variance ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF variance =  %14f\n', variance );

  nsample = 1000;
  seed = 123456789;

  for i = 1 : nsample
    [ x(i), seed ] = normal_01_sample ( seed );
  end

  variance = var ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample variance = %14f\n', variance );

  return
end
