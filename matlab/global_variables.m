function global_variables ( )

%*****************************************************************************80
%
%% GLOBAL_VARIABLES demonstrates how functions can share GLOBAL data.
%
%  Discussion:
%
%    Sometimes, a variable is defined in one function, but needed in
%    another.  Typically, one can get the information from one place to
%    another by passing it through the function argument list.  Sometimes,
%    this is inconvenient, especially if, between the sender and the receiver,
%    there are predefined functions that may not be changed.  
%
%    The GLOBAL statement offers a quick and easy way around this problem.
%    It "reserves" the name of one or more variables.  Any functions using
%    the GLOBAL statement can read or write the values of the variables
%    named there.
%
%    In this example, the main program sets a parameter LAMBDA, and calls
%    MATLAB's ODE23() function, which calls the user function F() to
%    evaluate the right hand side of a differential equation.  The function
%    F() needs to know the value of LAMBDA, and in this example, we use
%    a GLOBAL statement to make it available.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2014
%
%  Author:
%
%    John Burkardt
%

%
%  The variable name LAMBDA is declared to be global.
%  Any function that wants to see or change this value can do so, as long
%  as it also includes this GLOBAL LAMBDA statement.
%
  global lambda

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GLOBAL_VARIABLES:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate how variables may be set in one function\n' );
  fprintf ( 1, '  and accessed in another function, without having to be\n' );
  fprintf ( 1, '  passed through the argument list.  Instead, a GLOBAL\n' );
  fprintf ( 1, '  statement is used.\n' );

  figure ( 1 )
  clf
  hold on

  c = [ 'b', 'g', 'r', 'k' ];

  for i = 1 : 4
%
%  Here, we set LAMBDA.
%
    lambda = i;
    [ t, y ] = ode23 ( @f, [ 0, 1], 1.0 );
    plot ( t, y, c(i), 'Linewidth', 3 );
    s = sprintf ( '  Y'' = - Lambda * Y, Lambda = %g', lambda );
    title ( s, 'Fontsize', 24 );
    grid on
    xlabel ( '<---T--->', 'Fontsize', 16 );
    ylabel ( '<---Y(T)--->', 'Fontsize', 16 );
    pause

  end

  hold off
  print ( '-dpng', 'global_variables.png' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GLOBAL_VARIABLES:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function dydt = f ( t, y )

%*****************************************************************************80
%
%% F evaluates the right hand side of the differential equation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2014
%
%  Author:
%
%    John Burkardt
%

%
%  Because this function declares GLOBAL LAMBDA, it shares the same
%  information that is available to the main program.
%
  global lambda

  dydt = - lambda * y;

  return
end
