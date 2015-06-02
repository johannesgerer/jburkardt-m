function [ a, b, x, job ] = bisection_rc ( a, b, fx, job )

%*****************************************************************************80
%
%% BISECTION_RC seeks a zero of f(x) in a change of sign interval.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc.m
%
%  Discussion:
%
%    The bisection method is used.
%
%    This routine uses reverse communication, so that the function is always
%    evaluated in the calling program.
%
%    On the first call, the user sets JOB = 0, and the values of A and B.
%    Thereafter, the user checks the returned value of JOB and follows 
%    directions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the change of sign interval.  
%    The user only initializes these values on first call.
%
%    Input, real FX, the function value at X.
%    Set this to 0 before the first call.  On subsequent calls, FX
%    should be set to the function value at X.
%
%    Input, integer JOB, a communication flag.
%    Set JOB to 0 before the first call.
%
%    Output, real A, B, the updated endpoints of the change of sign interval.  
%
%    Output, real X, a point at which the function is to 
%    be evaluated.
%
%    Output, integer JOB, a communication flag.
%    The program sets this to 1.
%    
  persistent fa
  persistent fb
  persistent state
  persistent x_local

  if ( job == 0 )

    fa = 0.0;
    fb = 0.0;
    state = 1;
    x = a;
    job = 1;

  elseif ( state == 1 )

    fa = fx;
    x = b;
    state = 2;

  elseif ( state == 2 )

    fb = fx;

    if ( sign ( fa ) == sign ( fb ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BISECTION_RC - Fatal error!\n' );
      fprintf ( 1, '  F(A) and F(B) have the same sign.\n' );
      error ( 'BISECTION_RC - Fatal error!' );
    end

    x = ( a + b ) / 2.0;
    state = 3;

  else

    if ( sign ( fx ) == sign ( fa ) )
      a = x_local;
      fa = fx;
    else
      b = x_local;
      fb = fx;
    end
    x = ( a + b ) / 2.0;
    state = 3;

  end

  x_local = x;

  return
end

