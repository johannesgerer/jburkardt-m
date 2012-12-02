function [u,A,l,w,err1,err2] = nonlocal_diffusion ( N, epsilon, problem )
%**************************************************************************
%
%% nonlocal diffusion computes the numerical solution of a nonlocal diffusion problem
%
%  Discussion:
%
%    This subroutine solves the following nonlocal diffusion problem:
%    DD*u = w  in  Omega
%    u = g     in  Omega_I
%    
%    where D and D* are the nonlocal divergence operator and its adjoint.
%    The operator DD* is defined as:
%    
% 
%               x+epsilon       2       u - u'
%             int           ---------  -------- dx'
%               x-epsilon   epsilon^2  |x - x'|
%    
%  
%    The numerical solution is computed with the finite element method
%    using piece-wise linear basis functions, solving the system
% 
%    A u = f
%    
%    where A is the discretization of the operator DD* and f = w + l is the
%    right hand side. w is the discretization of the source term and l is
%    the lifting. The problem is solved on internal grid nodes using the
%    lifting in case of non-homogeneous Dirichlet problem.
% 
%    L2 and H1 error norms are computed with respect to an analytic
%    solution, assumed known. Five cases are considered, in each of them
%    Omega = [0,1], Omega_I = (-epsilon,0) (1,1+epsilon)
% 
%    case # 1: u_anl  =   x^3, w_anl = -6x
% 
%    case # 2: u_anl  =   x^2(1-x^2), w_anl = 2*(6*x.^2 -1 + 0.5*epsilon^2)
% 
%    case # 3: u_anl  = - x^6/15 + x^5/5 + (epsilon^2/12-1/6)x^4 + 
%                       - epsilon^2/6*x^3 + s*x^2
%              with s =   epsilon^4/45 + epsilon^2/12 - epsilon^4/24 and
%              w_anl  =   2*(x^4 - 2*x^3 +x^2)
%    
%    case # 4: u_anl  =   x-1/4.......................................x<0.5
%                         x-1/2.......................................x>0.5 
%              
%              w_anl  =   0...................................x<0.5-epsilon
%                        -2/epsilon^2(-1/4(log(epsilon)-
%                         log(1/2-v)))....................0.5-epsilon<x<0.5
%                         2/epsilon^2( 1/4*(log(v-1/2)-
%                         log(epsilon)))..................0.5<x<0.5+epsilon
%                         0...................................x>0.5+epsilon
%    
%    case # 5: u_anl  = 1+x, w_anl  =   0
%                       
%
%  Author:
%
%    Marta D'Elia
%
%  Parameters:
%
%    Input, integer N, number of intervals in [0,1].
%
%    Input, real epsilon, nonlocal parameter
%
%    Output, real u(N-1), numerical solution on internal nodes 
%
%    Output, real A(N-1,N-1), matrix of the system 
%
%    Output, real l(N-1), lifting
% 
%    Output, real w(N-1), source term
% 
%    Output, real err1, H1 norm of the error |u-u_anl|_H1
% 
%    Output, real err2, L2 norm of the error |u-u_anl|_L2
% 
%  Modified: 
%    
%    02-28-2012
% 
%**************************************************************************

close all
a  =  0;
b  =  1;
h  =  (b-a)/N; % discretization step
xN =  linspace(a,b,N+1)';
x  =  xN(2:end-1);
if(mod(epsilon,h)==0)
    shift = h; % epsilon - (n-1)h
    n     = round(epsilon/h); % number of elements covered by epsilon
else
    shift = mod(epsilon,h);
    n     = ceil(epsilon/h);
end

xN = linspace(a-(n-1)*h,b+(n-1)*h,N+1+2*(n-1))';
xN = [a-epsilon; xN; b+epsilon];

%% vectors and matrix
A   = zeros(N+1+2*n, N+1+2*n);
w   = zeros(N-1,1);
l   =  zeros(N+2*n+1,1);

%% assembling
for i = 1:N-2 % forcing term ----------------------------------------------
    a      = x(i); 
    b      = x(i+1);
    w(i)   = w(i)   + quadgk(@(v)gaussF_vec(i+n+1,  v,xN,h,epsilon^2,problem),a,  b,'RelTol',1e-10);
    w(i+1) = w(i+1) + quadgk(@(v)gaussF_vec(i+1+n+1,v,xN,h,epsilon^2,problem),a,  b,'RelTol',1e-10);
