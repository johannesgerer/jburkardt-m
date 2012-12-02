function [ soln, solnx ] = eval_pt ( x, it, f )

%% EVAL_PT evaluates the solution and its derivative at a point X.
%
%  Modified:
%
%    26 April 2006
%
%  Parameters:
%
%    Input, real X, the point at which the solution is to be evaluated.
%
%    Input, integer IT, the index of the element containing X.
%
%    Input, real F(NEQN), the finite element coefficient vector.
%
%    Output, real SOLN, SOLNX, the solution and its derivative with 
%    respect to X, evaluated at X.
%
  global indx
  global nnodes  
  global node
  global xc

  soln = 0.0;
  solnx = 0.0;

  for in = 1 : nnodes

    ip = node(it,in);
    [ bb, bx ] = quadbf ( x, it, in, xc, node );
    i = indx(ip);

    if ( 0 < i )
      soln = soln + bb * f(i);
      solnx = solnx + bx * f(i);
    end

  end

  return
end
