function test_zero_rc_one ( a, b, machep, t, f, title )

%*****************************************************************************80
%
%% TEST_ZERO_RC_ONE tests ZERO_RC on one test function.
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
%    Input, real A, B, the two endpoints of the change of sign
%    interval.
%
%    Input, real MACHEP, an estimate for the relative machine
%    precision.
%
%    Input, real T, a positive error tolerance.
%
%    Input, function value = F ( x ), the name of a user-supplied
%    function which evaluates the function whose zero is being sought.
%
%    Input, string TITLE, a title for the problem.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    STATUS      X               F(X)\n' );
  fprintf ( 1, '\n' );
 
  status = 0;
  value = [];

  while ( 1 )

    [ arg, status ] = zero_rc ( a, b, t, value, status );

    if ( status < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  ZERO_RC returned an error flag!\n' );
      error ( 'ZERO_RC returned an error flag!' );
    end

    value = f(arg);

    fprintf ( 1, '  %8d  %14e  %14e\n', status, arg, value );

    if ( status == 0 )
      break
    end

  end

  return
end
