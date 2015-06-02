function normal_01_sample_test ( )

%*****************************************************************************80
%
%% NORMAL_01_SAMPLE_TEST tests NORMAL_01_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_SAMPLE_TEST\n' );
  fprintf ( 1, '  NORMAL_01_SAMPLE returns samples from the normal\n' );
  fprintf ( 1, '  distribution with mean 0 and standard deviation 1.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 10
    [ x, seed ] = normal_01_sample ( seed );
    fprintf ( 1, '  %4d  %14.6g\n', i, x );
  end

  return
end