end
   w(1)    = w(1)   + quadgk(@(v)gaussF_vec(1+1+n,  v,xN,h,epsilon^2,problem),0,  h,'RelTol',1e-10);
   w(N-1)  = w(N-1) + quadgk(@(v)gaussF_vec(N+n,    v,xN,h,epsilon^2,problem),1-h,1,'RelTol',1e-10);

for i = 1:N+2*n % matrix --------------------------------------------------
     for k = max(1-i,-n):min(n,N+2*n-i)
       if(i==1)
          a = xN(1); 
          b = xN(2);
       elseif (i==N+2*n)
          a = xN(end-1); 
          b = xN(end);
       else
          a = xN(i)   + (k==n) *(h-shift);
          b = xN(i+1) - (k==-n)*(h-shift);
       end
       
       if(k==0)
         for ib = [i, i+1]
            for jb = [i,i+1]
                skip = (ib<=n+1) || (jb<=n+1) || (ib>=N+n+1) || (jb>=N+n+1);
                if(~skip)
                        A(ib,jb) = A(ib,jb)+quadgk(@(v)gauss_vec(xN(jb),xN(ib),max(xN(i+k), v-epsilon), v, v,h,epsilon),a,b,'RelTol',1e-10)...
                                           +quadgk(@(v)gauss_vec(xN(jb),xN(ib),v, min(xN(i+k+1), v+epsilon), v,h,epsilon),a,b,'RelTol',1e-10);
                end
            end
         end
       else
         if(k==-1) 
             if((i+1>n+1) && (i-1>n+1) && (i+1 <N+n+1) && (i-1<N+n+1) )
            ib = i+1; 
            jb = i-1;
            t  = quadgk(@(v)gauss_vec(xN(jb),xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon),a,b,'RelTol',1e-10);       
            A(ib,jb) = A(ib,jb) + t;
            A(jb,ib) = A(jb,ib) + t;
             end
         elseif(k==1)
             if((i>n+1) && (i+2>n+1) && (i <N+n+1) && (i+2<N+n+1) )
            ib = i; 
            jb = i+2;
            t  = quadgk(@(v)gauss_vec(xN(jb),xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon),a,b,'RelTol',1e-10);
            A(ib,jb) = A(ib,jb) + t;
            A(jb,ib) = A(jb,ib) + t;
             end
         end
         
         if(abs(k)~=1)
         for ib = [i, i+1]
           for jb = [i+k,i+k+1] 
               if(jb>n+1 && jb<=N+n)
                  t = quadgk(@(v)gauss_vec(xN(jb),xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon),a,b,'RelTol',1e-10);              
                  A(ib,jb) = A(ib,jb) + t;
                  A(jb,ib) = A(jb,ib) + t; 
               end
           end
         end
         end
         for ib = [i+k, i+k+1]
           for jb = [i+k, i+k+1]
               skip = (ib == i)&&(jb == i) || (ib == i+1)&&(jb == i+1) ||  (ib<=n+1) || (jb<=n+1) || (ib>=N+n+1) || (jb>=N+n+1);
               if(~skip)
                    A(ib,jb) = A(ib,jb) + quadgk(@(v)gauss_vec(xN(jb),xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon),a,b,'RelTol',1e-10);
               end                
           end
         end
           
         for ib = [i, i+1]
           for jb = [i, i+1]
               skip = (ib<=n+1) || (jb<=n+1) || (ib>=N+n+1) || (jb>=N+n+1);
                if(~skip)
                  A(ib,jb) = A(ib,jb) + quadgk(@(v)gauss_vec(xN(jb),xN(ib),   max(xN(i+k), v-epsilon),     min(xN(i+k+1), v+epsilon), v,h,epsilon),a,b,'RelTol',1e-10);
                end
           end
         end
       end
     end
end

