function combination_lock_3_10 ( )

%*****************************************************************************80
%
%% BICYCLE_LOCK finds the combination on a typical bicycle lock.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
  timestamp ( )
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BICYCLE_LOCK\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A bicycle combination lock consists of 3 dials,\n' );
  fprintf ( 1, '  each having 10 symbols, 0 through 9.\n' );
  fprintf ( 1, '  We seek to determine the combination C.\n' );
%
%  Set the combination randomly.
%  We can think of the combination as a number between 0 and 999.
%
  rng ( 'shuffle' );
  c = randi ( [ 0, 999 ], 1, 1 );
%
%  To find the combination, simply generate every number between 0 and 999,
%  and then try it.
%
  for a = 0 : 999

    if ( a == c )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The combination is %d!\n', c );
      break
    end
  
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BICYCLE_LOCK\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
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
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
