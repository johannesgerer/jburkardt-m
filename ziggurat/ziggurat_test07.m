function test07 ( sample_num )

%*****************************************************************************80
%
%% TEST07 times R4_NOR.
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
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  Measure the time it takes R4_NOR to generate\n' );
  fprintf ( 1, '  %d normal deviates.\n', sample_num );

  [ kn, fn, wn ] = r4_nor_setup ( );

  seed = uint32 ( 123456789 );

  time1 = cputime;

  for sample = 1 : sample_num
    [ value, seed ] = r4_nor ( seed, kn, fn, wn );
  end

  time2 = cputime;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %f seconds.\n', time2 - time1 );

  return
end