for i = [1:2*n+1,N-1:N+2*n] % lifting -------------------------------------
        for k = max(1-i,-n):min(n,N+2*n-i)
               if(i==1)
                    a = xN(1); 
                    b = xN(2);
               elseif (i==N+2*n)
                    a = xN(end-1); 
                    b = xN(end);
               else
                    a = xN(i)   + (k==n) *(h-shift);
                    b = xN(i+1) - (k==-n)*(h-shift);
               end
               if(k==0)
                    for ib = [i, i+1]
                        skip = (ib<=n+1) || (ib>=N+n+1);
                        if(~skip)
                        l(ib) = l(ib) + quadgk(@(v)gaussR_vec(xN(ib), max(xN(i+k), v-epsilon), v,v,h,epsilon,problem),a,b,'RelTol',1e-10)...
                                      + quadgk(@(v)gaussR_vec(xN(ib), v, min(xN(i+k+1), v+epsilon), v,h,epsilon,problem),a,b,'RelTol',1e-10);
                        end
                    end
               else
                     if(k==-1) 
                         if((i-1>n+1) && (i-1 <N+n+1))
                        ib      = i-1;
                        l(ib)   =  l(ib) + quadgk(@(v)gaussR_vec(xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon,problem),a,b,'RelTol',1e-10);
                         end
                     elseif(k==1) 
                         if((i+2>n+1) && (i+2 <N+n+1))
                        ib      = i+2;
                        l(ib)   = l(ib) +  quadgk(@(v)gaussR_vec(xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon,problem),a,b,'RelTol',1e-10);
                         end
                     else
                        for ib  = [i+k, i+k+1] 
                          skip  = (ib<=n+1) || (ib>=N+n+1);
                            if(~skip)
                          l(ib) = l(ib)+quadgk(@(v)gaussR_vec(xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon,problem),a,b,'RelTol',1e-10);
                            end
                        end
                     end 
                     for ib = [i, i+1]
                         skip = (ib<=n+1) || (ib>=N+n+1);
                            if(~skip)
                         l(ib) = l(ib) + quadgk(@(v)gaussR_vec(xN(ib),max(xN(i+k), v-epsilon), min(xN(i+k+1), v+epsilon), v,h,epsilon,problem),a,b,'RelTol',1e-10);
                            end
                     end
               end
        end
end

%% exact velocity 

  u_ex = problem ( x, h, epsilon, 'u' );

%% solving
A =  A(2+n:end-1-n,2+n:end-1-n);
l = -l(2+n:end-1-n);
f = w+l;
u = A\f;
%
%  Plot the computed and exact solutions.
%
  figure
  plot(x,u,'k-*', x,u_ex,'r','Linewidth',2);
  grid
  title ( 'Comparison of exact and computed solutions' )
  print ( '-dpng', 'plot3.png' )
  close

%% error norms 

u0 = problem ( 0.0, h, epsilon, 'u' );
u1 = problem ( 1.0, h, epsilon, 'u' );
uN = [u0; u; u1];

L2   = 0; % L2 norm
for i = 1:N-2
    a    = x(i); 
    b    = x(i+1);
    L2   = L2 + quadgk(@(v)gaussL2_vec(i+n+1,v,xN,h,uN,n,epsilon^2,problem),a,b,'RelTol',1e-10);
end
    L2   = L2 + quadgk(@(v)gaussL2_vec(1+n,v,xN,h,uN,n,epsilon^2,problem),0,h,'RelTol',1e-10);
    L2   = L2 + quadgk(@(v)gaussL2_vec(N+n,v,xN,h,uN,n,epsilon^2,problem),1-h,1,'RelTol',1e-10);
    err2 = sqrt(L2);

H1   = 0; % H1 norm
for i = 1:N-2
    a    = x(i); 
    b    = x(i+1);
    H1   = H1 + quadgk(@(v)gaussH1_vec(i+n+1,v,h,uN,n,epsilon^2,problem),a,b,'RelTol',1e-10);
end
    H1   = H1 + quadgk(@(v)gaussH1_vec(1+n,v,h,uN,n,epsilon^2,problem),0,h,'RelTol',1e-10);
    H1   = H1 + quadgk(@(v)gaussH1_vec(N+n,v,h,uN,n,epsilon^2,problem),1-h,1,'RelTol',1e-10);
    err1 = sqrt(H1);

