function f = rhsfun ( x )

%% RHSFUN evaluates the right hand side or forcing term in the equation.
%
%  Modified:
%
%    10 November 2005
%
  u = cos ( pi * x );
  uxx = -pi * pi * u;
  f = -uxx + u;
  
  return
end
