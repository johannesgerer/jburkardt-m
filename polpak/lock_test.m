function lock_test ( )

%*****************************************************************************80
%
%% LOCK_TEST tests LOCK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOCK_TEST\n' );
  fprintf ( 1, '  LOCK counts the combinations on a button lock.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I   LOCK(I)\n' );
  fprintf ( 1, '\n' );

  a = lock ( n );

  for i = 0 : n
    fprintf ( 1, '  %2d  %10d\n', i, a(i+1) );
  end

  return
end
