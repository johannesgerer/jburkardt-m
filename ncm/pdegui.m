function pdegui(action)
%PDEGUI  Demonstrate solution of model partial differential equations.
% PDEGUI demonstrates the finite difference solution of model problems
% involving Laplace's operator:
%      del^2_U = partial^2_U/partial_x^2 + partial^2_U/partial_y^2.
%
% The PDEs are:
%      Poisson equation, del^2_U = f, f = -1.
%      Heat equation, partial_U/dt = del^2_U - f.
%      Wave equation, partial^2_U/partial_t^2 = del^2_U.
%      Eigenvalue equation, del^2_U + lambda U = 0.
%
% The regions are: 
%      Square.
%      L-shaped.
%      H-shaped.
%      Disc.
%      Annulus.
%      Heart.
%      An pair of "isospectral" drums with the same eigenvalues.
%      Hand.
%
% The boundary values are u = 0 outside the region.  The initial values for
% the heat and wave equations are impulses at random points in the region.
% You can vary the grid spacing, h.  Decreasing h increases accuracy,
% but also increases memory requirements and computation time.
% For the heat equation, you can set sigma = delta_t/h^2.
% For the wave equation, you can set sigma = delta_t^2/h^2.
% If sigma is too large, the time-stepping methods are unstable.
% For the eigenvalue problem, you can set the eigenvalue index.

if nargin == 0
   Initialize_GUI
   action = 'restart';
end
drawnow

if isequal(action,'restart') | ...
   isequal(action,'h+') | isequal(action,'h-')

   % Find the buttons

   regionobj = findobj('tag','region');
   regionstr = get(regionobj,'string');
   region = regionstr{get(regionobj,'value')};
   eqnobj = findobj('tag','eqn');
   eqn = get(eqnobj,'value');
   hobj = findobj('tag','h');
   sigind = findobj('tag','sigind');
   indxobj = findobj('tag','indx');
   sigmaobj = findobj('tag','sigma');
   plusobj = findobj('tag','plus');
   minusobj = findobj('tag','minus');
   stopobj = findobj('string','stop');

   % Set button visibility 

   switch eqn
      case {1,5}  % Poisson, Grid
         set([sigind,indxobj,sigmaobj,plusobj,minusobj,stopobj],'vis','off');
      case 2      % Heat
         set(sigind,'vis','on','string','sigma =');
         set(indxobj,'vis','off');
         set(sigmaobj,'vis','on','string','0.250','userdata',0.250);
         set([plusobj,minusobj,stopobj],'vis','on');
      case 3      % Wave
         set(sigind,'vis','on','string','sigma =');
         set(indxobj,'vis','off');
         set(sigmaobj,'vis','on','string','0.500','userdata',0.500);
         set([plusobj,minusobj,stopobj],'vis','on');
      case 4      % Eigenvalue
         set(sigind,'vis','on','string','index =');
         set([sigmaobj,stopobj],'vis','off');
         set([indxobj,plusobj,minusobj],'vis','on');
   end

   % Adjust h

   h = str2num(get(hobj,'string'));
   if isequal(action,'h+')
      h = 1/round(1/h+3);
      set(hobj,'string',sprintf('1/%.0f',1/h))
   elseif isequal(action,'h-') & (h < 1/3)
      h = 1/round(1/h-3);
      set(hobj,'string',sprintf('1/%.0f',1/h))
   end

   % Generate the mesh

   [x,y] = meshgrid(-1:h:1);
   [xv,yv,scale] = vertices(region);
   [in,on] = inregion(x,y,xv,yv);
   if isequal(region,'Annulus')
      in = in - inregion(x,y,xv/2,yv/2);
      xv = [xv NaN xv/2];
      yv = [yv NaN yv/2];
   end
   p = find(in-on);
   G = zeros(size(x));
   G(p) = 1:length(p);
   
   % Generate the discrete Laplacian.

   A = -delsq(G);
   n = size(A,1);
   
   % Initialize the solution

   t = 0;
   lambda = [];
   switch eqn
      case {2,3}      % Heat, Wave
         p = find(G>0);
         n = length(p);
         q = ceil(n*rand);
         x0 = x(p(q));
         y0 = y(p(q));
         r = (x(p)-x0).^2 + (y(p)-y0).^2;
         if eqn == 2, c = 1; else c = 1/6; end
         u = c*exp(-5*r);
         v = zeros(n,1);
      otherwise
         u = [];
         v = [];
   end

   % Save everything in figure's userdata.

   data.eqn = eqn; data.G = G; data.A = A; data.x = x; data.y = y;
   data.h = h; data.n = n; data.u = u; data.v = v; data.t = t;
   data.lambda = lambda; data.xv = xv; data.yv = yv; data.scale = scale;
   set(gcf,'userdata',data);

