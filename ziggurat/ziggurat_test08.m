function test08 ( sample_num )

%*****************************************************************************80
%
%% TEST08 times R4_EXP.
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
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  Measure the time it takes R4_EXP to generate\n' );
  fprintf ( 1, '  %d exponential deviates.\n', sample_num );

  [ ke, fe, we ] = r4_exp_setup ( );

  seed = uint32 ( 123456789 );

  time1 = cputime;

  for sample = 1 : sample_num
    [ value, seed ] = r4_exp ( seed, ke, fe, we );
  end

  time2 = cputime;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %f seconds.\n', time2 - time1 );

  return
end

