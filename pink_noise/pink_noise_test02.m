function pink_noise_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests CDELAY2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  CDELAY2 is a circular buffer implementation\n' );
  fprintf ( 1, '  of an M-fold delay.  Q is a counter\n' );
  fprintf ( 1, '  which is decremented by CDELAY2, but reset to M\n' );
  fprintf ( 1, '  after it reaches 0.\n' );

  for m = 2 : 4
    fprintf ( 1, '\n' );
    fprintf ( 1, '   I   M  Qin  Qout\n' );
    fprintf ( 1, '\n' );
    q = m;
    for i = 1 : 3 * ( m + 1 )
      q_in = q;
      q = cdelay2 ( m, q );
      fprintf ( 1, '  %2d  %2d  %2d  %2d\n', i, m, q_in, q );
    end
  end

  return
end
