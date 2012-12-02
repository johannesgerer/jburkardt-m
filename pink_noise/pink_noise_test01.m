function pink_noise_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests WRAP2.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  WRAP2 performs a circular wrap.\n' );
  fprintf ( 1, '  Q is expected to range between 0 and M.\n' );
  fprintf ( 1, '  WRAP2 takes an input value of Q, and either\n' );
  fprintf ( 1, '  increments it by M+1 until in the range, or\n' );
  fprintf ( 1, '  decrements it by M+1 until in the range,\n' );
  fprintf ( 1, '  and returns the result as the function value.\n' );

  for m = 2 : 4
    fprintf ( 1, '\n' );
    fprintf ( 1, '   M  Qin  Qout\n' );
    fprintf ( 1, '\n' );
    for i = -5 : 3 * m - 1
      q = i;
      q_in = q;
      q = wrap2 ( m, q );
      fprintf ( 1, '  %2d  %2d  %2d\n', m, q_in, q );
    end
  end

  return
end