function test_ode_test04 ( )

%*****************************************************************************80
%
%% TEST_ODE_TEST04 runs the test problems with ODE45.
%
%  Discussion:
%
%    In order to use a single routine FUN to evaluate the
%    right hand side of any of the test problems, it is
%    necessary to declare and set a global variable TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
%
%  Author:
%
%    John Burkardt
%
  global test

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ODE_TEST04\n' );
  fprintf ( 1, '  Create plots of ODE solutions.\n' );
  fprintf ( 1, '\n' );
  
  test_num = p00_test_num ( );

  for test = 1 : test_num
%
%  Initialize any problem parameters.
%
    value = p00_param_default ( test );
%
%  Get the number of equations.
%
    neqn = p00_neqn ( test );
%
%  Get the starting point.
%
    [ t_start, y_start ] = p00_start ( test, neqn );
%
%  Get the stopping point.
%
    [ t_stop, y_stop ] = p00_stop ( test, neqn );

    t_span = [ t_start, t_stop ];

    [ t, y ] = ode45 ( @fun, t_span, y_start );

    nstep = size ( t, 1 );

    clf
    hold on

    if ( neqn == 1 )
      plot ( t, y(:,1), 'b-', 'Linewidth', 3 );
    elseif ( neqn == 2 )
      plot ( t, y(:,1), 'b-', 'Linewidth', 3 );
      plot ( t, y(:,2), 'g-', 'Linewidth', 3 );
    elseif ( neqn == 3 )
      plot ( t, y(:,1), 'b-', 'Linewidth', 3 );
      plot ( t, y(:,2), 'g-', 'Linewidth', 3 );
      plot ( t, y(:,3), 'r-', 'Linewidth', 3 );
    elseif ( neqn == 4 )
      plot ( t, y(:,1), 'b-', 'Linewidth', 3 );
      plot ( t, y(:,2), 'g-', 'Linewidth', 3 );
      plot ( t, y(:,3), 'r-', 'Linewidth', 3 );
      plot ( t, y(:,4), 'k-', 'Linewidth', 3 );
    else
      for j = 1 : neqn
        plot ( t, y(:,j), 'Linewidth', 3 )
      end
    end

    title ( p00_title ( test ) );
    grid on
    xlabel ( '<--- T --->' );
    ylabel ( '<--- X(T) --->' );

    hold off

    filename = sprintf ( 'p%02d.png', test );

    print ( '-dpng', filename );
    fprintf ( 1, '  Saved plot of results in "%s"\n', filename );

  end

  return
end
