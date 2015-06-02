function test05 ( sample_num )

%*****************************************************************************80
%
%% TEST05 times SHR3.
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
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  Measure the time it takes SHR3 to generate\n' );
  fprintf ( 1, '  %d unsigned 32 bit integers.\n', sample_num );

  seed = uint32 ( 123456789 );

  time1 = cputime;

  for sample = 1 : sample_num
    [ value, seed ] = shr3 ( seed );
  end

  time2 = cputime;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %f seconds.\n', time2 - time1 );

  return
end