else

   % Adjust sigma or index.

   eqn = get(findobj('tag','eqn'),'value');
   if eqn == 4
      indxobj = findobj('tag','indx');
      indx = str2num(get(indxobj,'string'));
      if isequal(action,'+')
         indx = indx + 1;
      elseif isequal(action,'-')
         indx = max(1,indx - 1);
      end
      set(indxobj,'string',int2str(indx));
   else
      sigmaobj = findobj('tag','sigma');
      sigma = str2num(get(sigmaobj,'string'));
      if isequal(action,'+')
         sigma = sigma + .001;
      elseif isequal(action,'-')
         sigma = sigma - .001;
      end
      set(sigmaobj,'string',sprintf('%6.3f',sigma));
   end

end

% Retrieve parameters
      
data = get(gcf,'userdata');
A = data.A; u = data.u; v = data.v; t = data.t; scale = data.scale;
n = data.n; h = data.h; x = data.x; y = data.y; G = data.G;
xv = data.xv; yv = data.yv;

% Begin main loop

stopobj = findobj('string','stop');
closeobj = findobj('string','close');
set(stopobj,'userdata',0)
set(closeobj,'vis','off')

while get(stopobj,'userdata') == 0
   switch eqn
      case 1
         % Solve sparse linear system Au = f with f = -1,
         % scaled so that max(abs(u)) = 1.
         f = -h^2*scale*ones(n,1);
         u = A\f;
         set(stopobj,'userdata',1)
      case 2
         % One step for heat equation
         sigmaobj = findobj('tag','sigma');
         sigma = str2num(get(sigmaobj,'string'));
         f = -h^2*scale*ones(n,1);
         t = t + sigma*h^2;
         u = u + sigma*(A*u - f);
         data.t = t;
         data.u = u;
      case 3
         % One step for wave equation
         sigmaobj = findobj('tag','sigma');
         sigma = str2num(get(sigmaobj,'string'));
         t = t + sqrt(sigma)*h;
         w = u;
         u = 2*u - v + sigma*A*u;
         v = w;
         data.t = t;
         data.u = u;
         data.v = v;
      case 4
         % Some eigenvalues already computed; maybe need more.
         indxobj = findobj('tag','indx');
         indx = str2num(get(indxobj,'string'));
         if indx >= n
            indx = n-1;
            set(indxobj,'string',num2str(n-1))
         end
         while indx > length(data.lambda)
            k = min(length(data.lambda)+10,n-1);
            [u,lambda] = eigswatch(-(1/h^2)*A,k);
            data.lambda = lambda;
            data.u = u; 
         end
         lambda = data.lambda(indx);
         u = data.u(:,indx);
         u = u/u(min(find(abs(u(:))==max(abs(u(:))))));
         set(stopobj,'userdata',1)
      case 5
         % Show grid, no computation
         u = ones(n,1);
         set(stopobj,'userdata',1)
   end

   % Map the solution onto the grid and display it.

   U = zeros(size(x));
   p = find(G>0);
   U(p) = u;
   U(U>1) = 1;
   U(U<-1) = -1;
   set(gcf,'renderer','painters')
   if eqn < 5
      contourf(x,y,U,-1:1/8:1)
   else
      ms = max(4,min(14,ceil(100*h)));
      plot(x(p),y(p),'.','markersize',ms,'color',[0 2/3 0])
   end
   line(xv,yv,'color','black')
   set(gca,'color',get(gcf,'color'),'xtick',[],'ytick',[])
   axis square
   caxis([-1 1])
   switch eqn
      case {2,3}
         xlabel(sprintf('t = %9.4f',t));
      case 4
         xlabel(sprintf('lambda(%2d) = %9.4f',indx,lambda))
      case 5
         xlabel(sprintf('n = %.0f',n));
      otherwise
   end
   drawnow
   set(gcf,'userdata',data)