disp(['|u-u_anl|_H^1 = ', num2str(err1)]);
disp(['|u-u_anl|_L^2 = ', num2str(err2)]);


function value = phi(y_m_xi)
%% test function, piece-wise linear 
   value = 1 + (y_m_xi) .* (2*(-y_m_xi>=0)-1);

function value = R(x, h,epsilon,problem)
%% lifting 

  value = problem ( x, h, epsilon, 'l' );

function value = gauss(x1,x2,a,b,xj,h,epsilon)
%% matrix integrals, gaussian quadgk rules 
%  4 points
%    y1    =  (b-a)/2  *    sqrt((3 - 2*sqrt(6/5))/7) + (a+b)/2;
%    y2    = -(b-a)/2  *    sqrt((3 - 2*sqrt(6/5))/7) + (a+b)/2;
%    y3    =  (b-a)/2  *    sqrt((3 + 2*sqrt(6/5))/7) + (a+b)/2;
%    y4    = -(b-a)/2  *    sqrt((3 + 2*sqrt(6/5))/7) + (a+b)/2;
%    value =  (b-a)/2 .*  ((18+sqrt(30))/36 * sub_f((y1-x1)./h,(xj-x1)./h,(y1-x2)./h,(xj-x2)./h,xj-y1,epsilon) + ...     
%                          (18+sqrt(30))/36 * sub_f((y2-x1)./h,(xj-x1)./h,(y2-x2)./h,(xj-x2)./h,xj-y2,epsilon) + ...
%                          (18-sqrt(30))/36 * sub_f((y3-x1)./h,(xj-x1)./h,(y3-x2)./h,(xj-x2)./h,xj-y3,epsilon) + ...
%                          (18-sqrt(30))/36 * sub_f((y4-x1)./h,(xj-x1)./h,(y4-x2)./h,(xj-x2)./h,xj-y4,epsilon)   );
%  3 points
%    y1    =  (a+b)/2;
%    y2    =   sqrt(3)*(b-a)/(2*sqrt(5))+(a+b)/2;
%    y3    =   -sqrt(3)*(b-a)/(2*sqrt(5))+(a+b)/2;
%    value =  (b-a)/2 *  (8/9* sub_f((y1-x1)./h,(xj-x1)./h,(y1-x2)./h,(xj-x2)./h,xj-y1,epsilon) + ...     
%                         5/9* sub_f((y2-x1)./h,(xj-x1)./h,(y2-x2)./h,(xj-x2)./h,xj-y2,epsilon) + ...
%                         5/9* sub_f((y3-x1)./h,(xj-x1)./h,(y3-x2)./h,(xj-x2)./h,xj-y3,epsilon));
%  2 points
   y1    =  (b-a)/(2*sqrt(3))+(a+b)/2;
   y2    = -(b-a)/(2*sqrt(3))+(a+b)/2;                      
   value =  (b-a)/2 .*  (sub_f((y1-x1)./h,(xj-x1)./h,(y1-x2)./h,(xj-x2)./h,xj-y1,epsilon) + ...     
                         sub_f((y2-x1)./h,(xj-x1)./h,(y2-x2)./h,(xj-x2)./h,xj-y2,epsilon));
                                
function value = gauss_vec(x1,x2,a,b,xj,h,epsilon)
%%
         value = gauss(x1,x2,a,b,xj,h,epsilon);
         
