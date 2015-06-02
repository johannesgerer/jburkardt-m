function w_save = heat_oned ( A, B, M, n_nodes, x, t_initial, t_final, ...
  t_step, t_save )

%*****************************************************************************80
%
%% HEAT_ONED solves the heat equation.
%
%  Discussion:
%
%    Note that the initial condition is assumed to be all 1's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    Jeff Borggaard
%
%  Variables:
%
%    Input, real A(N_EQUATIONS,N_EQUATIONS), B(N_EQUATIONS,2),
%    matrices corresponding to M dxdt = Ax + Bu.
%
%    Input, real M(N_EQUATIONS,N_EQUATIONS), the mass matrix.
%
%    Input, integer N_NODES, the number of nodes.
%
%    Input, real T_INITIAL, the initial time.
%
%    Input, real T_FINAL, the final time.
%
%    Input, real T_STEP, the time step.
%
%    Input, real T_SAVE, the data save step.
%
%    Output, real W_SAVE(1:N_NODES,N_STORE), the solution computed at
%    each data save time.
%
  n_store = 0;

  for time = t_initial : t_step : t_final
  
    u = u_function ( time );

    if ( time == t_initial )

      w = ones ( n_nodes, 1 );

    else

      w(1) = u(1);

      w(2:n_nodes-1) = ( M - t_step * A ) \ ( M * w_current(2:n_nodes-1) + t_step * B * u );

      w(end) = u(2);

    end

    if ( abs ( mod ( time - t_initial + 1e-10, t_save ) ) < t_step / 3.0 )
      n_store = n_store + 1;
      w_save(:,n_store) = w;
    end
    
    w_current = w;
    u_current = u;

  end


  return
end                 
