function [c ceq] = general_constraint(z, PAR)

%*****************************************************************************80
%
%% GENERAL_CONSTRAINT evaluates a general constraint
%
%  Modified:
%
%    04 February 2010
%
%  Author:
%
%    Gene Cliff
%
  xf = evalin('base', 'XI');

  if isfield(PAR, 'ineq')
     c = feval(PAR.ineq, xf, PAR);
  else
     c = [];
  end

  if isfield(PAR, 'eq')
     ceq = feval(PAR.eq, xf, PAR);
  else
     ceq =[];
  end


  return
end