end
set(stopobj,'vis','off')
set(closeobj,'vis','on')


% ------------------------------------------------------------------------

function Initialize_GUI
clf reset
set(gcf,'doublebuffer','on','menubar','none', ...
   'numbertitle','off','name','PDE gui','userdata',1);
set(gca,'pos',[.11 .11 .6 .815])
uicontrol( ...
     'tag','region', ...
     'style','list', ...
     'units','normal', ...
     'position',[.75 .55 .23 .35], ...
     'string',{'Square','L','H','Disc','Annulus', ...
        'Heart','Drum1','Drum2','Hand'}, ...
     'fontsize',12, ...
     'value',1, ...
     'callback','pdegui(''restart'')')
uicontrol( ...
     'tag','eqn', ...
     'style','list', ...
     'units','normal', ...
     'position',[.75 .30 .23 .22], ...
     'string',{'Poisson','Heat','Wave','Eigenvalue','Grid'}, ...
     'fontsize',12, ...
     'value',1, ...
     'callback','pdegui(''restart'')')
uicontrol( ...
     'style','text', ...
     'units','normal', ...
     'position',[.75 .22 .10 .06], ...
     'background',get(gcf,'color'), ...
     'string','   h = ', ...
     'fontsize',12)
uicontrol( ...
     'tag','h', ...
     'style','edit', ...
     'units','normal', ...
     'position',[.85 .22 .08 .06], ...
     'string','1/24', ...
     'backgroundcolor',[1 1 1], ...
     'fontsize',12, ...
     'callback','pdegui(''restart'')')
uicontrol( ...
     'tag','hminus', ...
     'style','pushbutton', ...
     'units','normal', ...
     'position',[.93 .22 .03 .03], ...
     'string','-', ...
     'fontsize',12, ...
     'callback','pdegui(''h-'')')
uicontrol( ...
     'tag','hplus', ...
     'style','pushbutton', ...
     'units','normal', ...
     'position',[.93 .25 .03 .03], ...
     'string','+', ...
     'fontsize',12, ...
     'callback','pdegui(''h+'')')
uicontrol( ...
     'tag','sigind', ...
     'style','text', ...
     'units','normal', ...
     'position',[.75 .14 .10 .06], ...
     'background',get(gcf,'color'), ...
     'string','', ...
     'fontsize',12)
uicontrol( ...
     'tag','indx', ...
     'style','edit', ...
     'units','normal', ...
     'position',[.85 .14 .08 .06], ...
     'string','1', ...
     'userdata',1, ...
     'backgroundcolor',[1 1 1], ...
     'fontsize',12, ...
     'callback','pdegui(''indx'')')
uicontrol( ...
     'tag','sigma', ...
     'style','edit', ...
     'units','normal', ...
     'position',[.85 .14 .08 .06], ...
     'string','0.250', ...
     'userdata',0.250, ...
     'backgroundcolor',[1 1 1], ...
     'fontsize',12);
uicontrol( ...
     'tag','minus', ...
     'style','pushbutton', ...
     'units','normal', ...
     'position',[.93 .14 .03 .03], ...
     'string','-', ...
     'fontsize',12, ...
     'callback','pdegui(''-'')')
uicontrol( ...
     'tag','plus', ...
     'style','pushbutton', ...
     'units','normal', ...
     'position',[.93 .17 .03 .03], ...
     'string','+', ...
     'fontsize',12, ...
     'callback','pdegui(''+'')')
uicontrol( ...
     'style','pushbutton', ...
     'units','normal', ...
     'position',[.80 .05 .12 .06], ...
     'string','stop', ...
     'fontsize',12, ...
     'userdata',0, ...
     'callback','set(findobj(''string'',''stop''),''userdata'',1)');
uicontrol( ...
     'style','toggle', ...
     'units','normal', ...
     'position',[.80 .05 .12 .06], ...
     'string','close', ...
     'fontsize',12, ...
     'userdata',0, ...
     'callback','close(gcf)');


% ------------------------------------------------------------------------

function [u,lambda] = eigswatch(A,k)
% [u,lambda] = eigswatch(A,k)
% Modify pointer and text while computing k smallest
% eigenvalues and eigenvectors of sparse matrix A.

