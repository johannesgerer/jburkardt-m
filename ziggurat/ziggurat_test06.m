function test06 ( sample_num )

%*****************************************************************************80
%
%% TEST06 times R4_UNI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  Measure the time it takes R4_UNI to generate\n' );
  fprintf ( 1, '  %d uniform deviates.\n', sample_num );

  seed = uint32 ( 123456789 );

  time1 = cputime;

  for sample = 1 : sample_num
    [ value, seed ] = r4_uni ( seed );
  end

  time2 = cputime;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %f seconds.\n', time2 - time1 );

  return
end