function value = gaussR(xi,a,b,xj,h,epsilon,problem)
%% lifting integrals, gaussian quadgk rules
%  4 points
%    value = (b-a)/2 .*  ((18+sqrt(30))/36 * sub_R(xi,xj,   (b-a)/2 * sqrt((3 - 2*sqrt(6/5))/7) + (a+b)/2,  h,epsilon, problem) + ...     
%                         (18+sqrt(30))/36 * sub_R(xi,xj,  -(b-a)/2 * sqrt((3 - 2*sqrt(6/5))/7) + (a+b)/2,  h,epsilon, problem) + ...
%                         (18-sqrt(30))/36 * sub_R(xi,xj,   (b-a)/2 * sqrt((3 + 2*sqrt(6/5))/7) + (a+b)/2,  h,epsilon, problem) + ...
%                         (18-sqrt(30))/36 * sub_R(xi,xj,  -(b-a)/2 * sqrt((3 + 2*sqrt(6/5))/7) + (a+b)/2,  h,epsilon, problem));
%  3 points
%    value = (b-a)/2 .*   (8/9* sub_R(xi,xj,(a+b)/2,h,epsilon, problem) + ...     
%                          5/9* sub_R(xi,xj,sqrt(3)*(b-a)/(2*sqrt(5))+(a+b)/2,h,epsilon, problem) + ...
%                          5/9* sub_R(xi,xj,-sqrt(3)*(b-a)/(2*sqrt(5))+(a+b)/2,h,epsilon, problem) );
%  2 points
   value = (b-a)/2 .*  (sub_R(xi,xj, (b-a)/(2*sqrt(3))+(a+b)/2,h,epsilon, problem) + ...     
                        sub_R(xi,xj,-(b-a)/(2*sqrt(3))+(a+b)/2,h,epsilon, problem) );
                      
function value = gaussR_vec(xi,a,b,xj,h,epsilon,problem) 
%%
         value = gaussR(xi,a,b,xj,h,epsilon,problem);  

function value = gaussF_vec(i,v,x,h,epsilon2,problem)
%% source integrals 

  epsilon = sqrt(epsilon2);

  f = problem ( v, h, epsilon, 'f' );

  ph_v = 0 * epsilon2;
  if(abs(v-x(i))<=h)
    ph_v = phi((v-x(i))./h);
  end
  value = ph_v.*f;
 
function value = gaussL2_vec(i,v,x,h,uN,n,epsilon2,problem)
%% L2 norm 

  uex = problem ( v, h, epsilon2, 'u' );  

   xi  = x(i); 
   xip = x(i+1);
   xx  = xi *ones(length(v),1);
   xxp = xip*ones(length(v),1);
   hh  = h*ones(length(v),1);
   uc1 = 0 * epsilon2;
   uc2 = 0;
   N   = length(x)-2*n;
   if((i>=n+1) && (i<=N+n+1))
    uc1   = (abs(xx'-v)<=hh') .* uN(i-n).*phi((v-xi)./h);
   end
   if(i+1>=n+1 && (i+1<=N+n+1))
    uc2   =  (abs(xxp'-v)<=hh') .* uN(i-n+1).*phi((v-xip)./h);
   end
   value = (uc1+uc2-uex).^2;
 %
function value = gaussH1_vec(i,v,h,uN,n,epsilon2,problem)
%% H1 norm 

  d_uex = problem ( v, h, epsilon2, 'd' );

  value = (-uN(i-n)/h +uN(i-n+1)/h - d_uex).^2;
   
function value = sub_f(y_m_x1,xj_m_x1,y_m_x2,xj_m_x2,xj_m_y,epsilon)
%% sub integrand - matrix
   phi1_y   = 0; 
   phi1_xj  = 0; 
   phi2_y   = 0; 
   phi2_xj  = 0; 
   if(abs(y_m_x1)<=1)
    phi1_y  = phi(y_m_x1);
   end
   if(abs(xj_m_x1)<=1)
    phi1_xj = phi(xj_m_x1);
   end
    phi1    = phi1_y-phi1_xj;
   if(abs(y_m_x2)<=1)
    phi2_y  = phi(y_m_x2);
   end
   if(abs(xj_m_x2)<=1)
    phi2_xj = phi(xj_m_x2);
   end
   phi2     = phi2_y - phi2_xj;
   value    = (phi1.*phi2)./(epsilon^2 .* (abs(xj_m_y)+1.e-9));

function value = sub_R(xi,xj,y,h,epsilon,problem)
%% sub integrand - lifting 
   ph_y   = 0; 
   ph_xj  = 0;
   if(abs(xi-y)<=h)
    ph_y   = phi((y-xi)./h);
   end
   if(abs(xi-xj)<=h)
    ph_xj = phi((xj-xi)./h);
   end
   ph    = ph_y - ph_xj;
   r     = R(y,h,epsilon,problem) - R(xj,h,epsilon,problem);
   value = (ph.*r)./(epsilon^2 * (abs(xj-y)+1.e-9));
            
        
        
