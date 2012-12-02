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
%    21 March 2006
%
%  Author:
%
%    John Burkardt
%
  global test

  test_num = p00_test_num ( );

  for test = 1 : test_num

    fprintf ( 1, '\n' );
    fprintf ( 1, 'ODE45_TEST\n' );
    fprintf ( 1, '  Problem number = %d\n', test );

    titles = p00_title ( test );
    fprintf ( 1, '  %s\n', titles );
%
%  Initialize any problem parameters.
%
    value = p00_param_default ( test );
    if ( 0 < value )
      fprintf ( 1, '  This problem has %d parameters.\n', value );
    end
%
%  Autonomous?
%
    if ( p00_autonomous ( test ) )
      fprintf ( 1, '  The system is autonomous.\n' );
    else
      fprintf ( 1, '  The system is not autonomous.\n' );
    end
%
%  Get the number of equations.
%
    neqn = p00_neqn ( test );

    fprintf ( 1, '  Number of equations is %d\n', neqn );
%
%  Get the starting point.
%
    [ t_start, y_start ] = p00_start ( test );
%
%  Get the stopping point.
%
    [ t_stop, y_stop ] = p00_stop ( test );

    t_span = [ t_start, t_stop ];

    [ t, y ] = ode45( @fun, t_span, y_start );

    nstep = size ( t, 1 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Computed solution at last step:\n' );
    fprintf ( 1, '\n' );

    if ( neqn <= 4 )
      fprintf ( 1, '  %12f', t_stop );
      for i = 1 : neqn
        fprintf ( 1, '  %12f', y(nstep,i) );
      end
      fprintf ( 1, '\n' );
    elseif ( neqn <= 8 )
      fprintf ( 1, '  %12f', t_stop );
      for i = 1 : 4
        fprintf ( 1, '  %12f', y(nstep,i) );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '              ' );
      for i = 5 : neqn
        fprintf ( 1, '  %12f', y(nstep,i) );
      end
      fprintf ( 1, '\n' );
    else
      y_min = min ( y(nstep,1:neqn) );
      y_ave = sum ( y(nstep,1:neqn) ) / neqn;
      y_max = max ( y(nstep,1:neqn) );
      y_norm = sqrt ( sum ( y(nstep,1:neqn).^2 ) );
      fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', ...
        t_stop, y_min, y_ave, y_max, y_norm );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Expected final conditions:\n' );
    fprintf ( 1, '\n' );

    if ( neqn <= 4 )
      fprintf ( 1, '  %12f', t_stop );
      for i = 1 : neqn
        fprintf ( 1, '  %12f', y_stop(i) );
      end
      fprintf ( 1, '\n' );
    elseif ( neqn <= 8 )
      fprintf ( 1, '  %12f', t_stop );
      for i = 1 : 4
        fprintf ( 1, '  %12f', y_stop(i) );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '              ' );
      for i = 5 : neqn
        fprintf ( 1, '  %12f', y_stop(i) );
      end
      fprintf ( 1, '\n' );
    else
      y_min = min ( y_stop(1:neqn) );
      y_ave = sum ( y_stop(1:neqn) ) / neqn;
      y_max = max ( y_stop(1:neqn) );
      y_norm = sqrt ( sum ( y_stop(1:neqn).^2 ) );
      fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f\n', ...
        t_stop, y_min, y_ave, y_max, y_norm );
    end

    if ( neqn == 1 )
      plot ( t, y(:,1), 'b-' );
    elseif ( neqn == 2 )
      plot ( t, y(:,1), 'b-', t, y(:,2), 'g-' )
    elseif ( neqn == 3 )
      plot ( t, y(:,1), 'b-', t, y(:,2), 'g-', t, y(:,3), 'r-' )
    elseif ( neqn == 4 )
      plot ( t, y(:,1), 'b-', t, y(:,2), 'g-', t, y(:,3), 'r-', t, y(:,4), 'k-' )
    else
      clf
      hold on
      for j = 1 : neqn
        plot ( t, y(:,j) )
      end
      hold off
    end

    title ( sprintf ( 'Test %d, NEQN = %d', test, neqn ) ); 

    pause;

  end

  return
end
