function test_local_min_rc_one ( a, b, t, f, title )

%*****************************************************************************80
%
%% TEST_LOCAL_MIN_RC_ONE tests LOCAL_MIN_RC_ONE on one test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, real T, a positive absolute error tolerance.
%
%    Input, real value = F ( x ), the name of a user-supplied
%    function whose local minimum is being sought.
%
%    Input, string TITLE, a title for the problem.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Step      X                          F(X)\n' );
  fprintf ( 1, '\n' );
  step = 0;

  arg = a;
  value = f ( arg );
  fprintf ( 1, '  %4d  %24.16e  %24.16e\n', step, arg, value );

  arg = b;
  value = f ( arg );
  fprintf ( 1, '  %4d  %24.16e  %24.16e\n', step, arg, value );

  a2 = a;
  b2 = b;
  status = 0;

  while ( 1 )

    [ arg, status, a2, b2 ] = local_min_rc ( a2, b2, status, value );
 
    if ( status < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST_LOCAL_MIN_RC_ONE - Fatal error!\n' );
      fprintf ( 1, '  LOCAL_MIN_RC returned negative status.\n' );
      exit
    end

    value = f ( arg );

    step = step + 1;
    fprintf ( 1, '  %4d  %24.16e  %24.16e\n', step, arg, value );

    if ( status == 0 )
      break
    end

    if ( 50 < step )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST_LOCAL_MIN_RC_ONE - Fatal error!\n' );
      fprintf ( 1, '  Too many steps.\n' );
      break
    end

  end

  return
end
