function [ X, info, perf ] = conj_grad ( fun, par, x0, opts )

%*****************************************************************************80
%
%% CONJ_GRAD uses the conjugate gradient method for nonlinear optimization.
%
%  Discussion:
%
%    This function is discussed in chapter 7 of the reference.
%
%    Find  xm = argmin{f(x)}, where X is an n-vector and the scalar
%    function F with gradient G (with elements g(i) = Df/Dx_i )
%    must be given by a MATLAB function with with declaration
%      function  [f, g] = fun(x, par)
%    PAR holds parameters of the function.  It may be dummy.  
%  
%  Modified:
%
%    01 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%    Hans Bruun Nielsen, IMM, DTU.
%
%  Reference:
%  
%    P. E. Frandsen, K. Jonasson, H. B. Nielsen, O. Tingleff,
%    Chapter 4,
%    "Unconstrained Optimization", 1999.
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
%    Input, fun  :  String with the name of the function.
%
%    Input, par  :  Parameters of the function.  May be empty.
%
%    Input, x0   :  Starting guess for  x .
%
%    Input, opts :  Vector with 9 elements:
%          opts(1) :  Choice of CG method:
%              opts(1) = 1 :  Fletcher - Reeves, 
%                otherwise :  Polak - Ribiere 
%          opts(2) :  Choice of line search method:
%              opts(2) = 1 :  Exact l. s., otherwise : Soft l.s.
%          opts(3) :  Upper bound on initial step
%          opts(4:6)  used in stopping criteria:
%              ||g||_inf <= opts(4)                     or 
%              ||dx||_2 <= opts(5)*(opts(5) + ||x||_2)  or
%              no. of function evaluations exceeds  opts(6) . 
%          opts(7:9)  used as linesearch parameters lpar(3:5) .
%              See LINESEARCH .
%          Any illegal element in  opts  is replaced by its
%          default value :
%              opts(1:6) = [2  2  1  1e-4*||g(x0)||_inf  1e-6  100]
%          and
%              opts(2)=1:  opts(7:9) = [1e-4  1e-6  10]
%              opts(2)=2:  opts(7:9) = [1e-1  1e-2  10]
%
%    Output, X    :  If  perf  is present, then array, holding the iterates
%          columnwise.  Otherwise, computed solution vector.
%
%    Output, info :  Performance information, vector with 6 elements:
%          info(1:3) = final values of 
%              [f(x)  ||g||_inf  ||dx||_2] 
%          info(4:5) = no. of iteration steps and evaluations of (f,g)
%          info(6) = 1 :  Stopped by small gradient
%                    2 :  Stopped by small x-step
%                    3 :  Stopped by  opts(6) .  
%
%    Output, perf :  (optional). If present, then array, holding 
%            perf(1:2,:) = values of  f(x) and ||g||_inf
%            perf(3:5,:) = Line search info:  values of  
%                          alphaopt, phi'(alphaopt), no. fct. evals.
%

%
%  Check the input parameters.
%
  [x  n  f  g  opts] = check(fun,par,x0,opts);
%
%  Initialization
%
  k = 1;
  kmax = opts(6);
  ng = norm(g, inf);
  n2g = norm(g);   
  gg = n2g^2;
  gam = 0;
  h = zeros(size(x));
  nh = 0;
  neval = 1;

  Trace = nargout > 2;
  if  Trace
    X = x(:)*ones(1,kmax+1);
    perf = [f; ng; zeros(3,1)]*ones(1,kmax+1);
  end

  found = ng <= opts(4);

  while  ~found
    %  Previous values
    hpr = h;   nhpr = nh;  ggpr = gg;
    if  opts(1) == 2,   gpr = g; end
    %  New direction and scaling
    k = k+1;   h = gam*h - g;   nh = norm(h);
    %  Check descent
    gh = dot(g,h);     
    if  dot(g,h) >= -1e-3 * n2g * nh    % Not descent
      h = -g;   nh = n2g;
    end
    % Scale, aiming at  alphaopt = 1
    if  k > 2,  sc = .9*alphaopt*nhpr/nh
    else    % First step.  Try not to move too far
      sc = opts(3)/32/nh;
    end
    %  Line search
    lspar = [32  opts([2 7:8])  min(kmax-neval, opts(9))];
    [al  f  g  dval] = linesearch(fun,par,x,f,g, sc*h, lspar);
    alphaopt = sc*al;   ng = norm(g, inf);   n2g = norm(g);  gg = n2g^2;
    %  Update  gamma  and  x
    if  opts(1) == 1,  gam = gg/ggpr;
    else,              gam = dot(g-gpr,g)/ggpr; end
    x = x + alphaopt*h;   neval = neval + dval;
    if  Trace
          X(:,k) = x(:);   perf(1:2,k) = [f; ng];
          perf(3:5,k-1) = [alphaopt; dot(h,g); dval]; end
%
%  Check the stopping criteria.
%
    if ng <= opts(4)
      found = 1;
    elseif alphaopt*nh <= opts(5)*(opts(5) + norm(x))
      found = 2;
    elseif neval >= kmax
      found = 3; 
    end

  end
%
%  Set the return values.
%
  if  Trace
    X = X(:,1:k);   perf = perf(:,1:k);
  else
    X = x;
  end

  info = [f  ng  alphaopt*nh  k-1  neval  found];

  return
end
function [ x, n, f, g, opts ] = check ( fun, par, x0, opts0 )

%*****************************************************************************80
%
%% CHECK is an auxilliary function which checks ths input.
%
  sx = size(x0);
  n = max(sx)

  if  (min(sx) > 1)
    error('x0  should be a vector')
  end

  x = x0;
  [f g] = feval(fun,x,par);

  sf = size(f);
  sg = size(g);

   if  any(sf-1) | ~isreal(f)
       error('f  should be a real valued scalar'), end
   if  any(sg - sx)
       error('g  should be a vector of the same type as  x'), end

   so = size(opts0);
   if  (min(so) ~= 1) | (max(so) < 9) | any(~isreal(opts0(1:9)))
       error('opts  should be a real valued vector of length 9'), end
   opts = opts0(1:9);   opts = opts(:).';
   i = find(opts(1:2) > 2);
   if  length(i)    % Set default values
     d = [2  2];   opts(i) = d(i);
   end
   i = find(opts(1:6) <= 0);
   if  length(i)    % Set default values
     d = [2  2  1  1e-4*norm(g, inf)  1e-6  100];
     opts(i) = d(i);
   end
   i = find(opts(7:9) <= 0);
   if  length(i)    % Set default values
     d = [1e-6  1e-6  10; 1e-1  1e-2  10];
     opts(6+i) = d(opts(2),i);
   end


  return
end
