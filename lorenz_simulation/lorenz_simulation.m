function lorenz_simulation ( action )

%% LORENZ_SIMULATION plots the orbit around the Lorenz chaotic attractor.
%
%  Discussion:
%
%    This program is a modification of the "lorenzdemo" program that
%    is part of the MATLAB demo set.
%
%    We modified the original program because we wanted to be able to
%    vary the initial condition for the integration.  This turned out to
%    be far more difficult than we realized, since the "lorenzdemo"
%    program is full of code that looks important, but actually is not used.  
%
%    The key is that the "lorenzdemo" displays some buttons, and as soon
%    as you push a button, it calls "lorenz", which is a built in MATLAB
%    function.  This function is probably the same as "lorenzdemo".  
%    However, if you change "lorenzdemo", you have not changed "lorenz"!
%    In other words, you can make all the changes you want to "lorenzdemo",
%    but most of them will have no effect whatsoever, since "lorenzdemo"
%    actually calls "lorenz".
%
%    This version, with the altered name "lorenz_simulation", calls itself.
%    Thus, if you change this code, you will see a change when you run it.
%    For our purposes, we were able to change the initial condition Y0, and
%    have that effect the calculation as we wanted.
%
%    Note, also, that the ordering of the variables is somewhat different
%    than is to be seen in other contexts.  
%
%    The original comments follow:
%
%    This demo animates the integration of the
%    three coupled nonlinear differential equations
%    that define the "Lorenz Attractor", a chaotic
%    system first described by Edward Lorenz of
%    the Massachusetts Institute of Technology.
%
%    As the integration proceeds you will see a
%    point moving around in a curious orbit in
%    3-D space known as a strange attractor. The
%    orbit is bounded, but not periodic and not
%    convergent (hence the word "strange").
%
%    Use the "Start" and "Stop" buttons to control
%    the animation.
%
%    Adapted for Demo by Ned Gulley, 6-21-93; jae Roh, 10-15-96
%    Copyright 1984-2004 The MathWorks, Inc.
%    $Revision: 5.13.4.1 $  $Date: 2004/08/16 01:38:31 $
 
% The values of the global parameters are:

global SIGMA RHO BETA
SIGMA = 10.;
RHO =28.;
BETA = 8./3.;
 
% Possible actions:
% initialize
% close
 
% Information regarding the play status will be held in
% the axis user data according to the following table:
play= 1;
 
if nargin<1,
    action='initialize';
end
 
switch action
    case 'initialize'
        oldFigNumber=watchon;
 
        figNumber=figure( ...
            'Name','Lorenz Attractor', ...
            'NumberTitle','off', ...
            'Visible','off');
        colordef(figNumber,'black')
        axes( ...
            'Units','normalized', ...
            'Position',[0.05 0.10 0.75 0.95], ...
            'Visible','off');
 
        text(0,0,'Press the "Start" button to see the Lorenz demo', ...
            'HorizontalAlignment','center');
        axis([-1 1 -1 1]);
 
        %===================================
        % Information for all buttons
        xPos=0.85;
        btnLen=0.10;
        btnWid=0.10;
        % Spacing between the button and the next command's label
        spacing=0.05;
 
        %====================================
        % The CONSOLE frame
        frmBorder=0.02;
        yPos=0.05-frmBorder;
        frmPos=[xPos-frmBorder yPos btnLen+2*frmBorder 0.9+2*frmBorder];
        uicontrol( ...
            'Style','frame', ...
            'Units','normalized', ...
            'Position',frmPos, ...
            'BackgroundColor',[0.50 0.50 0.50]);
 
        %====================================
        % The START button
        btnNumber=1;
        yPos=0.90-(btnNumber-1)*(btnWid+spacing);
        labelStr='Start';
        callbackStr='lorenz_simulation ( ''start'' );';
 
        % Generic button information
        btnPos=[xPos yPos-spacing btnLen btnWid];
        startHndl=uicontrol( ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',btnPos, ...
            'String',labelStr, ...
            'Interruptible','on', ...
            'Callback',callbackStr);
 
        %====================================
        % The STOP button
        btnNumber=2;
        yPos=0.90-(btnNumber-1)*(btnWid+spacing);
        labelStr='Stop';
        % Setting userdata to -1 (=stop) will stop the demo.
        callbackStr='set(gca,''Userdata'',-1)';
 
        % Generic  button information
        btnPos=[xPos yPos-spacing btnLen btnWid];
        stopHndl=uicontrol( ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',btnPos, ...
            'Enable','off', ...
            'String',labelStr, ...
            'Callback',callbackStr);
 
        %====================================
        % The INFO button
        labelStr='Info';
        callbackStr='lorenz_simulation ( ''info'' )';
        infoHndl=uicontrol( ...
            'Style','push', ...
            'Units','normalized', ...
            'position',[xPos 0.20 btnLen 0.10], ...
            'string',labelStr, ...
            'call',callbackStr);
 
        %====================================
        % The CLOSE button
        labelStr='Close';
        callbackStr='close(gcf)';
        closeHndl=uicontrol( ...
            'Style','push', ...
            'Units','normalized', ...
            'position',[xPos 0.05 btnLen 0.10], ...
            'string',labelStr, ...
            'call',callbackStr);
 
        % Uncover the figure
        hndlList=[startHndl stopHndl infoHndl closeHndl];
        set(figNumber,'Visible','on', ...
            'UserData',hndlList);
 
        watchoff(oldFigNumber);
        figure(figNumber);
 
    case 'start'
        axHndl=gca;
        figNumber=gcf;
        hndlList=get(figNumber,'UserData');
        startHndl=hndlList(1);
        stopHndl=hndlList(2);
        infoHndl=hndlList(3);
        closeHndl=hndlList(4);
        set([startHndl closeHndl infoHndl],'Enable','off');
        set(stopHndl,'Enable','on');
 
        % ====== Start of Demo
        set(figNumber,'Backingstore','off');
        % The graphics axis limits are set to values known
        % to contain the solution.
        set(axHndl, ...
            'XLim',[0 40],'YLim',[-35 10],'ZLim',[-10 40], ...
            'Userdata',play, ...
            'XTick',[],'YTick',[],'ZTick',[], ...
            'Drawmode','fast', ...
            'Visible','on', ...
            'NextPlot','add', ...
            'Userdata',play, ...
            'View',[-37.5,30]);
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
 
        % The orbit ranges chaotically back and forth around two different points,
        % or attractors.  It is bounded, but not periodic and not convergent.
        % The numerical integration, and the display of the evolving solution,
        % are handled by the function ODE23P.
 
        FunFcn='lorenzeq';