ps = get(gcf,'pointer');
set(gcf,'pointer','watch')
sigind = findobj('tag','sigind');
str = get(sigind,'string');
set(sigind,'string','computing')
drawnow
opts.disp = 0;
[u,lambda] = eigs(A,k,0,opts);
[lambda,p] = sort(diag(lambda));
u = u(:,p);
set(sigind,'string',str)
set(gcf,'pointer',ps)


% ------------------------------------------------------------------------

function [xv,yv,scale] = vertices(region)

% (xv,yv) = vertices of where region
% scale = max(U) where del^2 U = -1 in region.

switch region
   case 'Square'
      xv = [-1 1 1 -1 -1];
      yv = [-1 -1 1 1 -1];
      scale = 3.394; 
   case 'L'
      xv = [0 1 1 -1 -1 0 0];
      yv = [0 0 1 1 -1 -1 0];
      scale = 6.702;
   case 'H'
      xv = [0 1 1 2 2 1 1 -1 -1 -2 -2 -1 -1 0]/2; 
      yv = [1 1 2 2 -2 -2 -1 -1 -2 -2 2 2 1 1]/2;
      scale = 8.387;
   case 'Disc'
      z = exp(2*pi*i*(0:128)/128);
      xv = real(z);
      yv = imag(z);
      scale = 3.960;
   case 'Annulus'
      z = exp(2*pi*i*(0:128)/128);
      xv = real(z);
      yv = imag(z);
      scale = 30.12;
   case 'Heart'
      t = 0:pi/64:pi;
      xv = sin(t);
      yv = sin(t)-2*cos(t)/3;
      xv = [-fliplr(xv) xv];
      yv = [fliplr(yv) yv]-1/3; 
      scale = 8.926;
   case 'Drum1'
      xv = [-3 -3 1 1 3 1 -1 -1 -3]/3;
      yv = [-3 -1 3 1 1 -1 -1 -3 -3]/3;
      scale = 14.96;
   case 'Drum2'
      xv = [-1 -3 -3 1 1 3 1 -1 -1]/3;
      yv = [-3 -1 1 1 3 1 -1 -1 -3]/3;
      scale = 15.35;
   case 'Hand'
      xv = [ ...
        0.4962, 0.5571, 0.6061, 0.6449, 0.6271, ...
        0.5932, 0.5689, 0.5398, 0.5005, 0.4860, ...
        0.4817, 0.4935, 0.4957, 0.4968, 0.4898, ...
        0.4779, 0.4618, 0.4575, 0.4569, 0.4564, ...
        0.4483, 0.4375, 0.4181, 0.4052, 0.3961, ...
        0.3815, 0.3691, 0.3514, 0.3298, 0.3347, ...
        0.3487, 0.3546, 0.3724, 0.3605, 0.3390, ...
        0.3142, 0.2798, 0.2722, 0.2561, 0.2496, ...
        0.2561, 0.2873, 0.2970, 0.3228, 0.3126, ...
        0.2884, 0.2518, 0.2313, 0.2151, 0.2130, ...
        0.2351, 0.2507, 0.2894, 0.2991, 0.3061, ...
        0.3131, 0.3239, 0.3363, 0.3562, 0.4962 ];
      yv = [ ...
        0.2086, 0.3199, 0.4158, 0.5009, 0.5344, ...
        0.5127, 0.4692, 0.4240, 0.4339, 0.5018, ...
        0.5697, 0.6638, 0.7335, 0.7833, 0.8403, ...
        0.8557, 0.8502, 0.8222, 0.7706, 0.7362, ...
        0.6783, 0.6122, 0.5950, 0.6421, 0.7145, ...
        0.7733, 0.8620, 0.8855, 0.8665, 0.8176, ...
        0.7443, 0.6882, 0.5860, 0.5860, 0.6412, ...
        0.7018, 0.8113, 0.8158, 0.8086, 0.7869, ...
        0.7543, 0.6566, 0.6222, 0.5371, 0.5308, ...
        0.5579, 0.6267, 0.6575, 0.6566, 0.6213, ...
        0.5724, 0.5353, 0.4611, 0.4204, 0.3633, ...
        0.3190, 0.2647, 0.2357, 0.2176, 0.2086 ];
      x_ave = mean ( xv );
      y_ave = mean ( yv );
      xv = xv - x_ave;
      yv = yv - y_ave;

      xv = 2.5 * xv;
      yv = 2.5 * yv;

      scale = 30.0;
end
