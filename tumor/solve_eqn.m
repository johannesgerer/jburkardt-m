function f =  solve_eqn ( nuk, time, dt, a_matrix, vcur, ccur, fcur, ...
  etacur, fold )  

%% SOLVE_EQN sets up and solves the linear system for V, C or F.
%
%  Modified:
%
%    26 April 2006
%
  global area
  global indx
  global m
  global nel
  global neqn
  global nnodes
  global node
  global nq  
  global nunk 
  global xc

  xq = zeros(3,1);
  wq = zeros(3,1);
  f = zeros(nunk,1);
%
%  Set up quadrature information on [-1,1]
%
  [ xq, wq ] = gauss3pt;

  disp ( 'Setup' )

  for it = 1 : nel

    for iq = 1 : nq

      x = xc(node(it,1)) + area(it) / 2.0 * ( xq(iq) + 1.0 );
      ar = area(it) * wq(iq); 

      for in = 1 : nnodes

        ip = node(it,in);
        i = indx(ip);

        if ( 0 < i )

          [ bb, bx ] = quadbf ( x, it, in, xc, node ); 
%
%  Evaluate the solution at previous timestep at quadrature pt
%
          [ soln, solnx ] = eval_pt ( x, it, fold );  
% 
%  Evaluate right hand sides due to lagging and source.
%
          rhs_lag = rhsfun_lag ( x, it, bb, bx, nuk, vcur, ccur, fcur, etacur );
          rhs_source = rhsfun_source ( x, time, bb, nuk );  
          f(i) = f(i) + ar * ( bb * soln + dt * ( rhs_lag + rhs_source ) );

        end

      end

    end       

  end  

  disp ( 'Solve' )
  f = a_matrix \ ( a_matrix' \ f );

  return
end