%
%  Put the random number generator into a different state.
%
        rand('twister',sum(100*clock))

        r = rand ( 1 );
        %
        % These initial condition produce interesting results:
        %
        if ( r < 0.05 )
          fprintf ( 1, '  Interesting initial condition\n' );
          y0 = [20 5 -5];
        %
        %  An "arbitrary" initial condition.
        %
        elseif ( r < 0.10 )
          fprintf ( 1, '  Arbitrary initial condition\n' );
          y0(1)=20;
          y0(2)=4;
          y0(3)=-5;
        %
        %  These initial conditions decay rapidly.
        %
        elseif ( r < 0.15 )
          fprintf ( 1, '  An initial condition with rapid decay.\n' );
          y0(1) = 0;
          y0(2) = 0;
          y0(3) =10;
        %
        %  These initial conditions decay to zero.
        %
        elseif ( r < 0.20 )
          fprintf ( 1, '  An initial condition with straight line decay.\n' );
          y0(1) = 10;
          y0(2) = 0;
          y0(3) = 0;
       %
       %  Most of the time, use a random initial condition.
       %
        else
         fprintf ( 1, '  A random initial condition.\n' );
         y0(1:3) = rand ( 3, 1 );
         y0(1) =               40 * ( 1.0 - y0(1) );
         y0(2) = -35 * y0(2) + 10 * ( 1.0 - y0(2) );
         y0(3) = -10 * y0(3) + 40 * ( 1.0 - y0(3) );
        end
        fprintf ( 1, '  Y0 = ( %f  %f  %f\n', y0(1:3) );

        t0=0;
        tfinal=100;
        pow = 1/3;
        tol = 0.001;
 
        t = t0;
        hmax = (tfinal - t)/5;
        hmin = (tfinal - t)/200000;
        h = (tfinal - t)/100;
        y = y0(:);
 
        % Save L steps and plot like a comet tail.
        L = 50;
        Y = y*ones(1,L);
 
        cla;
        head = line( ...
            'color','r', ...
            'Marker','.', ...
            'markersize',25, ...
            'erase','xor', ...
            'xdata',y(1),'ydata',y(2),'zdata',y(3));
        body = line( ...
            'color','y', ...
            'LineStyle','-', ...
            'erase','none', ...
            'xdata',[],'ydata',[],'zdata',[]);
        tail=line( ...
            'color','b', ...
            'LineStyle','-', ...
            'erase','none', ...
            'xdata',[],'ydata',[],'zdata',[]);
 
        % The main loop
        while (get(axHndl,'Userdata')==play) && (h >= hmin)
            if t + h > tfinal, h = tfinal - t; end
            % Compute the slopes
            s1 = feval(FunFcn, t, y);
            s2 = feval(FunFcn, t+h, y+h*s1);
            s3 = feval(FunFcn, t+h/2, y+h*(s1+s2)/4);
 
            % Estimate the error and the acceptable error
            delta = norm(h*(s1 - 2*s3 + s2)/3,'inf');
            tau = tol*max(norm(y,'inf'),1.0);
 
            % Update the solution only if the error is acceptable
            if delta <= tau
                t = t + h;
                y = y + h*(s1 + 4*s3 + s2)/6;
 
                % Update the plot
                Y = [y Y(:,1:L-1)];
                set(head,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1))
                set(body,'xdata',Y(1,1:2),'ydata',Y(2,1:2),'zdata',Y(3,1:2))
                set(tail,'xdata',Y(1,L-1:L),'ydata',Y(2,L-1:L),'zdata',Y(3,L-1:L))
                drawnow;
            end
 
            % Update the step size
            if delta ~= 0.0
                h = min(hmax, 0.9*h*(tau/delta)^pow);
            end
            
            % Bail out if the figure was closed.
            if ~ishandle(axHndl)
                return
            end
            
        end    % Main loop ...
        % ====== End of Demo
        set([startHndl closeHndl infoHndl],'Enable','on');
        set(stopHndl,'Enable','off');
 
    case 'info'
        helpwin(mfilename);
 
end    % if strcmp(action, ...
 
 
%===============================================================================
function ydot = lorenzeq(t,y)

%% LORENZEQ Equation of the Lorenz chaotic attractor.
%
%   ydot = lorenzeq(t,y).
%   The differential equation is written in almost linear form.
 
global SIGMA RHO BETA
 
A = [ -BETA    0     y(2)
    0  -SIGMA   SIGMA
    -y(2)   RHO    -1  ];
 
ydot = A*y;

