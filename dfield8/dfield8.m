function output = dfield8(action,input1,input2,input3)

% dfield8	is an interactive tool for studying single first order
%	differential equations.  When dfield8 is executed, a dfield8 Setup
%	window is opened.  The user may enter the differential
%	equation and specify a display window using the interactive
%	controls in the Setup window.
%
%	When the Proceed button is pressed on the Setup window, the DF
%	Display window is opened.  At first this window displays a
%	direction line field for the differential equation.  When the
%	mouse button is depressed in the dfield8 Display window, the
%	solution to the differential equation with that initial
%	condition is calculated and plotted.
%
%	Other options are available in the Options menu.  These are
%	fairly self explanatory.  The Settings option allows the user
%	to change several parameters.  Included here are the
%	possibilities of using a vector field instead of the default
%	line field, and of changing the number of field points computed
%	and displayed.

%  Copywright (c) 1995, 1997, 1998, 1999, 2000, 2001, 2002, 2003 
%                 John C. Polking Rice University
%  Last modified: April 2, 2003


  startstr = 'dfield8';

  if nargin < 1
    action ='initialize';
  end


  % disp(action)


  if strcmp(action,'initialize')
    
    % First we make sure that there is no other copy of dfield8
    % running, since this causes problems.	
    
    dfh = findobj('tag','dfield8');
    if ~isempty(dfh);
      qstring = {'There are some open dfield8 figures (perhaps invisible).  ';...
		 'What do you want to do?'};
      tstring = 'Only one copy of dfield8 can be open at one time.';
      b1str = 'Restart dfield8.';
      b2str = 'Just close those figures.';
      b3str = 'Do nothing.';
      answer = questdlg(qstring,tstring,b1str,b2str,b3str,b1str);
      if strcmp(answer,b1str)
	delete(dfh);
	eval(startstr);return
      elseif strcmp(answer,b2str)
	delete(dfh);return
      else
	return
      end 
    end  % if ~isempty(dfh);
    
    % Make sure tempdir is on the MATLABPATH.  We want to be sure that we
    % return the path to its current position when we exit.
    
    p = path;
    tmpdir = tempdir;
    ll = length(tmpdir);
    tmpdir = tmpdir(1:ll-1);
    ud.remtd = 0;
    if isempty(findstr(tmpdir,p))
      ud.remtd = 1;
      addpath(tempdir)
    end
    
    % Next we look for old files created by dfield8.
    
    oldfiles = dir('dftp*.m');
    kk = zeros(0,1);
    for k = 1:length(oldfiles)
      fn = oldfiles(k).name;
      fid = fopen(fn,'r');
      if fid ~= -1
	ll = fgetl(fid);
	ll = fgetl(fid);
	ll = fgetl(fid);
	fclose(fid);
	if strcmp(ll,'%% Created by dfield8')
	  delete(fn)
	else
	  kk = [kk;k];
	end
      end
    end
    oldfiles = dir([tempdir,'dftp*.m']);
    for k = 1:length(oldfiles)
      fn = [tempdir,oldfiles(k).name];
      fid = fopen(fn,'r');
      if fid ~= -1
	ll = fgetl(fid);
	ll = fgetl(fid);
	ll = fgetl(fid);
	fclose(fid);
	if isempty(findstr('%% Created by DF',ll))
	  kk = [kk;k];
	else
	  delete(fn)
	end
      end
    end
    if ~isempty(kk)
      fprintf('The following files\n');
      for j = 1:length(kk)
	fn = [tempdir,oldfiles(kk(j)).name];
	fn = strrep(fn,'\','\\');
	fprintf(['     ',fn,'\n']);
      end
      fprintf('may have been created by an older version of DFIELD.\n');
      fprintf('If so they should be deleted.\n\n');
    end
    
    style = 'white';
    dfdir = pwd;
    ssize = get(0,'defaultaxesfontsize');
    npts = 20;
    solver = 'Dormand-Prince';
    solvhandle = @dfdp45;
    if exist('dfstart','file')
      H = dfstart;
      if ~isempty(H)
	if isfield(H,'style')
	  style = H.style;
	end
	if isfield(H,'size')
	  ssize = H.size;
	end
	if isfield(H,'npts')
	  npts = H.npts;
	end
	if isfield(H,'dfdir')
	  dfdir = H.dfdir;  
	end
	if isfield(H,'solver')
	  solver = H.solver;  
	  switch solver
	   case 'Dormand-Prince'
	    solvhandle = @dfdp45;
	    
	   case 'Euler'	
	    solvhandle = @dfeul;
	    
	   case 'Runge-Kutta 2'	
	    solvhandle = @dfrk2;
	    
	   case 'Runge-Kutta 4'	
	    solvhandle = @dfrk4;
	    
	   otherwise
	    error('Undefined solver.');
	  end
	end
      end
    end
    if get(0,'screendepth') == 1
      style = 'bw';
    end
    ud.ssize = ssize;
    ud.dfdir = dfdir;
    comp = computer;
    if strcmp(comp,'PCWIN')
      ud.fontsize = 0.8*ud.ssize;
    else
      ud.fontsize = ud.ssize;
    end
    system.name = 'default equation';
    system.xname = 'x';
    system.tname = 't';
    system.der = ' x^2 - t';
    system.wind = [-2 10 -4 4];
    system.pname = {};
    system.pval = {};
    
    system(2).name = 'logistic equation';
    system(2).xname = 'P';
    system(2).tname = 't';
    system(2).der = ' r*P*(1 - P/K)';
    system(2).wind = [0 20 0 15];
    system(2).pname = {'r','K','',''};
    system(2).pval = {'0.75','10','',''};
    
    system(3).name = 'RC circuit';
    system(3).xname = 'V_c';
    system(3).tname = 't';
    system(3).der = '(A*cos(\omega*t) - V_c)/(R*C)';
    system(3).wind = [0 10 -5 5];
    system(3).pname = {'A'  '\omega'  'R'  'C'};
    system(3).pval = {'5'  '3'  '0.5'  '2'};

    system(4).name = 'RL circuit';
    system(4).xname = 'I';
    system(4).tname = 't';
    system(4).der = '(A*cos(\omega*t) - R*I)/L';
    system(4).wind = [0 10 -5 5];
    system(4).pname = {'A'  '\omega'  'R'  'L'};
    system(4).pval = {'5'  '3'  '3'  '2'};

    ud.c = system(1);	% Changed values.
    ud.o = system(1);	% Original values.
    ud.fieldtype = 'lines';
    ud.npts = npts;  
    ud.style = style;
    ud.settings.magn = 1.25;
    ud.settings.refine = 4;
    ud.settings.tol = 1e-6;
    ud.settings.solver = solver;
    ud.settings.solvhandle = solvhandle;
    ud.settings.stepsize = 0.1;
    ud.settings.hmax = 0;
    ud.settings.speed = 100;
    ud.system = system;
    switch style
     case 'black'
      color.temp = [1 0 0]; % red for temporary orbits
      color.orb = [1 1 0];  % yellow for orbits
      color.arrows = .5*[1 1 1];  % gray for arrows
      color.pline = [1 1 1];    
      color.level = [1,.5,.5];
      
     case 'white'
      color.temp = [1 0 0]; % red for temporary orbits
      color.orb = [0 0 1];  % blue for orbits
      color.arrows = .7*[1 1 1]; % gray for arrows
      color.pline = [0 0 0];    
      color.level = 0.8*[.9,.5,.8];
      
     case 'test'
      color.temp = [1 0 0]; % red for temporary orbits
      color.orb = [0 0 1];  % blue for orbits
      color.arrows = .7*[1 1 1]; % gray for arrows
      color.pline = [0 0 0];    
      color.level = [1,.5,.5];
      
     case 'display'
      color.temp = [1 0 0]; % red for temporary orbits
      color.orb = [0 0 1];  % blue for orbits
      color.arrows = .4*[1 1 1]; % gray for arrows
      color.pline = [0 0 0];   
      color.level = [255 150 10]/255;%  0.8*[.9,.5,.8];
      
     case 'bw'
      color.temp = [1 1 1]; % white for everything
      color.orb = [1 1 1];  
      color.arrows = [1 1 1];
      color.pline = [1 1 1];    
      color.level = [1,1,1];
    end
    ud.color = color;
    
    dfset = figure('name','dfield8 Setup','numb','off',...
		   'tag','dfield8','visible','off',...
		   'user',ud);
    
    dfield8('figdefault',dfset);
    frame(1) = uicontrol('style','frame','visible','off');
    eq(1)=uicontrol('style','text',...
		    'horizon','center',...
		    'string','The differential equation.','visible','off');
    ext = get(eq(1),'extent');
    rr=ext(4)/10;
    
    texth =ext(4)+4;      % Height of text boxes.
    varw = 40*rr;		% Length of variable boxes.
    equalw =13*rr;	% Length of equals.(30)
    eqlength = 230*rr;	% Length of right hand sides of equations.
    winstrlen = 120*rr;	% Length of string boxes in display frame.
    left = 1;		% Left margin of the frames.
    frsep = 1;    	% Separation between frames.
    separation = texth;	% Separation between boxes.
    
    disfrw = varw+equalw+eqlength+10;
    
    dfigwidth =2*left + disfrw;	% Width of the figure.
    dfigurebot = 60;	% Bottom of the figure.
    
    buttw = dfigwidth/3;
    qwind = [0,frsep,buttw,separation];	% Quit button
    rwind = [buttw,frsep,buttw,separation];	% Revert "
    pwind = [2*buttw,frsep,buttw,separation];	% Proceed "
    
    disfrbot = 2*frsep + separation;	% Display frame.
    disfrht = 3*separation + 10;
    disfrwind = [left, disfrbot, disfrw, disfrht];
    
    pfrbot = disfrbot + disfrht + frsep;
    pfrw = disfrw;
    pfrht = 2*separation + 10;
    pfrwind = [left, pfrbot, pfrw, pfrht];
    
    defrbot = pfrbot + pfrht + frsep;	% Equation frame.
    defrw = pfrw;
    defrht = 3*separation + 15;
    defrwind = [left, defrbot, defrw, defrht];
    
    dfigureheight = defrbot + defrht +frsep;	% Height of the figure.
    
    set(dfset,'pos',[30 dfigurebot dfigwidth dfigureheight]);
    
    set(frame(1),'pos',defrwind);
    
    
    xname=[
	'ud = get(gcf,''user'');'...
	'Xname=get(ud.h.xname,''string'');'...
	'set(ud.h.twind(3),''string'','...
	'[''The minimum value of '',Xname,'' = '']);'...
	'set(ud.h.twind(4),''string'','...
	'[''The maximum value of '',Xname,'' = '']);'...
	'ud.c.xname = Xname;'...
	'ud.flag = 0;'...
	'set(gcf,''user'',ud);'];
    
    tname=[
	'ud = get(gcf,''user'');'...
	'Tname=get(ud.h.tname,''string'');'...
	'set(ud.h.twind(1),''string'','...
	'[''The minimum value of '',Tname,'' = '']);'...
	'set(ud.h.twind(2),''string'','...
	'[''The maximum value of '',Tname,'' = '']);'...
	'ud.c.tname = Tname;'...
	'ud.flag = 0;'...
	'set(gcf,''user'',ud);'];
    
    der =[
	'ud = get(gcf,''user'');'...
	'ud.c.der = get(ud.h.der,''string'');'...
	'ud.flag = 0;'...
	'set(gcf,''user'',ud);'];
    
    equationbot = defrbot + 5;
    eqlabelbot = equationbot + 2*separation;
    derbot = equationbot + separation + 5;		% Bottom of equation.
    tbot = equationbot;				% Bottom of ind. var.
    
    lablen =200*rr;
    
    eqlableft = (dfigwidth-lablen)/2;
    eqleft = left + 5;
    fudge = 0.15*separation;
    set(eq(1),'pos',[eqlableft eqlabelbot lablen texth]);
    tcolor = get(gcf,'defaultuicontrolbackgroundcolor');
    ecolor = 'w';
    
    ud.h.xname=uicontrol('pos',[eqleft, derbot, varw, texth],...
			 'style','edit',...
			 'horizon','right',...
			 'string',ud.o.xname,...
			 'call',xname,...
			 'visible','off',...
			 'backgroundcolor',ecolor);
    
    eq(2) = uicontrol('style','text',...
		      'pos',[eqleft+varw derbot-fudge equalw texth],...
		      'horizon','center','string',''' = ','visible','off',...
		      'backgroundcolor',tcolor);
    
    ud.h.der=uicontrol('pos',[eqleft+varw+equalw derbot eqlength texth],...
		       'string',ud.o.der,...
		       'horizon','left','style','edit',...
		       'call',der,'visible','off','backgroundcolor',ecolor);
    
    eq(3) = uicontrol('style','text',...
		      'horizon','right',...
		      'string','The independent variable is ',...
		      'visible','off','backgroundcolor',tcolor);
    
    ext = get(eq(3),'extent');
    tnw = ext(3)+10;
    tvarl = eqleft + tnw;
    set(eq(3),'pos',[eqleft,tbot-fudge,tnw,texth]);
    
    ud.h.tname = uicontrol('pos',[tvarl tbot varw texth],...
			   'style','edit',...
			   'horizon','left',...
			   'string',ud.o.tname,...
			   'call',tname,...
			   'visible','off',...
			   'backgroundcolor',ecolor);
  
    pframe = uicontrol('style','frame','pos',pfrwind,'visible','on');
    
    pncall = [
	'[h,fig] = gcbo;'...
	'ud =  get(fig,''user'');'...
	'num = get(h,''user'');'...
	'ud.c.pname{num} = get(ud.h.pname(num),''string'');'...
	'ud.flag = 0;'...
	'set(gcf,''user'',ud);'];
    
    pvcall = [
	'[h,fig] = gcbo;'...
	'ud =  get(fig,''user'');'...
	'num = get(h,''user'');'...
	'ud.c.pval{num} = get(ud.h.pval(num),''string'');'...
	'ud.flag = 0;'...
	'set(gcf,''user'',ud);'];
    
    pnamew = 30*rr;
    peqw = 8*rr;
    pbot1 = pfrbot + 5;
    pbot2 = pbot1 +separation;
    pbot(1) = pbot2;
    pbot(2) = pbot1;
    
    
    paratit=uicontrol('style','text',...
		      'horizon','center',...
		      'string',{'Parameters';'&';'expressions:'},...
		      'visible','off','backgroundcolor',tcolor);
    
    ext = get(paratit,'extent');
    paratitw = ext(3);
    pos = [eqleft pbot(2) paratitw 2*texth];
    set(paratit,'pos',pos);
    
    psep = 20;
    pvalw = (dfigwidth - 2*eqleft - paratitw)/2 - psep - pnamew - peqw;
    pval = ud.c.pval;
    pname = ud.c.pname;
    for jj = 1:2
      for kk = 1:2
	pleft = eqleft + paratitw +psep +(kk-1)*(pnamew+peqw+pvalw+ psep);
	peqleft = pleft + pnamew;
	pvleft = peqleft + peqw;
	K = kk +2*(jj-1);
	if K > length(pname)
	  pname{K} = '';
	end
	name = pname{K};
	if K <= length(pval)
	  value = pval{K};
	else
	  value = '';
	end
	ud.h.pname(K) = uicontrol('style','edit',...
				  'pos',[pleft pbot(jj) pnamew texth],...
				  'horizon','right','string',name,...
				  'user',K,...
				  'call',pncall,...
				  'visible','off',...
				  'backgroundcolor','w');
	equal(K) = uicontrol('style','text',...
			     'pos',[peqleft pbot(jj)-fudge peqw texth],...
			     'horizon','center',...
			     'string','=',...
			     'visible','off');
	
	ud.h.pval(K) = uicontrol('style','edit',...
				 'pos',[pvleft pbot(jj) pvalw texth],...
				 'string',value,...
				 'call',pvcall,...
				 'visible','off',...
				 'user',K,...
				 'backgroundcolor','w');
      end
    end
    
    ud.c.pname = pname;
    ud.c.pval = pval;
    
    pbot = pbot + texth;
    
    
    frame(2) = uicontrol('style','frame','pos',disfrwind,'visible','off');
    
    w1 = [
	'ud = get(gcf,''user'');'...
	'nnn = 	str2num(get(ud.h.wind(1),''string''));'...
	'if isempty(nnn),',...
	'  set(ud.h.wind(1),''string'',''?'');',...
	'  nnn = NaN;',...
        'end,',...
	'ud.c.wind(1) = nnn;',...	    
	'set(gcf,''user'',ud);'];	
    
    w2 = [
	'ud = get(gcf,''user'');'...
	'nnn = 	str2num(get(ud.h.wind(2),''string''));'...
	'if isempty(nnn),',...
	'  set(ud.h.wind(2),''string'',''?'');',...
	'  nnn = NaN;',...
        'end,',...
	'ud.c.wind(2) = nnn;',...	    
	'set(gcf,''user'',ud);'];	
    
    w3 = [
	'ud = get(gcf,''user'');'...
	'nnn = 	str2num(get(ud.h.wind(3),''string''));'...
	'if isempty(nnn),',...
	'  set(ud.h.wind(3),''string'',''?'');',...
	'  nnn = NaN;',...
        'end,',...
	'ud.c.wind(3) = nnn;',...	    
	'set(gcf,''user'',ud);'];	
    
    w4 = [
	'ud = get(gcf,''user'');'...
	'nnn = 	str2num(get(ud.h.wind(4),''string''));'...
	'if isempty(nnn),',...
	'  set(ud.h.wind(4),''string'',''?'');',...
	'  nnn = NaN;',...
        'end,',...
	'ud.c.wind(4) = nnn;',...	    
	'set(gcf,''user'',ud);'];	
    
    
    winbot1 = disfrbot + disfrht - 5 - separation;
    winbot2 = winbot1 - separation;
    winbot3 = winbot2 - separation;
    
    windw = 40*rr;  
    twindw = (disfrw - 10)/2-windw;
    twindl = eqleft + twindw + windw;
    
    dwind = uicontrol('style','text',...
		      'pos',[eqleft winbot1 disfrw-10 texth],...
		      'horizon','center',...
		      'string','The display window.','visible','off',...
		      'backgroundcolor',tcolor);
    
    % ud.h.twind contains the handles to the text windows, and ud.h.wind
    % contains the handles to the edit windows.
    
    ud.h.twind(1) = uicontrol('style','text',...
			      'pos',[eqleft winbot2-fudge twindw texth],...
			      'horizon','right',...
			      'string',['The minimum value of ',ud.o.tname,' = '],...
			      'visible','off','backgroundcolor',tcolor);
    
    ud.h.wind(1) = uicontrol('style','edit',...
			     'pos',[eqleft+twindw winbot2 windw texth],...
			     'string',num2str(ud.o.wind(1)),...
			     'call',w1,'visible','off',...
			     'backgroundcolor',ecolor);
    
    ud.h.twind(2) = uicontrol('style','text',...
			      'pos',[eqleft winbot3-fudge twindw texth],...
			      'horizon','right',...
			      'string',['The maximum value of ',ud.o.tname,' = '],...
			      'visible','off','backgroundcolor',tcolor);
    
    ud.h.wind(2) = uicontrol('style','edit',...
			     'pos',[eqleft+twindw winbot3 windw texth],...
			     'string',num2str(ud.o.wind(2)),...
			     'call',w2,'visible','off',...
			     'backgroundcolor',ecolor);
    
    ud.h.twind(3)= uicontrol('style','text',...
			     'pos',[twindl winbot2-fudge twindw texth],...
			     'horizon','right',...
			     'string',['The minimum value of ',ud.o.xname,' = '],...
			     'visible','off','backgroundcolor',tcolor);
    
    ud.h.wind(3) = uicontrol('style','edit',...
			     'pos',[twindl+twindw winbot2 windw texth],...
			     'string',num2str(ud.o.wind(3)),...
			     'call',w3,'visible','off',...
			     'backgroundcolor',ecolor);
    
    ud.h.twind(4) = uicontrol('style','text',...
			      'pos',[twindl winbot3-fudge twindw texth],...
			      'horizon','right',...
			      'string',['The maximum value of ',ud.o.xname,' = '],...
			      'visible','off','backgroundcolor',tcolor);
    
    ud.h.wind(4) = uicontrol('style','edit',...
			     'pos',[twindl+twindw winbot3 windw texth],...
			     'string',num2str(ud.o.wind(4)),...
			     'call',w4,'visible','off',...
			     'backgroundcolor',ecolor);
    
    
    
    butt(1) = uicontrol('style','push',...
			'pos',qwind,...
			'string','Quit',...
			'call','dfield8(''quit'')',...
			'visible','off');
    
    butt(2) = uicontrol('style','push',...
			'pos',rwind,...
			'string','Revert',...
			'call','dfield8(''revert'')',...
			'visible','off');
  
    butt(3) = uicontrol('style','push',...
			'pos',pwind,...
			'string','Proceed',...
			'call','dfield8(''proceed'')',...
			'visible','off');
    
    hhsetup = get(0,'showhiddenhandles');
    set(0,'showhiddenhandles','on');
    
    delgall = ['sud = get(gcf,''user'');',...
	       'mh = get(sud.h.gallery,''children'');',...
	       'add = findobj(sud.h.gallery,''tag'',''add system'');',...
	       'mh(find(mh == add)) = [];',...
	       'delete(mh);',...
	       'set(sud.h.gallery,''user'',[]);',...
	       'set(findobj(''tag'',''load default''),''enable'',''on'')'];
    mefile = findobj(dfset,'label','&File');
    meedit = findobj(gcf,'label','&Edit');
    metools = findobj(gcf,'label','&Tools');
    meview = findobj(gcf,'label','&View');
    meinsert = findobj(gcf,'label','&Insert');
    delete([metools,meview,meinsert]);
    
    % File menu
    meexp = findobj(mefile,'label','&Export...');
    meprev = findobj(mefile,'label','Print Pre&view...');
    mepset = findobj(mefile,'label','Pa&ge Setup...');
    set(get(mefile,'child'),'vis','off');
    meload = uimenu(mefile,'label','Load an equation ...',...
		  'call','dfield8(''loadsyst'',''system'');',...
		  'pos',1);
  mesave = uimenu(mefile,'label','Save the current equation ...',...
		  'call','dfield8(''savesyst'',''system'');',...
		  'pos',2);
  meloadg = uimenu(mefile,'label','Load a gallery ...',...
		   'call','dfield8(''loadsyst'',''gallery'');',...
		   'separator','on','pos',3);
  mesaveg = uimenu(mefile,'label','Save a gallery ...',...
		   'call','dfield8(''savesyst'',''gallery'');',...
		   'tag','savegal','pos',4);
  medelg = uimenu(mefile,'label','Delete the current gallery',...
		  'call',delgall,'pos',5);
  melddg = uimenu(mefile,'label','Load the default gallery',...
		  'call','dfield8(''loadsyst'',''default'');',...
		  'enable','on',...
		  'tag','load default','pos',6);
  meproceed = uimenu(mefile,'label','Proceed','call',...
		       'dfield8(''proceed'')','separator','on',...
		       'accelerator','G','pos',7);
    merevert = uimenu(mefile,'label','Revert','call',...
		      'dfield8(''revert'')','separator','off','pos',8);
    set(mepset,'vis','on','pos',9);
    set(meprev,'vis','on','label','Page Pre&view...','pos',10);
    set(meexp,'vis','on','pos',11,'separator','off');
    merestart = uimenu(mefile,'label','Restart dfield8','call',...
		       'dfield8(''restart'')','separator','on','pos',12);
    mequit = uimenu(mefile,'label','Quit dfield8','call',...
		    'dfield8(''quit'')','separator','on','pos',13);
    
    % Edit menu.
    
    set(get(meedit,'child'),'vis','off');
    
    meclrf = uimenu(meedit,'label','Clear equations',...
		    'call',['ud = get(gcf,''user'');h = ud.h;',...
		    'set([h.xname,h.der,h.tname,h.der],''string'','''');'],...
		    'accelerator','E');
    
    pclear = [
	'ud = get(gcf,''user'');h = ud.h;',...
	'set([h.pname,h.pval],''string'','''');',...
	'ud.c.pname = {};',...
	'ud.c.pval = {};',...
	'set(gcf,''user'',ud);',...
	     ];
    meclrp = uimenu(meedit,'label','Clear parameters',...
		    'call',pclear,...
		    'accelerator','N');
    
    meclrwind = uimenu(meedit,'label','Clear display window',...
		       'call',['ud = get(gcf,''user'');',...
		    'set(ud.h.wind,''string'','''');'],...
		       'accelerator','D');
    
    allclear = [
	'ud = get(gcf,''user'');h = ud.h;',...
	'set([h.xname,h.der,h.tname],''string'','''');',...
	'set([h.pname,h.pval,h.wind],''string'','''');',...
	'ud.c.pname = {};',...
	'ud.c.pval = {};',...
	'set(gcf,''user'',ud);',...
	       ];
    
    meclrall = uimenu(meedit,'label','Clear all',...
		      'call',allclear,...
		      'accelerator','A',...
		      'separator','on');
    
    % Gallery menu.
   
    
    sysmenu = uimenu('label','Gallery','visible','off','pos',3);
    
    meadd = uimenu(sysmenu,'label','Add current equation to the gallery',...
		   'call','dfield8(''addgall'');','tag','add system');
    sep = 'on';
    
    for kk = 1:length(system)
      kkk = num2str(kk);
      if kk == 2, sep = 'off';end
      sysmen(kk) = uimenu(sysmenu,'label',system(kk).name,...
			  'call',['dfield8(''system'',',kkk,')'],...
			  'separator',sep,'visible','on');
    end
    set(sysmenu,'user',system);
    ud.h.gallery = sysmenu;
    set(0,'showhiddenhandles',hhsetup);
    ud.flag = 0;
    
    % Record the handles in the User Data of the Set Up figure.
    
    set(dfset,'user',ud);
    hhhh = findobj(dfset,'type','uicontrol');
    set(hhhh,'units','normal')
    
    set(dfset,'visible','on','resize','on');
    set(get(dfset,'children'),'visible','on');
    
    
  elseif strcmp(action,'revert')
    
    ud = get(gcf,'user');
    ud.c = ud.o;
    syst = ud.o;
    xname = syst.xname;
    tname = syst.tname;
    set(ud.h.xname,'string',xname);
    set(ud.h.tname,'string',tname);
    set(ud.h.der,'string',syst.der);
    set(ud.h.twind(1),'string',['The minimum value of ',tname,' = ']);
    set(ud.h.twind(2),'string',['The maximum value of ',tname,' = ']);
    set(ud.h.twind(3),'string',['The minimum value of ',xname,' = ']);
    set(ud.h.twind(4),'string',['The maximum value of ',xname,' = ']);
    for kk = 1:4
      set(ud.h.wind(kk),'string',num2str(syst.wind(kk)));
    end
    for kk = 1:4
      if kk <= length(syst.pname)
	name = syst.pname{kk};
      else 
	name = '';
      end
      if kk <= length(syst.pval)
	value = syst.pval{kk};
      else
	value = '';
      end
      set(ud.h.pname(kk),'string',name);
      set(ud.h.pval(kk),'string',value);
    end
    
    set(gcf,'user',ud);
    
  elseif strcmp(action,'proceed')
    
    % Proceed connects Setup with the Display window.
    
    dfset = gcf;
    sud = get(dfset,'user');
    sud.o = sud.c;
    set(dfset,'user',sud);
    
    % Some error checking that has to be done no matter what.
    
    WINvect = sud.c.wind;
    if any(isnan(WINvect))
      errmsg = ['One of the entries defining the display window ',...
		'is not a number.'];
      fprintf('\a')
      errordlg(errmsg,'dfield8 error','on');
      return
    end
    xstr = sud.c.xname;
    if isempty(xstr)
      errmsg = 'The dependent variable needs a name.';
      fprintf('\a')
      errordlg(errmsg,'dfield8 error','on');
      return
    end
    tstr = sud.c.tname;
    if isempty(tstr)
      errmsg = 'The independent variable needs a name.';
      fprintf('\a')
      errordlg(errmsg,'dfield8 error','on');
      return
    end
    if WINvect(2)<= WINvect(1)
      errmsg = ['The minimum value of ', tstr,...
		' must be smaller than the maximum value.'];
      fprintf('\a')
      errordlg(errmsg,'dfield8 error','on');
      return
    end
    if WINvect(4)<= WINvect(3)
      errmsg = ['The minimum value of ', xstr,...
		' must be smaller than the maximum value.'];
      fprintf('\a')
      errordlg(errmsg,'dfield8 error','on');
      return
    end
    
    %  sud.flag = 0 if this is the first time through for this equation, 
    %  sud.flag = 1 if only the window dimensions have been changed.
    
    % If sud.flag == 1 we only have to update things.
    
    if (sud.flag == 1)
      dfdisp = findobj('name','dfield8 Display');
      dud = get(dfdisp,'user');
      aud = get(dud.axes,'user');
      tstr = get(get(dud.axes,'title'),'string');
      wind = sud.c.wind(:);
      hmax = dud.settings.hmax;
      if (~all(wind == dud.syst.wind(:)))
	dwind = [wind(1); wind(3); -wind(2); -wind(4)];
	DY = [wind(2)-wind(1); wind(4)-wind(3)];
	hmax = min(hmax,DY(1)/4);
	aud.DY = DY;
	aud.cwind = wind - dud.settings.magn*[DY(1);-DY(1);DY(2);-DY(2)];
	set(dud.axes,'user',aud);
      end
      dud.syst = sud.c;
      dud.settings = sud.settings;
      dud.settings.hmax = hmax;
      set(dfdisp,'user',dud);
      dfield8('dirfield',dfdisp);
      
    else
      sud.flag = 1;
      set(dfset,'user',sud);	
      Arrflag = sud.fieldtype;
      NumbFPts = sud.npts;
      Xname = sud.c.xname;
      Tname = sud.c.tname;
      derivstr = sud.c.der;
      
      pname = sud.c.pname;
      parav = get(sud.h.pval,'string');
      
      % First remove the blanks.
      
      derivstr(find(abs(derivstr)==32))=[];
      
      for kk = 1:4
	paraval = parav{kk};
	if ~isempty(paraval)
	  paraval(find(abs(paraval)==32))=[];
	  parav{kk} = paraval;
	end
      end
      
      % Next remove the periods inserted by users attempting to make the 
      % function array smart.
      
      l=length(derivstr);
      for ( k = fliplr(findstr('.',derivstr)))
	if (find('*/^' == derivstr(k+1)))
	  derivstr = [derivstr(1:k-1), derivstr(k+1:l)];
	end
	l=l-1;
      end
      for kk = 1:4
	paraval = parav{kk};
	l=length(paraval);
	for ( k = fliplr(findstr('.',paraval)))
	  if (find('*/^' == paraval(k+1)))
	    paraval = [paraval(1:k-1), paraval(k+1:l)];
	  end
	  l=l-1;
	end
	parav{kk} = paraval;
      end
      
      % Build strings for the title.
      txderstr = derivstr;
      
      kxder = find(abs(txderstr)==42);  % Get rid of *s
      txderstr(kxder)=' '*ones(size(kxder));
      txderstr = strrep(txderstr,'-',' - ');  % Extra spaces
      txderstr = strrep(txderstr,'+',' + ');
      if (abs(txderstr(1)) == 32)  % Get rid of starting space
	txderstr = txderstr(2:length(txderstr));
      end
      tstr = [Xname,' '' = ', txderstr];
      
      pstring = cell(4,1);
      pstring{1} = '';
      pstring{2} = '';
      pstring{3} = '';
      pstring{4} = '';
      
      for kk = 1:4
	if ~isempty(parav{kk});
	  tp1str = parav{kk};
	  
	  kxder = find(abs(tp1str)==42);  % Get rid of *s
	  tp1str(kxder)=' '*ones(size(kxder));
	  tp1str = strrep(tp1str,'-',' - ');  % Extra spaces
	  tp1str = strrep(tp1str,'+',' + ');
	  if (abs(tp1str(1)) == 32)  % Get rid of starting space
	    tp1str = tp1str(2:length(tp1str));
	  end
	  pstring{kk} = [pname{kk},' = ', tp1str];
	end
      end
      
      % Get ready to do some error trapping.
      
      SS = warning;
      warning off
      XxXxXx = WINvect(1) + rand*(WINvect(2)-WINvect(1));
      TtTtTt = WINvect(3) + rand*(WINvect(4)-WINvect(3));
      err = 0;
      
      % Now we remove the backslashes (\) used to get Greek into the
      % labels. 
      txname = Xname;
      ttname = Tname;   
      derivstr(find(abs(derivstr)==92))=[];
      Xname(find(abs(Xname)==92))=[];
      Tname(find(abs(Tname)==92))=[];
      
      eval([Xname,'=XxXxXx;'],'err = 1;');
      if err
	errmsg = ['"',xstr, '" is not a valid variable name in MATLAB.'];
	fprintf('\a')
	errordlg(errmsg,'dfield8 error','on');
	warning(SS)
	return
      end
      err = 0;
      eval([Tname,'=TtTtTt;'],'err = 1;');
      if err
	errmsg = ['"',tstr, '" is not a valid variable name in MATLAB.'];
	fprintf('\a')
	errordlg(errmsg,'dfield8 error','on');
	warning(SS)
	return
      end
      
      
      % Replace the parameters/expressions with their values.
      
      pflag = zeros(1,4);
      perr = [];
      pnameh = sud.h.pname;
      pvalh = sud.h.pval;
      for kk = 1:4;
	pn = char(get(pnameh(kk),'string'));
	pn(find(abs(pn)==92))=[];
	pv = char(get(pvalh(kk),'string'));
	if ~isempty(pn)
	  if isempty(pv) 
	    perr = pvalh(kk);
	  else 
	    if isempty(str2num(pv)) % This is an expression.
	      tpv = pv;
	      tpv(find(abs(tpv)==92))=[];
	      err = 0; pval = '';
	      eval(['pval = ',tpv,';'],'err=1;');   %pval;
	      if (err | isempty(pval))
		errmsg = ['The expression for ',pn,' is not valid.'];
		fprintf('\a')
		errordlg(errmsg,'dfield8 error','on');
		warning(SS)
		return
	      end
	    end
	    xderivstr = dfield8('paraeval',pn,pv,derivstr);
	    if ~strcmp(xderivstr,derivstr)
	      pflag(kk) = 1;
	      derivstr = xderivstr;
	    end
	  end
	end
      end
      
      % We have to make the derivative strings array smart.
      
      l = length(derivstr);
      for (k=fliplr(find((derivstr=='^')|(derivstr=='*')|(derivstr=='/'))))
	derivstr = [derivstr(1:k-1) '.' derivstr(k:l)];
	l = l+1;
      end
      
      % Some more error trapping.
      
      eval(['res = ',derivstr, ';'],'err = 1;');
      if err | isempty(res)
	if isempty(perr)
          errmsg = ['The differential equation ',...
		    'is not entered correctly.'];
	else
          errstr1 = 'The differential equation does not evaluate correctly.';
          errstr2 = 'At least one of the parameter values is not a number.';
          errmsg = str2mat(errstr1,errstr2);
          set(perr,'string','?');
	end
	fprintf('\a')
	errordlg(errmsg,'dfield8 error','on');
	dfield8('restart');
	warning(SS);
	return
      end
      warning(SS);
      
      % Build a new derivative m-file.
      
      tee = clock;
      tee = ceil(tee(6)*100);
      dfcn=['dftp',num2str(tee)];
      fcnstr = ['function YYyYypr = ',dfcn,'(TtTt,YyYy)\n\n'];
      commstr = '%%%% Created by dfield8\n\n';
      varstr = [Xname,' = YyYy;', Tname,' = TtTt;\n\n'];
      lenstr = ['l = length(YyYy);\n'];
      derstr1 = ['YYyYypr = ', derivstr,';\n'];
      derstr2 = ['if (length(YYyYypr) < l) YYyYypr = YYyYypr*ones(1,l);end\n'];
      
      dff = fopen([tempdir,dfcn,'.m'],'w');
      fprintf(dff,fcnstr);
      fprintf(dff,commstr);
      fprintf(dff,varstr);
      fprintf(dff,lenstr);
      fprintf(dff,derstr1);
      fprintf(dff,derstr2);
      fclose(dff);
      
      
      % Find dfield8 Display if it exists.	
      % If dfield8 Display exists, update it.  If it does not build it.
      
      dfdisp = findobj('name','dfield8 Display');
      if (~isempty(dfdisp))
	figure(dfdisp);
	dud = get(dfdisp,'user');
	dud.syst = sud.c;
	dud.settings = sud.settings;
	dfcnn = dud.function;
	  if exist(dfcnn) == 2
	    delete([tempdir,dfcnn,'.m'])
	  end
	  
      else
	dfdisp = figure('name','dfield8 Display',...
			'numb','off','interrupt','on',...
			'visible','off','tag','dfield8');
	dfield8('figdefault',dfdisp);
	dud = get(dfdisp,'user');	
	dud.syst = sud.c;
	dud.settings = sud.settings;
	fs = dud.fontsize;
	ssize = dud.ssize;
	r = ssize/10;
	dfaxw = 437*1.2;	% Default axes width
	dfaxh = 315*1.2;	% Default axes height
	dfaxl = 45*1.2;	% Default axes left
	buttw = 40*1.2;     % Default button width
	uni = get(0,'units');
	set(0,'units','pixels');
	ss = get(0,'screensize');
	style = sud.style;
	set(0,'units',uni);
	
	nframeh = 70;   % Default notice frame height
	dfaxb = 4+nframeh+35;
	
	titleh = 30;
	bottomedge = 38;
	dfdh = dfaxh + nframeh + titleh + bottomedge;
	
	sw = ss(3);sh = ss(4);
	bottom = 20;
	
	
	if r*dfdh > sh - bottom -35;
	  r = (sh-bottom-35)/dfdh;
	  fs = 10*r;
	  lw = 0.5*r;
	  set(gcf,'defaultaxesfontsize',fs,'defaultaxeslinewidth',lw);
	  set(gcf,'defaulttextfontsize',fs);
	  set(gcf,'defaultlinelinewidth',lw);
	  set(gcf,'defaultuicontrolfontsize',fs*0.9);
	end
	
	% Set up the bulletin window.
	
	nframe = uicontrol('style','frame','visible','on');
	nstr = {'More';'than';'five';'lines';'of text'};
	dud.notice = uicontrol('style','text',...
			       'horiz','left',...
			       'string',nstr,'visible','on');
	ext = get(dud.notice,'extent');
	nframeh = ext(4)+2;
	
	titleh = r*titleh;
	dfaxl = r*dfaxl;
	buttw = r*buttw;
	butth = fs+20*r;
	
	dfaxw = r*dfaxw;
	dfaxh = r*dfaxh;
	dfaxb = nframeh+r*bottomedge;
	buttl = dfaxl + dfaxw + 5;
	buttsep = (dfaxh - butth)/2;
	
	% Set up the coordinate display
	
	cstr = '(0.9999, 0,9999)';
	dud.ccwind = uicontrol('style','text',...
			       'horiz','left',...
			       'string',cstr,...
			       'visible','on');
	cext = get(dud.ccwind,'extent');
	ccwindtxt = uicontrol('style','text',...
			      'horiz','left',...
			      'string','Cursor position: ',...
			      'visible','on');
	cwh = cext(4);
	cww = cext(3);
	
	% Set up the plot axes.
	
	dud.axes = axes('units','pix',...
			'position',[dfaxl,dfaxb,dfaxw,dfaxh],...
			'next','add',...
			'box','on',...
			'interrupt','on',...
			'xgrid','on',...
			'ygrid','on',...
			'drawmode','fast',...
			'visible','off',...
			'tag','display axes');
	
	% Finish the positions.
	
	dfdw = buttl + buttw +5;
	dfdh = dfaxb+dfaxh+titleh;
	set(nframe,'pos',[10,1,dfdw-20,nframeh]);
	set(dud.notice,'pos',[15,1,dfdw-30,nframeh-2],...
		       'string',{' ';' ';' ';' ';' '});
	
	ctext = get(ccwindtxt,'extent');
	cc1pos = [dfaxl,2+nframeh,ctext(3),cwh];
	cc2pos = [dfaxl+ctext(3),2+nframeh,cww,cwh];
	set(ccwindtxt,'pos',cc1pos);
	set(dud.ccwind,'pos',cc2pos,...
		       'string','');
	dfdleft = max((sw-dfdw)/2,sw-dfdw-60);
	dfdbot = sh - dfdh - 70;
	dfdpos = [dfdleft,dfdbot,dfdw,dfdh];
	set(dfdisp,'resize','on');
	set(dfdisp,'pos',dfdpos);
	
	Arrflag = sud.fieldtype;
	
	% Set up the buttons and the menu.
	
	stopstr = 'aud = get(gca,''user'');aud.stop = 4;set(gca,''user'',aud);';
	
	dbutt(1) = uicontrol('style','push',...
			     'pos',[buttl,dfaxb+2*buttsep,buttw,butth],...
			     'string','Stop',...
			     'call',stopstr,...
			     'vis','off',...
			     'tag','stop');
	
	dbutt(2) = uicontrol('style','push',...
			     'pos',[buttl,dfaxb,buttw,butth],...
			     'string','Quit',...
			     'call','dfield8(''quit'')',...
			     'visible','off');
	
	dbutt(3) = uicontrol('style','push',...
			     'pos',[buttl,dfaxb+buttsep,buttw,butth],...
			     'string','Print',...
			     'call','dfield8(''print'')',...
			     'visible','off');	
      
	dud.butt = dbutt;
	hhsetup = get(0,'showhiddenhandles');
	set(0,'showhiddenhandles','on');
	
	
	% File menu
	
	fmenu = findobj(gcf,'label','&File'); 
	delete(findobj(fmenu,'label','&New Figure'));
	delete(findobj(fmenu,'label','&Open...'));
	delete(findobj(fmenu,'label','&Close'));
	set(findobj(fmenu,'label','&Save'),...
	    'separator','off',...
	    'pos',1);
	set(findobj(fmenu,'label','Save &As...'),...
	    'pos',2);
	delete(findobj(fmenu,'label','Pre&ferences...'));
	set(findobj(fmenu,'label','&Export...'),...
	    'pos',3);
	set(findobj(fmenu,'label','Pa&ge Setup...'),'pos',4,...
			  'separator','on');
	set(findobj(fmenu,'label','Print Pre&view...'),'pos',5);
	set(findobj(fmenu,'label','Print Set&up...'),'pos',6);
	set(findobj(fmenu,'label','&Print...'),'pos',7);
	merestart = uimenu(fmenu,'label','Restart dfield8','call',...
			   'dfield8(''restart'')','separator','on','pos',8);
	
	mequit = uimenu(fmenu,'label','Quit dfield8',...
			'call','dfield8(''quit'')','separator','on');
	
	% Tools menu
	
	tmenu = findobj(gcf,'label','&Tools'); 
	delete(tmenu);
	
	% Insert menu
	
	imenu = findobj(gcf,'label','&Insert');
	inschild = get(imenu,'child');
	legitem = findobj(inschild,'label','&Legend');
	colitem = findobj(inschild,'label','&Colorbar');
	delete([legitem,colitem]);
	
	
	% Edit menu
	
	emenu = findobj(gcf,'label','&Edit'); 
	menu(2) = uimenu(emenu,'label','Zoom in.',...
			 'call','dfield8(''zoomin'')',...
			 'pos',1);
	
	zbmenu = uimenu(emenu,'label','Zoom back.',...
			'call','dfield8(''zoomback'')',...
			'enable','off',...
			'tag','zbmenu',...
			'pos',2);
	
	metext = uimenu(emenu,'label','Enter text on the Display Window.',...
			'call','dfield8(''text'')',...
			'separator','on',...
			'pos',3);
	
	medel = uimenu(emenu,'label','Delete a graphics object.',...
		       'call','dfield8(''delete'')',...
		       'visible','on',...
		       'pos',4);
	medall = uimenu(emenu,'label','Erase all solutions.',...
			'call','dfield8(''dallsol'')',...
			'separator','off',...
			'pos',5);
	
	medalllev = uimenu(emenu,'label','Erase all level curves.',...
			   'call','dfield8(''dalllev'')',...
			   'separator','off',...
			   'pos',6);
	
	medall = uimenu(emenu,'label','Erase all graphics objects.',...
			'call','dfield8(''dall'')',...
			'separator','off',...
			'pos',7);
	
	set(findobj(emenu,'label','&Undo'),'separator','on',...
			  'pos',8);
	set(findobj(emenu,'label','Cu&t'),'pos',9);
	set(findobj(emenu,'label','&Copy'),'pos',10);
	set(findobj(emenu,'label','&Paste'),'pos',11);
	set(findobj(emenu,'label','&Select All'),'pos',12);
	set(findobj(emenu,'label','Copy &Figure'),'pos',13);
	set(findobj(emenu,'label','Copy &Options'),'pos',14);
	set(findobj(emenu,'label','F&igure Properties'),'pos',15);
	set(findobj(emenu,'label','&Axes Properties'),'pos',16);
	set(findobj(emenu,'label','C&urrent Object Properties'),'pos',17);
	
	% Options menu
	
	menu(1) = uimenu('label','Options','visible','off','pos',3);
	
	menukey = uimenu(menu(1),'label','Keyboard input.','call',...
			 'dfield8(''kbd'')');
	
	mesev   = uimenu(menu(1),'label','Plot several solutions.',...
			 'call','dfield8(''several'')');
	
	menulevel = uimenu(menu(1),'label','Plot level curves.',...
			   'call','dfield8(''level'')',...
			   'separator','off','tag','level');
	
	meexportdata = uimenu(menu(1),'label','Export solution data.',...
			      'call','dfield8(''export'')',...
			      'separator','off','tag','dexp');
	
	plcall = [
	    'ud = get(gcf,''user'');',...
	    'me = gcbo;',...
	    'label = get(me,''label'');',...  
	    'if strcmp(label,''Show the phase line.''),',...
	    '  set(me,''label'',''Hide the phase line.'');',...
	    '  ud.pline = ''on'';',...
	    '  set(ud.plineh,''vis'',''on'');',...	  
	    '  set(gcf,''user'',ud);',...
	    'else,',...
	    '  set(me,''label'',''Show the phase line.'');',...
	    '  ud.pline = ''off'';',...
	    '  set(ud.plineh,''vis'',''off'');',...	  
	    '  kk = find(ishandle(ud.plhand));',...	  
	    '  delete(ud.plhand(kk));',...
	    '  ud.plhand = [];',...	  
	    '  set(gcf,''user'',ud);',...
	    'end'];  
	
	mepline = uimenu(menu(1),'label','Show the phase line.',...
			 'call',plcall,'tag','pline','separator','on');	  
	
	mesolvset = uimenu(menu(1),'label','Solver settings.',...
			   'call','dfield8(''solvset'')');
	mesolve = uimenu(menu(1),'label','Solver.');
	
	solverstr = ['ud = get(gcf,''user'');',...
		     'me = gcbo;',...
		     'meud = get(me,''user'');',...
		     'ud.settings.refine = meud.refine;',...
		     'ud.settings.tol = meud.tol;',...
		     'ud.settings.solver = meud.solver;',...
		     'ud.settings.solvhandle = meud.solvhandle;',...
		     'ud.settings.stepsize = meud.stepsize;',...
		     'ud.settings.hmax = meud.hmax;',...
		     'set(ud.solver,''checked'',''off'');',...
		     'set(me,''checked'',''on'');',...
		     'set(gcf,''user'',ud);',...
		     'dfset = findobj(''name'',''dfield8 Setup'');',...
		     'sud = get(dfset,''user'');',...
		     'sud.settings = ud.settings;',...
		     'set(dfset,''user'',sud);',...
		     'dfield8(''solvset'');'];
	solver = dud.settings.solver;
	dpset.refine = 4;
	dpset.tol = 1e-6;
	dpset.solver = 'Dormand-Prince';
	dpset.solvhandle = @dfdp45;
	dpset.stepsize = 0;
	dpset.hmax = 0;
	if strcmp(solver,'Dormand-Prince')
	  dpch = 'on';
	else
	  dpch = 'off';
	end
	
	eulset.refine = 1;
	eulset.tol = 0;
	eulset.solver = 'Euler';
	eulset.solvhandle = @dfeul;
	eulset.stepsize = 0.1;
	eulset.hmax = 0;
	if strcmp(solver,'Euler')
	  eulch = 'on';
	else
	  eulch = 'off';
	end
	rk2set.refine = 1;
	rk2set.tol = 0;
	rk2set.solver = 'Runge-Kutta 2';
	rk2set.solvhandle = @dfrk2;
	rk2set.stepsize = 0.1;
	rk2set.hmax = 0;
	if strcmp(solver,'Runge-Kutta 2')
	  rk2ch = 'on';
	else
	  rk2ch = 'off';
	end
	rk4set.refine = 1;
	rk4set.tol = 0;
	rk4set.solver = 'Runge-Kutta 4';
	rk4set.solvhandle = @dfrk4;
	rk4set.stepsize = 0.1;
	rk4set.hmax = 0;
	if strcmp(solver,'Runge-Kutta 4')
	  rk4ch = 'on';
	else
	  rk4ch = 'off';
	end
	
	dud.solver(1) = uimenu(mesolve,'label','Dormand-Prince',...
			       'checked',dpch,...
			       'call',solverstr,'user',dpset);
	
	dud.solver(2) = uimenu(mesolve,'label','Euler',...
			       'checked',eulch,...
			       'call',solverstr,'user',eulset);
	
	dud.solver(3) = uimenu(mesolve,'label','Runge-Kutta 2',...
			       'checked',rk2ch,...
			       'call',solverstr,'user',rk2set);
	
	dud.solver(4) = uimenu(mesolve,'label','Runge-Kutta 4',...
			       'checked',rk4ch,...
			       'call',solverstr,'user',rk4set); 
	
	medir = uimenu(menu(1),'label','Solution direction.');
	
	directionstr = ['ud = get(gcf,''user'');',...
			'me = gcbo;',...
			'ud.dir = get(me,''user'');',...
			'set(ud.direction,''checked'',''off'');',...
			'set(me,''checked'',''on'');',...
			'set(gcf,''user'',ud);'];
	
	dud.direction(1) = uimenu(medir,'label','Both',...
				  'checked','on',...
				  'user',0,...
				  'call',directionstr);
	dud.dir = 0;
	
	dud.direction(2) = uimenu(medir,'label','Forward',...
				  'user',1,...
				  'call',directionstr);
	
	dud.direction(3) = uimenu(medir,'label','Back',...
				  'user',-1,...
				  'call',directionstr);
	
	meset   = uimenu(menu(1),'label','Window settings.',...
			 'call','dfield8(''settings'')');
	
	menu(6) = uimenu(menu(1),'label','Make the Display Window inactive.',...
			 'call','dfield8(''hotcold'')','separator','on');
	
	% View menu
	
	set(findobj(gcf,'label','&View'),'pos',4);
	set(findobj(gcf,'label','&Figure Toolbar'),...
	    'call','dfield8(''showbar'')');
	dud.menu = menu;
	
	set(dfdisp,'ToolBar','none');
	set(0,'showhiddenhandles',hhsetup);
	set(gcf,'WindowButtonDownFcn','dfield8(''down'')');
	set(dfdisp,'WindowButtonMotionFcn','dfield8(''cdisp'')');
	dud.uicont = [nframe,dud.notice,dbutt([1 2 3])];
	hh1 = [dud.axes,nframe,dud.notice,dbutt([1 2 3])];
	set(hh1,'units','norm');
	hh2 = [nframe,dud.notice,dbutt(2:3),dud.axes,dud.menu(1)];
	set(hh2,'visible','on');
	
	set(dfdisp,'vis','on');
	dud.printstr = 'print -noui';
	
	dud.pline = 'off';    
	dud.arr = [];
	dud.solhand = [];
	dud.plhand = [];
	dud.level = ' ';
	dud.contours = zeros(0,1);
      end   % if (~isempty(dfdisp))  & else
      
      dfdispa = dud.axes;
      axes(dfdispa);
      xlabel(Tname);
      ylabel(Xname);
      
      hv = get(0,'showhiddenhandles');
      set(0,'showhiddenhandles','on');
      set(findobj('tag','zbmenu'),'enable','off');
      set(0,'showhiddenhandles',hv);
      pf = pflag;
      k = find(pflag);
      if ~isempty(k)
	tstr = [tstr,'             '];
	for j = 1:length(k)
	  tstr = [tstr,'    ',pstring{k(j)}];
	end
      end
      
      title(tstr)
      
      % Initialize important information as user data.
      
      dud.function = dfcn;
	if ~isempty(dud.solhand)    
	  delete(dud.solhand);
	end    
	dud.solhand = [];	% Handles to solution curves.
	if isstruct(dud.arr)
	  hand = [dud.arr.lines;dud.arr.arrows];
	  delete(hand);
	end
	dud.arr = [];	% Handles for the direction and vector fields.
	dud.wmat = [];
	set(findobj('tag','pline'),'label','Show the phase line.');    
	dud.pline = 'off';
	kk = find(ishandle(dud.plhand));    
	delete(dud.plhand(kk));
	dud.plhand = [];    
	
	dud.color = sud.color;
	dud.fieldtype = Arrflag;
	dud.npts = NumbFPts;  
	
	ud.y = zeros(2,1);
	ud.i = 0;
	ud.line = 0;
	wind = dud.syst.wind(:);
	dwind = [wind(1); wind(3); -wind(2); -wind(4)];
	DY = [wind(2)-wind(1); wind(4)-wind(3)];
	ud.DY = DY;  
	ud.cwind = wind - dud.settings.magn*[DY(1);-DY(1);DY(2);-DY(2)];
	ud.stop = 0;
	ud.gstop = 1;
	ud.plot = 1;
	hmax = DY(1)/10;
	dud.settings.hmax = hmax;
	mud = get(dud.solver(1),'user');
	mud.hmax = hmax;
	set(dud.solver(1),'user',mud);
	set(dfdisp,'user',dud);
	set(dud.axes,'user',ud);
	ppkbd = findobj('name','dfield8 Keyboard input','vis','on');
	if ~isempty(ppkbd),dfield8('kbd'),end
	dfield8('dirfield',dfdisp);	
    end
    
    
  elseif strcmp(action,'dirfield')
  
    % 'dirfield' computes and plots the field elements.  This is the entry
    % point both from 'proceed' and from later commands that require the
    % recomputation of the field elements.
    
    % Find dfield8 Display and get the user data.
    
    disph = input1;   
    
    dud = get(disph,'user');
    color = dud.color;
    
    dfcn = dud.function;
      dfdispa = dud.axes;
      WINvect = dud.syst.wind;
      settings = dud.settings;
      notice = dud.notice;
      if notice
	nstr = get(notice,'string');
	nstr(1:4)=nstr(2:5);
	nstr{5,1} = 'Computing the field elements.';
	set(notice,'string',nstr);
	
	% Augment the window matrix
	
	wmat = dud.wmat;
	wrows = size(wmat,1);
	wflag = 0;
	for k = 1:wrows
	  if wmat(k,:)==WINvect
	    wflag = 1;
	  end
	end
	if wflag == 0
	  wmat = [wmat;WINvect];
	  dud.wmat = wmat;
	end
	if wrows 
	  hv = get(0,'showhiddenhandles');
	  set(0,'showhiddenhandles','on');
	  hhh = findobj('tag','zbmenu');
	  set(hhh,'enable','on');
	  set(0,'showhiddenhandles',hv);
	end
      end
      
      
      Tmin = WINvect(1);
      Tmax = WINvect(2);
      Xmin = WINvect(3);
      Xmax = WINvect(4);
      
      N = dud.npts;
      deltax=(Xmax - Xmin)/(N-1);
      deltat=(Tmax - Tmin)/(N-1);
      
      % Set up the display window.
      
      Dxint=[Xmin-deltax,Xmax+deltax];
      Dtint=[Tmin-deltat,Tmax+deltat];
      
      % Set up the original mesh.
      
      XXXg=Xmin + deltax*[0:N-1];
      TTTg=Tmin + deltat*[0:N-1];
      
      [Tt,Xx]=meshgrid(TTTg,XXXg);
      
      % Calculate the line and vector fields.
      
      Xx=Xx(:);Tt=Tt(:);
      Ww = zeros(size(Xx));
      Ww = feval(dfcn,Tt',Xx');
      Vv = ones(size(Ww)) + Ww*sqrt(-1);
      Vv = Vv.';
      Arrflag = dud.fieldtype;
      
      
      mgrid = Tt+Xx.*sqrt(-1); % mgrid = mgrid(:);
      zz=Vv.';
      sc = min(deltat,deltax);
      
      arrow=[-1,1].';
      zzz=sign(zz);
      scale = sqrt((real(zzz)/deltat).^2+(imag(zzz)/deltax).^2);
      ww = (zzz == 0);
      scale = scale + ww;
      aa1 = 0.3*arrow*(zzz./scale)+ones(size(arrow))*(mgrid.');
      [r,c] = size(aa1);
      aa1=[aa1;NaN*ones(1,c)];
      aa1=aa1(:);
      
      arrow = [0,1,.7,1,.7].' + [0,0,.25,0,-.25].' * sqrt(-1);
      zz=sign(zz).*((abs(zz)).^(1/3));
      scale = 0.9*sc./max(max(abs(zz)));
      aa2 = scale*arrow*zz +ones(size(arrow))*(mgrid.');
      [r,c] = size(aa2);
      aa2=[aa2;NaN*ones(1,c)];
      aa2=aa2(:);
      axes(dfdispa);
      
      arr = dud.arr;	% Delete the old field data.
      if isstruct(arr)
	hand = [arr.lines;arr.arrows];  
	delete(hand);
      end
      arrh1 = plot(real(aa1),imag(aa1),'color',color.arrows,'visible','off');
      arrh2 = plot(real(aa2),imag(aa2),'color',color.arrows,'visible','off');
      
      % We plot both the line field and the vector field.  Then we
      % control which is seen by manipulating the visibility.
      
      switch Arrflag
       case 'lines'
	set(arrh1,'visible','on');
       case 'arrows'
	set(arrh2,'visible','on');
      end
      dud.arr.lines = arrh1;	   % Save the handles for later use.
      dud.arr.arrows = arrh2;	   % Save the handles for later use.
      
      if notice
	nstr = get(notice,'string');
	nstr(1:4) = nstr(2:5);
	nstr{5,1} = 'Ready.';
	set(notice,'string',nstr);
      end
      axis([Dtint,Dxint]);
      aa = Dtint(1) + (Dtint(2) - Dtint(1))/100;
      if ~isempty(dud.plhand)
	set(dud.plhand,'xdata',aa);
      end
      if (isfield(dud,'plineh') & (~isempty(dud.plineh)))
	set(dud.plineh,'xdata',[aa,aa],'ydata',Dxint);
      else
	dud.plineh = plot([aa,aa],Dxint,'color',dud.color.pline);
      end
      set([dud.plhand;dud.plineh],'vis',dud.pline);  
      set(disph,'user',dud);
      
  elseif strcmp(action,'hotcold')

    % 'hotcold' is the callback for the menu selection that makes the
    % Display Window active or inactive.
    
    dfdisp = gcf;
    dud = get(dfdisp,'user');
    nstr = get(dud.notice,'string');
    nstr(1:4) = nstr(2:5);
    mehc = dud.menu(6);
    if (findstr(get(mehc,'label'),'inactive'))
      set(dfdisp,'WindowButtonDownFcn',' ');
      set(mehc,'label','Make the Display Window active.');
      nstr{5,1} = 'The Display Window is not active.';
      set(dud.notice,'string',nstr);
    else
      set(dfdisp,'WindowButtonDownFcn','dfield8(''down'')');
      set(mehc,'label','Make the Display Window inactive.');
      nstr{5,1} = 'The Display Window is active.';
      set(dud.notice,'string',nstr);
    end
    
  elseif strcmp(action,'down')
  
    % 'down' is the Window Button Down call.  It starts the computation of
    % solutions from a click of the mouse.
    
    disph = gcf;
    seltype = get(disph,'selectiontype');
    if strcmp(seltype,'alt')
      dfield8('zoom');
      return
    end
    dud = get(disph,'user');
    ax = dud.axes;
    ch = findobj('type','uicontrol','enable','on');
    %  mh = findobj('type','uimenu','enable','on');
    set(ch,'enable','inactive');
    %  set(mh,'enable','off');
    wbdf = get(disph,'WindowbuttonDownFcn');
    set(disph,'WindowbuttonDownFcn','');
    axes(ax);
    initpt = get(ax,'currentpoint');
    initpt = initpt(1,[1,2]);
    dfield8('solution',initpt,disph);
    set(disph,'WindowbuttonDownFcn',wbdf);
    %  set([ch;mh],'enable','on');
    set(ch,'enable','on');
    notice = dud.notice;
    if notice
      nstr = get(notice,'string');
      nstr(1:4) = nstr(2:5);
      nstr{5,1} = 'Ready.';
      set(notice,'string',nstr)
    end
    
  elseif strcmp(action,'several')
  
    % 'several' allows the user to pick several initial points at once.
    % This is not needed in X-windows, but it is on the Macintosh.
    
    disph = gcf;
    ch = findobj('type','uicontrol','enable','on');
    %  mh = findobj('type','uimenu','enable','on');
    set(ch,'enable','inactive');
    %  set(mh,'enable','off')
    wbdf = get(disph,'WindowbuttonDownFcn');
    set(disph,'WindowbuttonDownFcn',wbdf);
    dud = get(disph,'user');
    notice = dud.notice;
    if notice
      nstr = get(notice,'string');
      nstr(1:4) = nstr(2:5);
      nstr{5,1} = ['Pick initial points with the mouse.  ',...
		   'Enter "Return" when finished.'];
      set(notice,'string',nstr)
    end
    [X,Y]=ginput;
    NN = length(X);
    for k = 1:NN
      initpt = [X(k),Y(k)];
      dfield8('solution',initpt,disph);
    end
    if notice
      nstr = get(notice,'string');
      nstr(1:4) = nstr(2:5);
      nstr{5,1} = 'Ready.';
      set(notice,'string',nstr);
    end
    %  set([ch;mh],'enable','on');
    set(ch,'enable','on');
    set(disph,'WindowbuttonDownFcn','dfield8(''down'')');
    
    
  elseif strcmp(action,'solution')

    % 'solution' effects the computation and (erasemode == none) plotting of
    % solutions.  It also stores the data as appropriate.
    
    disph = input2;
    dud = get(disph,'user');
    tcol = dud.color.temp;
    pcol = dud.color.orb;
    notice = dud.notice;
    initpt = input1(:);
    dfcn = dud.function;
      dfdispa = dud.axes;
      aud=get(dfdispa,'user');  
      wind = aud.cwind;
      AA = wind(1);
      BB = wind(2);
      settings = dud.settings;
      ptstr = [' (',num2str(initpt(1),2), ', ', num2str(initpt(2),2), ')'];
      refine = settings.refine;
      tol = settings.tol;
      ud = get(dud.axes,'user');
      rtol = tol;
      atol = tol*ud.DY*1e-4';
      if length(initpt)  == 2
	switch dud.dir
	 case 0
	  intplus = [initpt(1), BB];
	  intminus = [initpt(1), AA]; 
	 case -1
	  intplus = [initpt(1), initpt(1)];
	  intminus = [initpt(1), AA]; 
	 case 1
	  intplus = [initpt(1), BB];
	  intminus = [initpt(1), initpt(1)];
	end
      else
	intplus = [initpt(1),initpt(4)];
	intminus = [initpt(1),initpt(3)];
	initpt = initpt([1:2]);
      end	    
      stopbutt =findobj('tag','stop');
      set(stopbutt,'vis','on','enable','on');
      
      solvhandle = settings.solvhandle;
      
      cflag = 0;
      if intplus(2)>intplus(1)
	cflag = cflag + 1;
	if notice
	  nstr = get(notice,'string');
	  nstr(1:4) = nstr(2:5);
	  nstr{5} = ['The forward orbit from',ptstr];
	  set(notice,'string',nstr);
	end
	drawnow				
	
	[tp,xp] = feval(solvhandle,dfcn,intplus,initpt(2),disph);
	aud = get(dfdispa,'user');
	hnew1 = aud.line;
	set(aud.pline,'erase','normal','color', pcol);  
	dud.plhand=[dud.plhand;aud.pline];   
      end		
      
      if intminus(2) < intminus(1)
	cflag = cflag + 2;
	if notice	
	  nstr = get(notice,'string');
	  nstr(1:4) = nstr(2:5);
	  nstr{5} = ['The backward orbit from',ptstr];
	  set(notice,'string',nstr);
	end
	drawnow
	
	[tm,xm] = feval(solvhandle,dfcn,intminus,initpt(2),disph);
	aud = get(dfdispa,'user');
	hnew2 = aud.line;
	set(aud.pline,'erase','normal','color', pcol);     
	dud.plhand=[dud.plhand;aud.pline];   
	set(stopbutt,'vis','off');
      end	  % if intminus(2) < intminus(1)	
      
      % Store the trajectory.
      
      switch cflag
       case 1 % positive only
	set(hnew1,'xdata',tp(:),'ydata',xp(:),'color',pcol);
	set(hnew1,'erase','normal');
	dud.solhand = [dud.solhand;hnew1];
	
       case 2 % negative only
	x = flipud(xm);
	t = flipud(tm);
	set(hnew2,'xdata',t(:),'ydata',x(:),'color',pcol);
	set(hnew2,'erase','normal');
	dud.solhand = [dud.solhand;hnew2];
	
       case 3 % both directions
	x = flipud(xm);
	t = flipud(tm);
	x=[x;xp];
	t=[t;tp];
	delete(hnew1);
	set(hnew2,'xdata',t(:),'ydata',x(:),'color',pcol);
	set(hnew2,'erase','normal');
	dud.solhand = [dud.solhand;hnew2];
      end	 % switch cflag
      set(disph,'user',dud);
      
  elseif strcmp(action,'kcompute')
  
    % 'kcompute' is the call back for the Compute 
    % button on the dfield8 Keyboard figure.
    
    compute = 1;
    kh = get(gcf,'user');
    dfdisp = findobj('name','dfield8 Display');
    if (isempty(dfdisp))
      dfield8('confused');
    end
    dud = get(dfdisp,'user');
    dfdispa = dud.axes;
    aud = get(dfdispa,'user');
    dfset = findobj('name','dfield8 Setup');
    sud = get(dfset,'user');
    ch = findobj('type','uicontrol','enable','on');
    set(ch,'enable','inactive');
    set(dfdisp,'WindowbuttonDownFcn','');
    xstr = get(kh.xval,'string');
    tstr = get(kh.tval,'string');
    pnameh = sud.h.pname;
    pvalh = sud.h.pval;
    pflag = zeros(1,4);
    perr = [];
    for kk = 1:4;
      pn = char(get(pnameh(kk),'string'));
      pv = char(get(pvalh(kk),'string'));
      if ~isempty(pn)
	if isempty(pv) 
	  perr = pvalh(kk);
	else 
	  xstr = dfield8('paraeval',pn,pv,xstr);
	  tstr = dfield8('paraeval',pn,pv,tstr);
	end
      end
    end
    xvalue = str2num(xstr);
    tvalue = str2num(tstr);
    
    
    if get(kh.spec,'value')
      t0 = str2num(get(kh.t0,'string'));
      tf = str2num(get(kh.tf,'string'));
      initpt = [tvalue,xvalue,t0,tf];
      if (length(initpt) ~= 4)
	warndlg({'Values must be entered for all of the entries.'},...
		'Illegal input');
	compute = 0;
      elseif tf <= t0
	warndlg({'The final time of the computation interval';...
		 'must be smaller than the initial time.'},'Illegal input');
	compute = 0;
      elseif (tvalue < t0) | (tvalue > tf)
	warndlg('The initial time must be in the computation interval.',...
		'Illegal input');
	compute = 0;
      end
      aud.gstop = 0;
      set(dfdispa,'user',aud);
    else
      initpt = [tvalue,xvalue];
      if (length(initpt) ~= 2)
	warndlg({'Values must be entered for all of the entries.'},...
		'Illegal input');
	compute = 0;
      end
    end	% if get(kh.spec,'value')
    
    if compute
      dfield8('solution',initpt,dfdisp);
    end
    nstr = get(dud.notice,'string');
    nstr(1:4) = nstr(2:5);
    nstr{5} = 'Ready.';
    set(dud.notice,'string',nstr)
    %  set([ch;mh],'enable','on');
    set(ch,'enable','on');
    set(dfdisp,'WindowbuttonDownFcn','dfield8(''down'')');
    aud.gstop = 1;
    set(dfdispa,'user',aud);
    
    
  elseif strcmp(action,'kbd')
    
    % 'kbd' is the callback for the Keyboard Input menu selection.  It 
    % sets up the dfield8 Keyboard figure which allows accurate input of 
    % initial values using the keyboard.
    
    ppkbd = findobj('name','dfield8 Keyboard input');
    if ~isempty(ppkbd)
      delete(ppkbd);
    end    
    dfdisp = gcf;
    dud = get(dfdisp,'user');
    Xname = dud.syst.xname;
    Tname = dud.syst.tname;
    xnstr = ['The initial value of ',Xname,' = '];
    tnstr = ['The initial value of ',Tname,' = '];
    
    ppkbd = figure('name','dfield8 Keyboard input',...
		   'vis','off',...
		   'numb','off','tag','dfield8');
    
    dfield8('figdefault',ppkbd);
    set(ppkbd,'menubar','none');
    
    kbd.fr1 = uicontrol('style','frame');
    
    kbd.fr2 = uicontrol('style','frame');
    
    kbd.inst = uicontrol('style','text','horiz','center',...
			 'string','Enter the initial conditions:');
    
    kbd.xname = uicontrol('style','text',...
			  'horiz','right','string',xnstr);
    
    kbd.tname = uicontrol('style','text',...
			  'horiz','right',...
			  'string',tnstr);
    
    kbd.tval = uicontrol('style','edit','background','w');
    
    kbd.xval = uicontrol('style','edit',...
			 'string','','call','','background','w');
    
    kbd.t0 = uicontrol('style','edit','background','w');
    
    kbd.tf = uicontrol('style','edit','background','w');
    
    tstring = ['<= ',Tname,' <='];
    kbd.t = uicontrol('style','text','string',tstring);
    
    kbd.spec = uicontrol('style','check','horiz','center',...
			 'string','Specify a computation interval.');
  
    kbd.comp = uicontrol('style','push',...		
			 'string','Compute','call','dfield8(''kcompute'')');
    
    kbd.close = uicontrol('style','push',...
			  'string','Close','call','close');
    
    nudge = 3; 
    left = 3; varl = 80; buttw = 60;
    xex = get(kbd.xname,'extent');
    ht = xex(4)+nudge;
    yex = get(kbd.tname,'extent');
    nwdth = max(xex(3),yex(3)) + nudge;
    varl = varl*ht/19;
    fr1bot = left + ht;
    fr1ht = 3*nudge + 2*ht;
    fr2bot = fr1bot + fr1ht;
    frw = 2*nudge + nwdth + varl;
    intb = fr1bot + nudge;
    specb = intb + ht + nudge;
    intext = get(kbd.t,'extent');
    tw = intext(3);
    newwidth = tw + 2*varl +2*nudge;
    frw = max(frw,newwidth);
    margin = (frw -tw - 2*varl)/2;
    t0l = left+margin;
    tl = t0l + varl;
    tfl = tl + tw;
    xnb = fr2bot + nudge;
    tnb = xnb + ht;
    nl = left+nudge;
    xnwind = [nl,xnb-.15*ht,nwdth,ht];
    tnwind = [nl,tnb-.15*ht,nwdth,ht];
    vl = nl + nwdth;
    xvwind = [vl,xnb,varl,ht];
    tvwind = [vl,tnb,varl,ht];
    instb = tnb + ht + nudge;
    instw = nwdth + varl;
    instwind = [nl,instb,instw,ht];
    fr2ht = 3*nudge + 3*ht;
    % frw = 2*nudge + nwdth + varl;
    fr2wind = [left,fr2bot,frw,fr2ht];
    fr1wind = [left,fr1bot,frw,fr1ht];
    specw = frw - 2*nudge;
    specwind = [nl,specb,specw,ht];
    t0wind = [t0l,intb,varl,ht];
    twind = [tl,intb-.15*ht,tw,ht];
    tfwind = [tfl,intb,varl,ht];
    figw = 2*left + frw;
    fight = 3*left + ht + fr1ht + fr2ht;
    figwind = [30,300,figw,fight];
    buttw = frw/2;
    sep = (figw - 2*buttw)/3;
    closel = left;
    compl = closel+buttw;
    clwind = [closel,left,buttw,ht];
    compwind = [compl,left,buttw,ht];
    set(ppkbd,'pos',figwind);
    set(kbd.fr1,'pos',fr1wind);
    set(kbd.fr2,'pos',fr2wind);
    set(kbd.inst,'pos',instwind);
    set(kbd.xname,'pos',xnwind);
    set(kbd.tname,'pos',tnwind);
    set(kbd.xval,'pos',xvwind);
    set(kbd.tval,'pos',tvwind);
    set(kbd.comp,'pos',compwind);
    set(kbd.close,'pos',clwind);
    set(kbd.tname,'pos',tnwind);
    set(kbd.tval,'pos',tvwind);
    set(kbd.spec,'pos',specwind);
    set(kbd.t0,'pos',t0wind);
    set(kbd.t,'pos',twind);
    set(kbd.tf,'pos',tfwind);
    speccall = [
	'ud = get(gcf,''user'');',...
	'if get(gcbo,''value''),',...
	'  set([ud.t0,ud.t,ud.tf],''enable'',''on'');',...
	'  set([ud.t0,ud.tf],''background'',[1 1 1]);',...
	'else,',...
	'  set([ud.t0,ud.t,ud.tf],''enable'',''off'');',...
	'  set([ud.t0,ud.tf],''background'',[0.83 0.82 0.78]);',...
	'end'];
    
    set(kbd.spec,'call',speccall);
    set(ppkbd,'resize','on');
    set(findobj(ppkbd,'type','uicontrol'),'units','normal');
    
    set(kbd.spec,'value',0);
    set(ppkbd,'user',kbd,'vis','on');
    set([kbd.t0,kbd.tf],'enable','off',...
		      'background',[0.83 0.82 0.78]);
    set(kbd.t,'enable','off');
    set(findobj(ppkbd,'type','uicontrol'),'units','normal');
    figure(ppkbd)
    
  elseif strcmp(action,'zoomin')
  
    % 'zoomin' is the callback for the Zoomin menu item.  It allows the
    % user to pick a new display rectangle.
    
    set(gcf,'WindowButtonDownFcn','dfield8(''zoom'')',...
	    'WindowButtonUpFcn','1;','inter','on');
    set(gca,'inter','on');
    dud = get(gcf,'user');
    nstr = get(dud.notice,'string');
    nstr(1:4) = nstr(2:5);
    nstr{5} = ['Pick a new display rectangle by clicking and ',...
	       'dragging the mouse, or by clicking on a point.'];
    set(dud.notice,'string',nstr);
    
  elseif strcmp(action,'zoom')
    
    disph = gcf;
    dud = get(disph,'user');
    axh = dud.axes;
    aud = get(axh,'user');
    DY = aud.DY;
    w = dud.syst.wind;
    q1 = get(disph,'currentpoint');
    p1 = get(axh,'currentpoint');
    p1 = p1(1,1:2);
    rbbox([q1 0 0],q1);
    p2 = get(axh,'currentpoint');
    p2 = p2(1,1:2);
    if all(abs(p1'-p2')>0.01*DY)
      a = [p1;p2];
      a = [min(a);max(a)];
      DY = (a(2,:) - a(1,:))';  
    else
      DY = DY/4;
      a(1) = max(w(1),p1(1)-DY(1));
      a(2) = min(w(2),p1(1)+DY(1));
      a(3) = max(w(3),p1(2)-DY(2));
      a(4) = min(w(4),p1(2)+DY(2));
      DY(1) = a(2) - a(1);
      DY(2) = a(4) - a(3);
    end    
    WINvect = a(:)';
    dud.syst.wind = WINvect;
    aud.DY = DY;
    dwind = [WINvect(1); WINvect(3); -WINvect(2); -WINvect(4)];
    aud.cwind = WINvect(:) - ...
	dud.settings.magn*[DY(1);-DY(1);DY(2);-DY(2)];
    set(axh,'user',aud);	
    set(disph,'user',dud);
    set(disph,'WindowButtonDownFcn','dfield8(''down'')',...
	      'WindowButtonUpFcn','');
    dfield8('dirfield',disph);
    dfset = findobj('name','dfield8 Setup');
    if isempty(dfset)
      dfield8('confused');
    else
      sud = get(dfset,'user');
      sud.c.wind = WINvect;
      sud.o.wind = WINvect;
      set(sud.h.wind(1),'string',num2str(WINvect(1)));
      set(sud.h.wind(2),'string',num2str(WINvect(2)));
      set(sud.h.wind(3),'string',num2str(WINvect(3)));
      set(sud.h.wind(4),'string',num2str(WINvect(4)));
      set(dfset,'user',sud);
    end
    
  elseif strcmp(action,'dall')
  
    % 'dall' is the callback for the Erase all graphics objects.  
    
    disph = gcf;
    dud = get(disph,'user');
    notice = dud.notice;
    kk = find(ishandle(dud.solhand));    
    delete(dud.solhand(kk));
    dud.solhand = [];
    kk = find(ishandle(dud.plhand));    
    delete(dud.plhand(kk));
    dud.plhand = [];
    kk = find(ishandle(dud.contours));    
    delete(dud.contours(kk));
    dud.contours = [];
    if notice
      set(dud.butt(1),'enable','off');
    end
    set(disph,'user',dud);
    
  elseif strcmp(action,'dallsol')
    
    % 'dallsol' is the callback for the Erase all solutions option.  
    
    disph = gcf;
    dud = get(disph,'user');
    notice = dud.notice;
    kk = find(ishandle(dud.solhand));      
    delete(dud.solhand(kk));
    dud.solhand = [];
    kk = find(ishandle(dud.plhand));    
    delete(dud.plhand(kk));
    dud.plhand = [];
    if notice
      set(dud.butt(1),'enable','off');
    end
    set(disph,'user',dud);
    
  elseif strcmp(action,'dalllev')
    
    % 'dalllev' is the callback for the Erase all level curves option.  
    
    disph = gcf;
    dud = get(disph,'user');
    notice = dud.notice;
    kk = find(ishandle(dud.contours));       
    delete(dud.contours(kk));
    dud.contours = [];
    if notice
      set(dud.butt(1),'enable','off');
    end
    set(disph,'user',dud);
    
  elseif strcmp(action,'solvset')
    
    dud = get(gcf,'user');
    name = dud.settings.solver;
    
    setfig = findobj('name','dfield8 Solver settings');
    if ~isempty(setfig)
      data = get(setfig,'user');
      if strcmp(data.settings.solver,name)
	figure(setfig);
	return
      else
	close(setfig);
      end
    end
    data.settings = dud.settings;
    
    nstepcall =['data = get(gcf,''user'');',...
		'ss = max(round(str2num(get(data.d1,''string''))),1);',...
		'data.settings.refine = ss;',...
		'set(data.d1,''string'',num2str(ss));',...
		'set(data.chb,''enable'',''on''),',...
		'set(gcf,''user'',data);'];
    
    ssizecall = ['data = get(gcf,''user'');',...
		 'data.settings.stepsize = str2num(get(data.d1,''string''));',...
		 'set(data.d1,''string'',num2str(data.settings.stepsize));',...
		 'set(data.chb,''enable'',''on''),',...
		 'set(gcf,''user'',data);'];
    
    chcall = ['data = get(gcf,''user'');',...
	      'dfdisp = findobj(''name'',''dfield8 Display'');',...
	      'dud = get(dfdisp,''user'');',...
	      'dud.settings = data.settings;',...
	      'set(dfdisp,''user'',dud);',...
	      'dfset = findobj(''name'',''dfield8 Setup'');',...
	      'ud = get(dfset,''user'');',...
	      'ud.settings = data.settings;',...
	      'set(dfset,''user'',ud);',...
	      'set(data.chb,''enable'',''off'');'];
    
    speedcall = ['data = get(gcf,''user'');',...
		 'me = data.speed;',...
		 'val = round(get(me,''value''));',...
		 'set(me,''value'',val);',...
		 'set(data.sp.val,''string'',num2str(val));',...
		 'data.settings.speed = val;',...
		 'set(data.chb,''enable'',''on''),',...
		 'set(gcf,''user'',data);'];
    
    switch name
     case 'Dormand-Prince'
      ssname = 'Settings for the Dormand-Prince solver.';
      d1call = nstepcall;
      d1string = 'Number of plot steps per computation step:  ';
      d1data = num2str(data.settings.refine);
     case 'Euler'
      ssname = 'Settings for Euler''s method.';
      d1call = ssizecall;
      d1string = 'Step size:     ';
      d1data = num2str(data.settings.stepsize);
     case 'Runge-Kutta 2'
      ssname = 'Settings for the second order Runge-Kutta method.';
      d1call = ssizecall;
      d1string = 'Step size:     ';
      d1data = num2str(data.settings.stepsize);
     case 'Runge-Kutta 4'
      ssname = 'Settings for the fourth order Runge-Kutta method.';
      d1call = ssizecall;
      d1string = 'Step size:     ';
      d1data = num2str(data.settings.stepsize);
    end
    
    left = 5; nudge = 1; varl = 70;
    
    setfig = figure('name','dfield8 Solver settings','numb','off',...
		    'tag','dfield8','vis','off');
    
    dfield8('figdefault',setfig);
    set(setfig,'menubar','none');
    
    setfr = uicontrol('style','frame');	
    
    setspfr = uicontrol('style','frame');	
    
    d1 = uicontrol('style','text','horiz','left',...
		   'string',d1string);
    
    data.d1 = uicontrol('style','edit','string',d1data,...
			'call',d1call,'background','w');
    
    rtolcall =['data = get(gcf,''user'');',...
	       'data.settings.tol = str2num(get(data.rtol,''string''));',...
	       'set(data.rtol,''string'',num2str(data.settings.tol));',...
	       'set(data.chb,''enable'',''on''),',...
	       'set(gcf,''user'',data);'];
    
    hmaxcall = ['data = get(gcf,''user'');',...
		'data.settings.hmax = str2num(get(data.hmax,''string''));',...
		'set(data.hmax,''string'',num2str(data.settings.hmax));',...
		'set(data.chb,''enable'',''on''),',...
		'set(gcf,''user'',data);'];
    
    
    ss = uicontrol('style','text','horiz','center',...
		   'string',ssname);
    
    gob = uicontrol('style','push','string','Go Away','call','close');
    
    data.chb = uicontrol('style','push',...
			 'string','Change settings',...
			 'call',chcall,...
			 'enable','off');
    
    data.speed = uicontrol('style','slider',...
			   'string','Steps per second.',...
			   'min',2,...
			   'max',100,...
			   'value',data.settings.speed,...
			   'sliderstep',[1/98,10/98],...
			   'call',speedcall);
    
    data.sp.min = uicontrol('style','text','string',' 2',...
			    'horiz','left');
    data.sp.max = uicontrol('style','text','string','100 ',...
			    'horiz','right');
    data.sp.val = uicontrol('style','text',...
			    'string',num2str(data.settings.speed),...
			    'horiz','center');
    
    pps = uicontrol('style','text',...
		    'string','Solution steps per second.');
    ext1 = get(d1,'extent');
    ht = ext1(4)+3;
    ext2 = get(ss,'extent');
    stw = ext1(3)+5;		
    varl = varl*ht/19;
    setspfrb = 2*left + 2*ht;
    setspfrht = 4*nudge + 3*ht;
    setfrb = setspfrb + setspfrht;
    setfrh = 4*nudge + 4*ht;
    figh = setfrb + setfrh + left;
    gobb = left;
    chbb = gobb + ht;
    hmaxb = setfrb + nudge;
    d1b = hmaxb + ht;
    rtolb = d1b + ht;
    ssizeb = (rtolb+d1b)/2;
    ssb = rtolb + ht + nudge;
    ssw = max(max(stw+varl,ext2(3)),300);
    frw = 2*nudge + ssw;
    figw = frw + 2*left;
    buttw = figw/3;
    sep = figw/9;
    sl = left + nudge;
    d1l = (figw -stw-varl)/2;
    gobl = sep;
    chbl = 2*sep + buttw;
    spb1 = setspfrb+2*nudge;
    spb2 = spb1+ht;
    spb3 = spb2+ht+nudge;
    sptw = varl;
    sptl1 = sl;
    sptsep = (ssw-3*sptw-sl)/2;
    sptl2 = sptl1 + sptw + sptsep;
    sptl3 = sptl2 + sptw + sptsep;
    
    sunit = get(0,'units');
    set(0,'units','pix');
    ssize = get(0,'screensize');
    figb = ssize(4) - figh - 50;
    
    set(setfig,'pos',[20,figb,figw,figh]);
    set(setspfr,'pos',[left,setspfrb,frw,setspfrht]);
    set(data.speed,'pos',[sl,spb1,ssw,ht],...
		   'backgroundcolor',0.6*[1 1 1],...
		   'foregroundcolor','r');
    set(data.sp.min,'pos',[sptl1,spb2,sptw,ht]);
    set(data.sp.max,'pos',[sptl3,spb2,sptw,ht]);
    set(data.sp.val,'pos',[sptl2,spb2,sptw,ht]);
    set(pps,'pos',[sl,spb3,ssw,ht]);
    set(setfr,'pos',[left,setfrb,frw,setfrh]);
    set(ss,'pos',[sl,ssb,ssw,ht]);
    set(d1,'pos',[d1l,d1b,stw,ht]);
    set(data.d1,'pos',[d1l+stw,d1b,varl,ht]);
    set(gob,'pos',[left,gobb,frw,ht]);
    set(data.chb,'pos',[left,chbb,frw,ht]);
    if strcmp(name,'Dormand-Prince')
      rtol = uicontrol('style','text','horiz','left',...
		       'pos',[sl+5,rtolb,stw-5,ht],...
		       'string','Relative error tolerance: '); 
      data.rtol = uicontrol('style','edit','call',rtolcall,...
			    'pos',[sl+stw,rtolb,varl,ht],...
			    'string',num2str(data.settings.tol),...
			    'background','w');
      hmax = uicontrol('style','text','horiz','left',...
		       'pos',[sl+5,hmaxb,stw-5,ht],...
		       'string','Maximum step size: '); 
      data.hmax = uicontrol('style','edit','call',hmaxcall,...
			    'pos',[sl+stw,hmaxb,varl,ht],...
			    'string',num2str(data.settings.hmax),...
			    'background','w');
      set(d1,'pos',[sl+5,d1b,stw-5,ht]);
      set(data.d1,'pos',[sl+stw,d1b,varl,ht]);
    end
    
    set(setfig,'user',data);
    set(setfig,'units','normal');
    set(findobj(setfig,'type','uicontrol'),'units','normal');
    set(setfig,'vis','on','resize','on');
    set(get(setfig,'child'),'vis','on');
    
  elseif strcmp(action,'settings')
  
    % 'settings' is the call back for the Settings menu option.  It sets
    % up the dfield8 Settings window, which allows the user to interactively
    % change several parameters that govern the behaviour of the program.
    
    dud = get(gcf,'user');
    data.settings = dud.settings;
    fieldtype = dud.fieldtype;
    npts = dud.npts;
    data.fieldtype = fieldtype;
    data.npts = npts;
    data.magn = dud.settings.magn;
    setfig = findobj('name','dfield8 Window settings');
    if ~isempty(setfig)
      close(setfig);
    end
    setfig = figure('name','dfield8 Window settings',...
		    'numb','off',...
		    'tag','dfield8','vis','off');
    
    dfield8('figdefault',setfig);
    set(setfig,'menubar','none');
    
    dirffr = uicontrol('style','frame');	
    cwfr = uicontrol('style','frame');
    
    ss = uicontrol('style','text','horiz','center',...
		   'string','The direction field.');
    
    kk = 1+2*data.settings.magn;
    magcall = ['data = get(gcf,''user'');',...
	       'mag = 	(str2num(get(data.mag,''string''))-1)/2;',...
	       'data.magn = max(0,mag);',...
	       'set(gcf,''user'',data);'];
    
    cw1 = uicontrol('style','text','horiz','left',...
		    'string','The calculation window is');
    data.mag = uicontrol('style','edit','call',magcall,...
			 'string',num2str(kk),'background','w');
    cw2 = uicontrol('style','text','horiz','left',...
		    'string',' times as large as the ');
    cw3 = uicontrol('style','text','horiz','left',...
		    'string','display window.');
    
    gob = uicontrol('style','push','string','Go Away','call','close');
    
    chb = uicontrol('style','push',...
		    'string','Change settings',...
		    'call','dfield8(''setchange'')');
    
    left = 1; nudge = 3; 
    
    cw1ext = get(cw1,'extent');
    cw1w = cw1ext(3);
    cw2ext = get(cw2,'extent');
    cw2w = cw2ext(3);
    ht = cw1ext(4)+nudge;
    
    cwfrb = 2*left + ht;
    cwfrh = 4*nudge + 2*ht;
    dirffrb = cwfrb + cwfrh;
    rbfrh = 3*ht + 3*nudge;
    dirffrh = 4*nudge + 4*ht;
    figh = dirffrb + dirffrh + left;
    bb = left;
    cw3b = cwfrb + nudge;	
    cw2b = cw3b + ht;	% = cw1b = cweb
    rb1b = dirffrb + nudge;
    rb2b = rb1b + ht;
    rb3b = rb2b + ht;
    
    ssb = rb3b + ht + nudge;
    cwew = 40*ht/19;
    cww = cw1w + cwew + cw2w;
    
    frw = 2*nudge + cww;
    figw = frw + 2*left;
    buttw = frw/2;
    
    sl = left + nudge;
    gobl = left;
    chbl = left + buttw;
    
    sunit = get(0,'units');
    set(0,'units','pix');
    ssize = get(0,'screensize');
    figb = ssize(4) - figh - 50;
    
    set(setfig,'pos',[20,figb,figw,figh]);
    set(dirffr,'pos',[left,dirffrb,frw,dirffrh]);
    set(cwfr,'pos',[left,cwfrb,frw,cwfrh]);
    set(ss,'pos',[sl,ssb,cww,ht]);
    set(cw1,'pos',[sl,cw2b,cw1w,ht]);
    set(cw2,'pos',[sl+cw1w+cwew,cw2b,cw2w,ht]);
    set(cw3,'pos',[sl,cw3b,cww,ht]);
    set(data.mag,'pos',[sl+cw1w,cw2b,cwew,ht]);
    set(gob,'pos',[gobl,bb,buttw,ht]);
    set(chb,'pos',[chbl,bb,buttw,ht]);
    
    radw = .4*cww;
    rbl = sl + nudge;
    rbw = radw -4*nudge;
    typewindw = radw + 2*nudge;
    typewind = [left, dirffrb, typewindw, rbfrh];
    textwindl = left+typewindw;
    textleft = textwindl + nudge;
    textw = frw - typewindw;
    textwind = [textwindl, dirffrb,textw, rbfrh];
    typeframe = uicontrol('style','frame','pos',typewind,'visible','off');
    
    textframe = uicontrol('style','frame','pos',textwind,'visible','off');
    
    switch fieldtype
     case 'arrows'
      rval1 = 1;rval2 = 0;rval3 = 0;
     case 'lines'
      rval1 = 0;rval2 = 2;rval3 = 0;
     case 'none' 
      rval1 = 0;rval2 = 0;rval3 = 3;
     otherwise
      error(['Unknown fieldtype ',ud.o.fieldtype,'.'])
    end		
    
    data.rad(1) = uicontrol('style','radio',...
      'pos',[rbl rb3b rbw ht],...
      'string','Arrows','value',rval1,'visible','off');
    
    data.rad(2) = uicontrol('style','radio',...
			    'pos',[rbl rb2b rbw ht],...
			    'string','Lines',...
			    'value',rval2,...
			    'max',2,...
			    'visible','off');
    
    data.rad(3) = uicontrol('style','radio',...
			    'pos',[rbl rb1b rbw ht],...
			    'string','None',...
			    'value',rval3,...
			    'max',3,'visible',...
			    'off');
    
    for i=1:3
      set(data.rad(i),'user',data.rad(:,[1:(i-1),(i+1):3]));
    end
    
    callrad = ['me = gcbo;',...
	       'kk = get(me,''max'');',...
	       'set(get(me,''user''),''value'',0),',...
	       'set(me,''value'',kk);',...
	       'ud = get(gcf,''user'');',...
	       'switch kk,',...
	       '       case 1, ud.fieldtype = ''arrows'';',...
	       '       case 2, ud.fieldtype = ''lines'';',...
	       '       case 3, ud.fieldtype = ''none'';',...
	       'end,',...
	       'set(gcf,''user'',ud);'];
    
    set(data.rad,'call',callrad);
    
    nfptsstr = {'Number of field points'; 'per row or column.'};
    nfptstext = uicontrol('style','text',...
			  'pos',[textleft rb2b textw-2*nudge 1.5*ht],...
			  'string',nfptsstr,...
			  'horizon','center',...
			  'visible','off');
    
    callnfpts = ['me = gcbo;',...
		 'kk = str2num(get(me,''string''));',...
		 'if isempty(kk),',...
		 '  set(me,''string'',''?'');',...
		 '  kk = NaN;',...
		 'else,',...
		 '  kk = floor(kk);',...
		 '  [m,N] = computer;'...
		 '  if (N <= 8192),',...
		 '	N = 32;',...
		 '  else,',...
		 '	N = 50;',...
		 '  end,'...
		 '  kk = min([N,max([5,kk])]);'...
		 '  set(me,''string'',num2str(kk));'...
		 'end,'...
		 'data = get(gcf,''user'');'...
		 'data.npts = kk;',...
		 'set(gcf,''user'',data)'];
    
    npts = uicontrol('style','edit',...
		     'pos',[textleft+(textw -30*ht/19)/2,rb1b 30*ht/19,ht],...
		     'string',npts,...
		     'call',callnfpts,...
		     'visible','off',...
		     'background','w');
    
    
    set(setfig,'user',data);
    set(setfig,'units','normal');
    set(findobj(setfig,'type','uicontrol'),'units','normal');
    set(setfig,'vis','on','resize','on');
    set(get(setfig,'child'),'vis','on');
    
    
  elseif strcmp(action,'setchange')
    
    % 'setchange' is the callback for the Change button 
    % on the dfield8 Settings window.
    
    dfsett = gcf;
    data = get(dfsett,'user');
    dfdisp = findobj('name','dfield8 Display');
    dfset = findobj('name','dfield8 Setup');
    if isempty(dfdisp)|isempty(dfset)
      dfield8('confused');
      return
    end
    dud = get(dfdisp,'user');
    sud = get(dfset,'user');
    dud.settings.magn = data.magn;
    sud.settings.magn = data.magn;
    WINvect = dud.syst.wind;
    aud = get(dud.axes,'user'); 
    DY = aud.DY;    
    aud.cwind = WINvect(:) - dud.settings.magn*[DY(1);-DY(1);DY(2);-DY(2)];
    set(dfset,'user',sud);
    set(dfdisp,'user',dud);
    set(dud.axes,'user',aud);
    if dud.npts ~= data.npts
      dud.fieldtype = data.fieldtype;
      dud.npts = data.npts;
      sud.fieldtype = data.fieldtype;
      sud.npts = data.npts;
      set(dfdisp,'user',dud);
      set(dfset,'user',sud);
      dfield8('dirfield',dfdisp);
    elseif ~strcmp(dud.fieldtype,data.fieldtype)
      dud.fieldtype = data.fieldtype;
      sud.fieldtype = data.fieldtype;
      switch dud.fieldtype
       case 'lines'
	set(dud.arr.lines,'vis','on');
	set(dud.arr.arrows,'vis','off');
       case 'arrows'
	set(dud.arr.lines,'vis','off');
	set(dud.arr.arrows,'vis','on');
       case 'none'
	set(dud.arr.lines,'vis','off');
	set(dud.arr.arrows,'vis','off');
      end
      set(dfset,'user',sud);
      set(dfdisp,'user',dud);
    end
    close(dfsett)
    
  elseif strcmp(action,'delete')

    % 'delete' is the callback for the Delete a graphics object selection
    % on the menu.
    
    disph = gcf;
    dud = get(disph,'user');
    arr = dud.arr;
    lv = get(arr.lines,'vis');
    av = get(arr.arrows,'vis');
    pv = get(dud.plineh,'vis');  
    handles = [arr.lines;arr.arrows;dud.plineh];
    set(handles,'vis','off');
    oldcall = get(disph,'WindowButtonDownFcn');
    set(disph,'WindowButtonDownFcn','');
    trjh = [dud.solhand;dud.plhand;dud.contours];
    notice = dud.notice;
    if notice
      nstr = get(notice,'string');
      nstr(1:4) = nstr(2:5);
      nstr{5} = 'Select a graphics object with the mouse.';
      set(notice,'string',nstr);
    end
    ginput(1);
    objh = get(disph,'currentobject');
    typ = get(objh,'type');
    axh = dud.axes;
    hh = [get(axh,'title'),get(axh,'xlabel'),get(axh,'ylabel')];
    if strcmp(typ,'line')
      dud.solhand = setdiff(dud.solhand,objh);  
      dud.plhand = setdiff(dud.plhand,objh);  
      dud.contours = setdiff(dud.contours,objh);  
      delete(objh); 
      if notice
	nstr(1:4) = nstr(2:5);
	nstr{5} = 'Ready.';
	set(notice,'string',nstr);
      end
    elseif strcmp(typ,'text') & ~ismember(objh,hh)
      delete(objh); 
      if notice
	nstr(1:4) = nstr(2:5);
	nstr{5} = 'Ready.';
	set(notice,'string',nstr);
      end
    else
      if notice
	nstr(1:4) = nstr(2:5);
	nstr{5} = 'The object you selected cannot be deleted.';
	set(notice,'string',nstr);
      end
    end
    
    set(arr.lines,'vis',lv);
    set(arr.arrows,'vis',av);
    set(dud.plineh,'vis',pv);  
    set(disph,'user',dud);
    set(disph,'WindowButtonDownFcn','dfield8(''down'')');
    
    
  elseif strcmp(action,'print')
  
    dud = get(gcf,'user');
    nstr = get(dud.notice,'string');
    nstr(1:4) = nstr(2:5);
    nstr{5} = 'Preparing to print the dfield8 Display Window.  Please be patient.';
    set(dud.notice,'string',nstr);
    
    nstr(1:4) = nstr(2:5);
    nstr{5} = 'Printing the dfield8 Display Window.';
    set(dud.notice,'string',nstr);
    set(gcf,'pointer','watch');
    eval(dud.printstr);
    nstr(1:4) = nstr(2:5);
    nstr{5} = 'Ready.';
    set(dud.notice,'string',nstr);
    set(gcf,'pointer','arrow');
    
  elseif strcmp (action,'zoomback')
    
    disph = gcf;
    dud = get(disph,'user');
    axh = dud.axes;
    Xname = dud.syst.xname;
    Tname = dud.syst.tname;
    wmat = dud.wmat;
    WINvect = dud.syst.wind;
    
    NN = size(wmat,1);
    
    wch = 0;j=0;
    while wch == 0
      j = j+1;
      if WINvect == wmat(j,:)
	wch = j;
      end
    end
    winstr = cell(1,NN);
    for j = 1:NN
      a = num2str(wmat(j,1));
      b = num2str(wmat(j,2));
      c = num2str(wmat(j,3));
      d = num2str(wmat(j,4));
      winstr{j} = [' ',a,' < ',Tname,' < ',b,'   &   ',c,' < ', Xname,' < ',d];
    end
    
    [sel,ok] = listdlg('liststring',winstr,...
		       'selectionmode','single',...
		       'listsize',[270,100],...
		       'initialvalue',wch,...
		       'name','dfield8 Zoomback',...
		       'promptstring','Select a rectangle:',...
		       'OKString','Zoom');
    
    if (~isempty(sel))
      WINvect = wmat(sel,:);
      dud.syst.wind = WINvect;
      set(gcf,'user',dud);
      dfset = findobj('name','dfield8 Setup');
      sud = get(dfset,'user');
      set(disph,'user',dud);
      set(sud.h.wind(1),'string',num2str(WINvect(1)));
      set(sud.h.wind(2),'string',num2str(WINvect(2)));
      set(sud.h.wind(3),'string',num2str(WINvect(3)));
      set(sud.h.wind(4),'string',num2str(WINvect(4)));
      sud.c.wind = WINvect;
      sud.o.wind = WINvect;
      set(dfset,'user',sud);
      aud = get(axh,'user');
      DY = [WINvect(2) - WINvect(1);WINvect(4) - WINvect(3)];
      aud.DY = DY;    
      aud.cwind = WINvect(:) - ...
	  dud.settings.magn*[DY(1);-DY(1);DY(2);-DY(2)];
      set(axh,'user',aud);
      dfield8('dirfield',disph);
    end
    
  elseif strcmp(action,'level')
  
    dfdisp = gcf;
    dfset = findobj('name','dfield8 Setup');
    sud = get(dfset,'user');
    dud = get(dfdisp,'user');
    lfcn = dud.level;
    tname = dud.syst.tname;
    xname = dud.syst.xname;
    tname(find(abs(tname)==92))=[];  % Remove \s if any.
    xname(find(abs(xname)==92))=[];
    dflevel = findobj('name','dfield8 Level sets');
    if ~isempty(dflevel)
      delete(dflevel)
    end
    dflevel = figure('name','dfield8 Level sets',...
		     'vis','off',...
		     'numb','off','tag','dfield8');
    
    dfield8('figdefault',dflevel);
    hhsetup = get(0,'showhiddenhandles');
    set(dflevel,'menubar','none');
    
    lev.fr1 = uicontrol('style','frame');
    lev.fr2 = uicontrol('style','frame');
    
    inst1str = ['Enter the function in terms of the variables ',...
		tname, ' and ', xname, ' and the parameter/expressions:'];
    
    lev.inst1 = uicontrol('style','text','horiz','left',...
			  'string',inst1str);
    
    lev.lfcn = uicontrol('style','edit','horiz','center',...
			 'string',lfcn,'call','',...
			 'background','w');
    
    lev.ch(3) = uicontrol('style','radio','horiz','center',...
			  'min',0,'max',3,...
			  'value',0,...
			  'vis','on',...
			  'string','Let dfield8 decide.');
    
    lev.ch(2) = uicontrol('style','radio','horiz','center',...
			  'min',0,'max',2,...
			  'value',0,...
			  'string','Select a point in the Display Window.');
    
    lev.inst2 = uicontrol('style','text','horiz','left',...
			  'string',['Choose one of the following ways to',...
		          ' choose level value(s):']);
    
    lev.ch(1)  = uicontrol('style','radio','horiz','center',...
			   'min',0,'max',1,...
			   'value',0,...
			   'string','Enter a vector of level values.');
    
    lev.rhs = uicontrol('style','edit','horiz','center',...
			'string',' ','call','');
    
    lev.proc = uicontrol('style','push',...		
			 'string','Proceed',...
			 'call','dfield8(''levcomp'')');
    
    lev.close = uicontrol('style','push',...
			  'string','Close',...
			  'call','close');
    
    for i=1:3
      set(lev.ch(i),'user',lev.ch(:,[1:(i-1),(i+1):3]));
    end
    
    callrad = [
	'me = get(gcf,''currentobject'');',...
	'kk = get(me,''max'');',...
	'col = get(me,''backg'');',...
	'set(get(me,''user''),''value'',0),',...
	'set(me,''value'',kk);',...
	'ud = get(gcf,''user'');',...
	'if kk == 1,',...
	'   set(ud.rhs,''enable'',''on'',''backg'',''w'');',...
	'else,',...
	'   set(ud.rhs,''enable'',''off'',''backg'',col);',...
	'end,'];
    
    set(lev.ch,'call',callrad);
    
    left = 2; varl = 400; buttw = 60;
    nudge = 3;   
    tab = 15;
    lines1 = 5;
    lines2 = 2;
    xex = get(lev.inst1,'extent');
    ht = xex(4)+nudge;
    frw = varl + 2*tab+ 2*nudge;
    fr1bot = 2*left + ht;
    fr1ht = lines1*(nudge + ht) + nudge;
    fr2bot = fr1bot + fr1ht;
    fr2ht = lines2*(nudge + ht) + nudge;
    vbot = fr1bot + nudge;
    ch1bot = vbot + nudge + ht;
    ch2bot = ch1bot + nudge + ht;
    ch3bot = ch2bot + nudge + ht;
    inst2bot = ch3bot + nudge + ht;
    fbot =  fr2bot + nudge;
    inst1bot = fbot + nudge + ht;
    fleft = left + nudge + tab;
    instleft = left + nudge;
    chleft = instleft + tab;
    vleft = chleft + tab;
    vw = (frw - 2*vleft);
    fr1wind = [left,fr1bot,frw,fr1ht];
    fr2wind = [left,fr2bot,frw,fr2ht];
    inst1wind = [instleft,inst1bot,varl,ht];
    inst2wind = [instleft,inst2bot,varl,ht];
    fwind = [fleft,fbot,varl,ht];
    ch1wind = [chleft,ch1bot,varl,ht];
    ch2wind = [chleft,ch2bot,varl,ht];
    ch3wind = [chleft,ch3bot,varl,ht];
    vwind = [vleft,vbot,vw,ht];
    figw = 2*left + frw;
    fight = 3*left + ht + fr1ht + fr2ht;
    figwind = [40, 300, figw, fight];
    buttw = frw/2;
    sep = (figw - 2*buttw)/3;
    closel = sep;
    procl = 2*sep+buttw;
    clwind = [closel,left,buttw,ht];
    procwind = [procl,left,buttw,ht];
    set(dflevel,'pos',figwind);
    set(lev.fr1,'pos',fr1wind);
    set(lev.fr2,'pos',fr2wind);
    set(lev.inst1,'pos',inst1wind);
    set(lev.inst2,'pos',inst2wind);
    set(lev.ch(1),'pos',ch1wind);
    set(lev.ch(2),'pos',ch2wind);
    set(lev.ch(3),'pos',ch3wind);
    set(lev.rhs,'pos',vwind);
    set(lev.lfcn,'pos',fwind);
    set(lev.proc,'pos',procwind);
    set(lev.close,'pos',clwind);
    set(lev.ch(3),'value',3);
    set(lev.rhs,'enable','off');  
    
    child = get(dflevel,'children');
    set(dflevel,'vis','on','user',lev);
    set(child,'vis','on');
    
  elseif strcmp(action,'levcomp')
  
    dflevel = gcf;
    ud = get(dflevel,'user');
    dfdisp = findobj('name','dfield8 Display');
    dud = get(dfdisp,'user');
    dfset = findobj('name','dfield8 Setup');
    sud = get(dfset,'user');
    ch = ud.ch;
    val = zeros(1,3);
    for kk = 1:3
      val(kk) = get(ch(kk),'value');
    end
    KK = max(val);
    lfcn = get(ud.lfcn,'string');
    l=length(lfcn);
    for ( k = fliplr(findstr('.',lfcn)))
      if (find('*/^' == lfcn(k+1)))
	lfcn = [lfcn(1:k-1), lfcn(k+1:l)];
      end
      l=l-1;
    end
    pnameh = sud.h.pname;
    pvalh = sud.h.pval;
    pflag = zeros(1,4);
    perr = [];
    lfcn(find(abs(lfcn)==32))=[];
    for kk = 1:4;
      pn = get(pnameh(kk),'string');
      pv = get(pvalh(kk),'string');
      if ~isempty(pn)
	pn(find(abs(pn)==92))=[];
	if isempty(pv) 
	  perr = pvalh(kk);
	else 
	  pv(find(abs(pv)==32))=[];
	  lfcn = dfield8('paraeval',pn,pv,lfcn);
	end
      end
    end
    l = length(lfcn);
    for (k=fliplr(find((lfcn=='^')|(lfcn=='*')|(lfcn=='/'))))
      lfcn = [lfcn(1:k-1) '.' lfcn(k:l)];
      l = l+1;
    end
    
    WINvect = dud.syst.wind;
    XxXxXx = WINvect(1) + rand*(WINvect(2)-WINvect(1));
    YyYyYy = WINvect(3) + rand*(WINvect(4)-WINvect(3));
    tname = dud.syst.tname;
    xname = dud.syst.xname;
    tname(find(abs(tname)==92))=[];  % Remove \s if any.
    xname(find(abs(xname)==92))=[];
    err = 0;res = 1;
    eval([tname,'=XxXxXx;'],'err = 1;');
    eval([xname,'=YyYyYy;'],'err = 1;');
    eval(['res = ',lfcn, ';'],'err = 1;');
    if err | isempty(res)
      errmsg = 'The function does not evaluate correctly.';
      fprintf('\a')
      errordlg(errmsg,'dfield8 error','on');
      return;
    end
    
    Xmin = WINvect(1);
    Xmax = WINvect(2);
    Ymin = WINvect(3);
    Ymax = WINvect(4);
    N = 50; k = 4;
    deltax=(Xmax - Xmin)/(N-1);
    deltay=(Ymax - Ymin)/(N-1);
    XXXg=Xmin + deltax*[-k:N+k];
    YYYg=Ymin + deltay*[-k:N+k];
    
    [Xx,Yy]=meshgrid(XXXg,YYYg);
    Xxx=Xx(:);Yyy=Yy(:);
    Ww = zeros(size(Xxx));
    eval([tname,'=Xxx;'],'err = 1;');
    eval([xname,'=Yyy;'],'err = 1;');
    eval(['Ww = ',lfcn, ';']);
    
    KKK = 3; %# of significant figures.
    
    switch KK
     case 1  % vector input
      rhs = get(ud.rhs,'string');
      rhs = str2num(rhs);
      
     case 2  % mouse input
      figure(dfdisp);
      [XX,YY] = ginput(1);
      figure(dflevel);
      eval([tname,'=XX;'],'err = 1;');
      eval([xname,'=YY;'],'err = 1;');
      eval(['rhs = ',lfcn, ';'],'err = 1'); 
      LL = ceil(log10(abs(rhs)));
      rhs = round(10^(KKK-LL)*rhs);
      rhs = 10^(LL-KKK)*rhs;
      
     case 3  % dfield8 input
      MM = max(Ww);mm = min(Ww);
      LL = ceil(log10(MM-mm));
      NN = 7;  % Number of curves
      rhs = mm+(1:NN).^2*(MM-mm)/NN^2;
      rhs = round(10^(KKK-LL)*rhs);
      rhs = 10^(LL-KKK)*rhs;
      
    end
    
    Ww = reshape(Ww,N+2*k+1,N+2*k+1);
    lrhs = length(rhs);
    if lrhs == 0
      return
    elseif lrhs == 1
      rhs = [rhs,rhs];
    end
    
    figure(dfdisp);
    [Cm,hcont] = contour(Xx,Yy,Ww,rhs,'--');
    hlabel = clabel(Cm,hcont);
    %  set(hlabel,'fontsize',dud.fontsize,...
    %	     'color',dud.color.level,...
    %	     'rotation',0);
    set(hlabel,'fontsize',dud.fontsize,...
	       'color',[1,0,0],...
	       'rotation',0);
    set(hcont,'visible','on',...
	      'color',dud.color.level,...
	      'linestyle',':');
    dud.contours = [dud.contours ;hcont;hlabel];
    set(dfdisp,'user',dud);
    
  elseif strcmp(action,'showbar')

    sbfig = gcbf;
    domymenu('menubar','toggletoolbar',sbfig);
    hhset = get(0,'showhiddenhandles');
    set(0,'showhiddenhandles','on');
    state = get(sbfig,'toolbar');
    if strcmp(state,'figure')
      fixtb = ['set(gcbo,''state'',''off'');'];
      set(findobj(sbfig,'tooltipstr','Zoom Out'),...
	  'clickedcallback',['dfield8(''zoomback'');' fixtb]);
      set(findobj(sbfig,'tooltipstr','Zoom In'),...
	  'clickedcallback',['dfield8(''zoomin'');' fixtb]);
      set(findobj(sbfig,'tooltipstr','Print'),...
	  'clickedcallback','dfield8(''print'');');
      delete(findobj(sbfig,'tooltipstr','Rotate 3D'));
      sbmh = findobj(sbfig,'label','Show &Toolbar');
      set(sbmh,'label','Hide &Toolbar','checked','off');
    else
      sbmh = findobj(sbfig,'label','Hide &Toolbar');
      set(sbmh,'label','Show &Toolbar','checked','off');
    end
    set(0,'showhiddenhandles',hhset)
    
  elseif strcmp(action,'figdefault')

    fig = input1;
    set(fig,'CloseRequestFcn','dfield8(''closefcn'')');
    dfset = findobj('name','dfield8 Setup');
    sud = get(dfset,'user');
    ud = get(fig,'user');
    ud.ssize = sud.ssize;
    fs = sud.fontsize;
    ud.fontsize = fs;
    style = sud.style;
    
    switch style
     case 'black'
      % if isunix | isvms, gamma = 0.5; else gamma = 0.0; end
      whitebg(fig,[0,0,0])
      if isunix | isvms
	fc = [.35 .35 .35];
      else
	fc = [.2 .2 .2];
      end
      set(fig,'color',fc);    
      set(fig,'defaultaxescolor',[0 0 0])
      % whitebg(fig,brighten([.2 .2 .2],gamma))
      set(fig,'defaultaxescolor',[0 0 0])
      set(fig,'defaultaxescolororder', ...
	      1-[0 0 1;0 1 0;1 0 0;0 1 1;1 0 1;1 1 0;.25 .25 .25]) % ymcrgbw
      set(fig,'colormap',jet(64))
      set(fig,'defaultsurfaceedgecolor',[0 0 0]);
     case 'white'
      whitebg(fig,[1 1 1])
      set(fig,'color',[.8 .8 .8])
      set(fig,'defaultaxescolor',[1 1 1])
      set(fig,'defaultaxescolororder', ...
	      [0 0 1;0 .5 0;1 0 0;0 .75 .75;.75 0 .75;.75 .75 0;.25 .25 .25]) % bgrymck
      set(fig,'colormap',jet(64))
      set(fig,'defaultsurfaceedgecolor',[0 0 0])
      
     case 'test'
      whitebg(fig,[1 1 1])
      set(fig,'color',[.8 .8 .8])
      set(fig,'defaultaxescolor',[1 1 1])
      set(fig,'defaultaxescolororder', ...
	      [0 0 1;0 .5 0;1 0 0;0 .75 .75;.75 0 .75;.75 .75 0;.25 .25 .25]) % bgrymck
      set(fig,'colormap',jet(64))
      set(fig,'defaultsurfaceedgecolor',[0 0 0])
      % set(fig,'defaultuicontrolbackgroundcolor',[1 1 1]);
      
     case 'display'
      whitebg(fig,[1 1 1])
      set(fig,'defaultaxescolor',[1 1 1])
      set(fig,'defaultaxescolororder', ...
	      [0 0 1;0 .5 0;1 0 0;0 .75 .75;.75 0 .75;.75 .75 0;.25 .25 .25]) % bgrymck
      set(fig,'colormap',jet(64))
      set(fig,'defaultsurfaceedgecolor',[0 0 0])
      set(fig,'color',[1 1 1]*220/255);
      set(fig,'defaultuicontrolbackgroundcolor',[1 1 1]*220/255);
      
     case 'bw'
      whitebg(fig,[0 0 0])
      set(fig,'color',[0 0 0])
      set(fig,'defaultaxescolor',[0 0 0])
      set(fig,'defaultaxescolororder', ...
	      [1 1 1])
      set(fig,'colormap',[1 1 1;0 0 0])
      set(fig,'defaultsurfaceedgecolor',[0 0 0])
      
    end 
    set(fig,'defaulttextfontsize',fs);
    set(fig,'defaultaxesfontsize',fs);
    set(fig,'defaultuicontrolfontsize',0.9*fs)
    lw = 0.5*fs/10;
    set(fig,'defaultaxeslinewidth',lw)
    set(fig,'defaultlinelinewidth',lw)
    set(fig,'defaultaxesfontname','helvetica')
    set(fig,'defaultaxesfontweight','normal')
    
    set(fig,'user',ud);
    
    
  elseif strcmp(action,'paraeval')
  
    %	Replace a parameter with its value in string form.
    
    para = deblank(input1);
    value = input2;
    value = ['(',value,')'];
    str = deblank(input3);
    ll = length(str);
    lp = length(para);
    lv = length(value);
    
    if strcmp(para,str)
      str = value;
    elseif (ll >= lp+1)
      k = findstr(para,str);
      
      lk = length(k);
      lopstr = '(+-*/^';
      ropstr = ')+-*/^';
      s = [];
      pos = 1;
      for jj = 1:lk
	if (((k(jj) == 1)|(find(lopstr == str(k(jj)-1))))...
	    &((k(jj)+lp-1 == ll)|(find(ropstr == str(k(jj) + lp)))))
	  s = [s,str(pos:(k(jj)-1)),value];
	  pos = k(jj)+lp;
	end
      end
      str = [s,str(pos:ll)];
    end
    output = str;
    
  elseif strcmp(action,'quit')
  
    dfset = findobj('name','dfield8 Setup');
    sud = get(dfset,'user');
    if sud.remtd 
      rmpath(tempdir);
    end
    oldfiles = dir([tempdir,'dftp*.m']);
    for k = 1:length(oldfiles)
      fn = [tempdir,oldfiles(k).name];
      fid = fopen(fn,'r');
      if fid ~= -1
	ll = fgetl(fid);
	ll = fgetl(fid);
	ll = fgetl(fid);
	fclose(fid);
	if strcmp(ll,'%% Created by dfield8')
	  delete(fn)
	end
      end
    end
    h = findobj('tag','dfield8');
    delete(h);
    
  elseif strcmp(action,'restart')
  
    dfdisp = findobj('name','dfield8 Display');
    dfset = findobj('name','dfield8 Setup');
    if (~isempty(dfdisp))
      dud = get(dfdisp,'user');
      if isfield(dud,'function')
	fcn = [tempdir,dud.function];
	  if (exist(fcn)==2) delete([fcn,'.m']);end
      end
    end
    h = findobj('tag','dfield8');
    delete(setdiff(h,dfset));
    sud = get(dfset,'user');
    sud.flag = 0;
    set(dfset,'user',sud);
    figure(dfset)
    
  elseif strcmp(action,'closefcn')
  
    fig = gcf;  
    name = get(fig,'name');
    if strcmp(name,'dfield8 Setup') | strcmp(name,'dfield8 Display')
      quest = ['Closing this window will cause all dfield8 ',...
	       'windows to close, and dfield8 will stop.  ',...
	       'Do you want to quit dfield8?'];
      butt = questdlg(quest,'Quit dfield8?','Quit','Cancel','Quit');
      if strcmp(butt,'Quit')
	dfield8('quit');
      end
    elseif strcmp(name,'dfield8 Linearization')
      dud = get(fig,'user');
      fcn = dud.function;
	if (exist(fcn)==2) delete([fcn,'.m']);end    
	delete(findobj('label',name));
	delete(fig);
    else
      delete(findobj('label',name));
      delete(fig);
    end
    
  elseif strcmp(action,'text')
   
    dfdisp = gcf;
    oldcall = get(dfdisp,'WindowButtonDownFcn');
    set(dfdisp,'WindowButtonDownFcn','');
    prompt = ['Enter the text here. Then choose ',...
	      'the location in the Display Window.'];
    txtstr = inputdlg(prompt,'Text entry');
    if ~isempty(txtstr)
      txtstr = txtstr{1};
      figure(dfdisp);
      gtext(txtstr);
    end
    set(dfdisp,'WindowButtonDownFcn',oldcall);
    
  elseif strcmp(action,'confused')
  
    tstring = 'dfield8 is totally confused';
    qstring = {['You will have to restart dfield8 from '...
		'the beginning in order to ',...
		'do anything new.  However, it might be possible '...
		'to save the current system ',...
		'or the gallery to make your restart easier, '...
		'or it may be possible to ',...
		'print out a figure, if the appropriate '...
		'figures are visible.  In such a case ',...
		'it would be best to do nothing now.'];
	       'What do you want to do?'};
    bstr1 = 'Quit and restart dfield8.';
    bstr2 = 'Just quit dfield8.';
    bstr3 = 'Do nothing.';
    answer = questdlg(qstring,tstring,bstr1,bstr2,bstr3,bstr1);
    if strcmp(answer,bstr1)
      delete(findobj('tag','dfield8'));
      dfield8;return
    elseif strcmp(answer,bstr2)
      delete(findobj('tag','dfield8'));
      return
    else
      return
    end
    
  elseif strcmp(action,'cdisp')
  
    [dfcbo,dfdisp] = gcbo;
    dud = get(dfdisp,'user');
    cp = get(dfdisp,'currentpoint');
    fpos = get(dfdisp,'pos');
    dfax = dud.axes;
    xd = get(dfax,'xlim');
    yd = get(dfax,'ylim');
    apos = get(dfax,'pos');
    xp = xd(1) + (cp(1) - apos(1)*fpos(3))*(xd(2)-xd(1))/(apos(3)*fpos(3));
    yp = yd(1) + (cp(2) - apos(2)*fpos(4))*(yd(2)-yd(1))/(apos(4)*fpos(4));
    str = ['(',num2str(xp,3),', ',num2str(yp,3),')'];
    set(dud.ccwind,'string',str);
    
  elseif strcmp(action,'savesyst')
    
    dfset = findobj('name','dfield8 Setup');
    type = input1;
    sud = get(dfset,'user');
    
    switch type
     case 'system'  
      systems = get(sud.h.gallery,'user');
      newsyst = sud.c;
      fn = newsyst.name;
      if ~isempty(fn)
	fn(find(abs(fn)==32))='_';   % Replace spaces by underlines.
      end	
      fn = [fn, '.dfs'];  % full filename
      comp = computer;
      switch  comp
       case 'PCWIN'
	filter = [sud.dfdir, '\',fn];
       case 'MAC2'
	filter = [sud.dfdir,':', fn];
       otherwise
	filter = [sud.dfdir,'/', fn];
      end
      [fname,pname] = uiputfile(filter,'Save the system as:');
      if fname == 0,return;end
      if ~strcmp(fname,fn)
	ll = length(fname);
	if (ll>4 & strcmp(fname(ll-3:ll),'.dfs'))
	  fn = fname;
	  sfn = fname(1:ll-4);  % short filename
	else
	  sfn = fname;
	  fn = [fname, '.dfs'];
	end
	newsyst.name = sfn;
	sud.c.name = sfn;
	set(dfset,'user',sud);
      end
      newsysts = newsyst;
      
     case 'gallery'
      systems = get(sud.h.gallery,'user');
      ll = length(systems); 
      if ll == 0
	warndlg(['There are no equations to make up a gallery.'],'Warning');
	return
      end
      names = cell(ll,1);
      for j=1:ll
	names{j} = systems(j).name;
      end	
      [sel,ok] = listdlg('PromptString','Select the equations',...
			 'Name','Gallery selection',...
			 'ListString',names);
      if isempty(sel)
	return
      else
	newsysts = systems(sel);
      end	
      comp = computer;
      switch  comp
       case 'PCWIN'
	prompt = [sud.dfdir,'\*.dfg'];
       case 'MAC2'
	prompt = [sud.dfdir,':*.dfg'];
       otherwise
	prompt = [sud.dfdir,':/.dfg'];
      end
      [fname,pname] = uiputfile(prompt,'Save the gallery as:');
      ll = length(fname);
      if (ll>4 & strcmp(fname(ll-3:ll),'.dfg'))
	fn = fname;
	sfn = fname(1:ll-4);
      else
	sfn = fname;
	fn = [fname, '.dfg'];
      end
      newsyst.name = sfn;
      sud.c.name = sfn;
      set(dfset,'user',sud);
      
    end  % switch type
    
    ll = length(newsysts);
    fid = fopen([pname fn],'w');
    dfstring = '%%%% DFIELD file %%%%';
    fprintf(fid,[dfstring,'\n']);
    for k = 1:ll
      fprintf(fid,'\n');
      nstr = newsysts(k).name;
      nstr = strrep(nstr,'''','''''');
      nstr = ['H.name = ''', nstr, ''';\n'];
      fprintf(fid,nstr);
      xname = newsysts(k).xname;
      xnstr = ['H.xname = ''', xname];
      xnstr = strrep(xnstr,'\','\\');
      xnstr = [xnstr, ''';\n'];
      fprintf(fid,xnstr);
      tname = newsysts(k).tname;
      tnstr = ['H.tname = ''', tname];
      tnstr = strrep(tnstr,'\','\\');
      tnstr = [tnstr, ''';\n'];
      fprintf(fid,tnstr);
      der = newsysts(k).der;
      dstr = ['H.der = ''', der];
      dstr = strrep(dstr,'\','\\');
      dstr = [dstr, ''';\n'];
      fprintf(fid,dstr);
      wind = newsysts(k).wind;
      wstr = ['H.wind = [', num2str(wind),'];\n'];
      fprintf(fid,wstr);
      pname = strrep(newsysts(k).pname,'\','\\');
      pval = strrep(newsysts(k).pval,'\','\\');
      pnl = length(pname);
      pvl = length(pval);
      for kk = 1:4
	if kk <= pnl
	  pns = pname{kk};
	else
	  pns = '';
	end
	if kk <= pvl
	  pvs = pval{kk};
	else
	  pvs = '';
	end
	if kk == 1
	  pnstr = ['H.pname = {''', pns, ''''];
	  pvstr = ['H.pval = {''', pvs, ''''];
	else
	  pnstr = [pnstr, ',''',pns, ''''];
	  pvstr = [pvstr, ',''',pvs, ''''];
	end
      end
      pnstr = [pnstr, '};\n'];
      pvstr = [pvstr, '};\n'];
      
      
      fprintf(fid,pnstr);
      fprintf(fid,pvstr);
     
      
    end
    fclose(fid);
    
  elseif strcmp(action,'loadsyst')  % This loads either a system or a gallery.
    
    sud = get(gcf,'user');
    pos = get(gcf,'pos');
    wpos = [pos(1),pos(2)+pos(4)+20,300,20];
    waith = figure('pos',wpos,...
		   'numb','off',...
		   'vis','off',...
		   'next','replace',...
		   'menubar','none',...
		   'resize','off',...
		   'createfcn','');
    axes('pos',[0.01,0.01,0.98,0.98],...
	 'vis','off');
    xp = [0 0 0 0];
    yp = [0 0 1 1];
    xl = [1 0 0 1 1];
    yl = [0 0 1 1 0];
    patchh = patch(xp,yp,'r','edgecolor','r','erase','none');
    lineh = line(xl,yl,'erase','none','color','k');
    type = input1;  
    set(sud.h.gallery,'enable','off');
    if strcmp(type,'default')
      set(waith,'name','Loading the default gallery.','vis','on');
      set(findobj('tag','load default'),'enable','off');
      megall = sud.h.gallery;
      mh = get(megall,'children');
      add = findobj(megall,'tag','add system');
      mh(find(mh == add)) = [];
      delete(mh);
      newsysstruct = get(megall,'user');
      system = sud.system;
      ll = length(system);
      x = 1/(ll+2);
      xp = [xp(2),x,x,xp(2)];
      set(patchh,'xdata',xp);
      set(lineh,'xdata',xl);
      drawnow;
      sep = 'on';
      for kk = 1:length(system)
	kkk = num2str(kk);
	if kk ==2, sep = 'off';end
	uimenu(megall,'label',system(kk).name,...
	       'call',['dfield8(''system'',',kkk,')'],...
	       'separator',sep);
      end % for
      set(megall,'user',system);
    else
      comp = computer;
      switch  comp
       case 'PCWIN'
	prompt = [sud.dfdir,'\'];
       case 'MAC2'
	prompt = [sud.dfdir,':'];
       otherwise
	prompt = [sud.dfdir,'/'];
      end
      
      if strcmp(type,'system')
	prompt = [prompt,'*.dfs'];
	[fname,pname] = uigetfile(prompt,'Select an equation to load.');
      elseif strcmp(type,'gallery')
	prompt = [prompt,'*.dfg'];
	[fname,pname] = uigetfile(prompt,'Select a gallery to load.');
      end  % if strcmp
      
      if fname == 0
	delete(waith);
	set(sud.h.gallery,'enable','on');
	return;
      end
      set(waith,'name',['Loading ',fname],'vis','on');
      fid = fopen([pname fname],'r');
      sline = fgetl(fid);
      if ~strcmp(sline,'%% DFIELD file %%')
	errmsg = 'This is not a dfield8 file.';
	fprintf('\a')
	errordlg(errmsg,'dfield8 error','on');
	return
      end
      newsysts = {};
      kk = 0;
      while ~feof(fid)
	kk = kk + 1;
	newsysts{kk} = fgetl(fid);
      end
      fclose(fid);
      newsysts = newsysts([1:kk]);
      systline = newsysts(kk);
      while strcmp(systline,'')
	kk = kk - 1;
	newsysts = newsysts([1:kk]);
	systline = newsysts(kk);
      end
      false = 0;
      if mod(kk,8 )
	false = 1;
      end
      if false
	if strcmp(type,'system')
	  wstr = ['The file ',fname, ' does not define a proper equation.'];
	elseif strcmp(type,'gallery')
	  wstr = ['The file ',fname, ' does not define a proper gallery.']
	end
	warndlg(wstr,'Warning');
	set(sud.h.gallery,'enable','on');
	delete(waith);
	return
      end %if false
      x = 8 /(kk+16);
      xp = [xp(2),x,x,xp(2)];
      set(patchh,'xdata',xp);
      set(lineh,'xdata',xl);
      drawnow;
      nnn = kk/8;  % The number of equations.
      for j = 1:nnn
	for k = 2:8 ;
	  eval(newsysts{(j-1)*8+k});
	end
	newsysstruct(j) = H;
      end
      
    end  % if strcmp(type,'default') & else
    nnn = length(newsysstruct);
    ignoresyst = {};
    for j = 1:nnn
      x = (j+1)/(nnn+2);
      xp = [xp(2),x,x,xp(2)];
      set(patchh,'xdata',xp);
      set(lineh,'xdata',xl);
      drawnow;
      newsyst = newsysstruct(j);
      sname = newsyst.name;
      sname(find(abs(sname) == 95)) = ' '; % Replace underscores with spaces.
      newsyst.name = sname;
      ignore = dfield8('addgall',newsyst);
      if ignore == -1;
	ignoresyst{length(ignoresyst)+1} = sname;
      end  
    end % for j = 1:nnn
    l = length(ignoresyst);
    if l  % At least 1 eqn  was a dup with a different name.
      if l == 1
	message = {['The equation ',ignoresyst{1},'" duplicates an ',...
		    'equation already in the gallery and was not added.']};
      else
	message = 'The equations ';
	for k = 1:(l-1)
	  message = [message,'"',ignoresyst{k},'", ']; 
	end
	message = {[message,'and "',ignoresyst{l},'" duplicate ',...
		    'equations already in the gallery and were not added.']};
      end % if l == 1 & else
      helpdlg(message,'Ignored systems');
    end  % if l
    if strcmp(type,'system') % Added a system.
      if ignore > 0 % The system was ignored.
	kk = ignore;
      else
	systems = get(sud.h.gallery,'user');
	kk = length(systems);
      end
      dfield8('system',kk);
    end  
    if strcmp('type','default')
      dfield8('system',1);
    end  
    set(sud.h.gallery,'enable','on');
    x = 1;
    xp = [xp(2),x,x,xp(2)];
    set(patchh,'xdata',xp);
    set(lineh,'xdata',xl);
    drawnow;
    delete(waith);
    
  elseif strcmp(action,'addgall')
   
    output = 0;
    dfset = findobj('name','dfield8 Setup');
    sud = get(dfset,'user');
    if nargin < 2    % We are adding the current equation.
      
      syst = sud.c;
      snstr = 'Provide a name for this equation.';
      sname = inputdlg(snstr,'Equation name',1,{syst.name});
      if isempty(sname),return;end
      sname = sname{1};
      if ~strcmp(sname,syst.name)
	sud.c.name = sname;
	set(dfset,'user',sud);
	syst.name = sname;
      end  
      
    else  % We have an equation coming from a file.
      syst = input1;
      sname = syst.name;
    end
    pnl = length(syst.pname);
    for kk = (pnl+1):4
      syst.pname{kk} = '';
    end
    pvl = length(syst.pval);
    for kk = (pvl+1):4
      syst.pval{kk} = '';
    end
    
    systems = get(sud.h.gallery,'user');
    ll = length(systems);
    kk = 1;
    while ((kk<=ll) & (~strcmp(sname,systems(kk).name)))
      kk = kk + 1;
    end
    nameflag = (kk<=ll);
    ssyst = rmfield(syst,'name');
    kk = 1;
    while ((kk<=ll) & (~isequal(ssyst,rmfield(systems(kk),'name'))))
      kk = kk + 1;
    end
    systflag = 2*(kk<=ll);
    flag = nameflag + systflag;
    switch flag
     case 1  % Same name but different system.
      mh = findobj(sud.h.gallery,'label',sname);
      prompt = {['The equation "',sname,'", which you wish to ',...
		 'add to the gallery has ',...
		 'the same name as a different equation ',...
		 'already in the gallery.  Please ',...
		 'specify the name for the newly added equation.'],...
		 'Specify the name for the old equation.'};
      titl = 'Two equations with the same name';
      lineno = 1;
      defans = {sname,sname};
      answer = inputdlg(prompt,titl,lineno,defans);
      if isempty(answer),return,end
      sname = answer{1};
      systems(kk).name = answer{2};
      set(mh,'label',answer{2});
      output = kk;
     case 2  % Two names for the same system.
      oldname = systems(kk).name;
      mh = findobj(sud.h.gallery,'label',oldname);
      
      prompt = {['The equation "',sname,'", which you wish to add ',...
		 'to the gallery is the same as an equation which is ',...
		 'already in the gallery with the name "',oldname,'".  ',...
		 'Please specify which name you wish to use.']};
      titl = 'Two names for the same equation.';
      lineno = 1;
      defans = {oldname};
      answer = inputdlg(prompt,titl,lineno,defans);
      if isempty(answer),return,end
      systems(kk).name = answer{1};
      set(mh,'label',answer{1});
      output = kk;
     case 3 % Systems and names the same.
      output = -1;
     otherwise
    end  % switch
    set(sud.h.gallery,'user',systems);
    syst.name = sname;
    if flag <=1
      switch ll
       case 0
 	systems = syst;
 	sepstr = 'on';
       case 4
 	systems(5) = syst;
 	if strcmp(systems(4).name,'RL circuit')
 	  sepstr = 'on';
 	else
 	  sepstr = 'off';
 	end
       otherwise
 	systems(ll+1) = syst;
	sepstr = 'off';
      end      
      kkk = num2str(ll+1); 
      newmenu = uimenu(sud.h.gallery,'label',sname,...
		       'call',['dfield8(''system'',',kkk,')'],...
		       'separator',sepstr);
      set(findobj('tag','savegal'),'enable','on');
    end
    set(sud.h.gallery,'user',systems);
    
  elseif strcmp(action,'export')
    
    % export is the callback for the Export solution data item in the
    % Options menu.

    disph = gcf;
    dud = get(disph,'user');
    arr = dud.arr;
    lv = get(arr.lines,'vis');
    av = get(arr.arrows,'vis');
    pv = get(dud.plineh,'vis');  
    handles = [arr.lines;arr.arrows;dud.plineh];
    set(handles,'vis','off');
    oldcall = get(disph,'WindowButtonDownFcn');
    set(disph,'WindowButtonDownFcn','');
    trjh = dud.solhand;
    notice = dud.notice;
    switch length(trjh)
     case 0
      if notice 
	nstr = get(notice,'string');
	nstr(1:3) = nstr(3:5);
	nstr{4} = 'There are no solutions.';
	nstr{5} = 'Ready.';
	set(notice,'string',nstr);
      end
      th = [];
	
     case 1
      th = trjh;
     otherwise
      if notice
	nstr = get(notice,'string');
	nstr(1:4) = nstr(2:5);
	nstr{5} = 'Select a solution with the mouse.';
	set(notice,'string',nstr);
      end
    ginput(1);
    th = get(disph,'currentobject');
    end
    if isempty(th)
      if notice 
	nstr = get(notice,'string');
	nstr(1:3) = nstr(3:5);
	nstr{4} = 'The item selected is not a solution.';
	nstr{5} = 'Ready.';
	set(notice,'string',nstr);
      end
    else
      vars = evalin('base','who');
      no = 1;
      kk = 0;
      while no
	kk = kk + 1;
	vstr = ['dfdata',num2str(kk)];
	if ~any(strcmp(vars,vstr))
	  no = 0;
	end
      end
      tname = dud.syst.tname;
      xname = dud.syst.xname;
      tval = get(th,'xdata');
      xval = get(th,'ydata');
      ivstr = struct(tname,tval,xname,xval);
      assignin('base',vstr,ivstr);
      if notice 
	nstr = get(notice,'string');
	nstr(1:3) = nstr(3:5);
	nstr{4} = ['The data has been exported as the structure ',...
		   vstr,' with fields ', tname, ' and ', xname,'.'];
	nstr{5} = 'Ready.';
	set(notice,'string',nstr);
      end

      
    end
	
      

    set(arr.lines,'vis',lv);
    set(arr.arrows,'vis',av);
    set(dud.plineh,'vis',pv);  
    set(disph,'user',dud);
    set(disph,'WindowButtonDownFcn','dfield8(''down'')');
    
  elseif strcmp(action,'system')
    
    dfset = findobj('name','dfield8 Setup');
    ud = get(dfset,'user');
    kk = input1;
    if isstr(kk)
      kk = str2num(input1);
    end
    system = get(ud.h.gallery,'user');
    syst = system(kk);
    xname = syst.xname;
    tname = syst.tname;
    set(ud.h.xname,'string',xname);
    set(ud.h.tname,'string',tname);
    set(ud.h.der,'string',syst.der);
    pname = syst.pname;
    pval = syst.pval;
    pnl = length(pname);
    pvl = length(pval);
    for kk = 1:4
      if kk <= pnl
	set(ud.h.pname(kk),'string',pname{kk});
      else
	set(ud.h.pname(kk),'string','');
	syst.pname{kk} = '';
      end
      if kk <= pvl
	set(ud.h.pval(kk),'string',pval{kk});
      else
	set(ud.h.pval(kk),'string','');
	syst.pval{kk} = '';
      end
    end
    ud.o = syst;
    ud.c = syst;
    set(ud.h.twind(1),'string',['The minimum value of ',tname,' = ']);
    set(ud.h.twind(2),'string',['The maximum value of ',tname,' = ']);
    set(ud.h.twind(3),'string',['The minimum value of ',xname,' = ']);
    set(ud.h.twind(4),'string',['The maximum value of ',xname,' = ']);
    for kk = 1:4
      set(ud.h.wind(kk),'string',num2str(syst.wind(kk)));
    end
    ud.flag = 0;
    set(dfset,'user',ud);
    
  end
  
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [tout,yout] = dfdp45(dfcn,tspan,y0,disph)

% DFDP45 is an implementation of the explicit Runge-Kutta (4,5) which
%        is described in Chapters 5 & 6 of John Dormand's book, 
%        Numerical Methods for Differential Equations.  
% 
%        This is the same algorithm used in ODE45, part of the new MATLAB 
%        ODE Suite.  Details are to be found in The MATLAB ODE Suite, 
%        L. F. Shampine and M. W. Reichelt, SIAM Journal on Scientific 
%        Computing, 18-1, 1997.


% Input the user data. 

dud = get(disph,'user');
dispha = dud.axes;
ud = get(dispha,'user');
refine = dud.settings.refine;
tol = dud.settings.tol;
hmax = dud.settings.hmax;
DY = ud.DY;
col = dud.color.temp;
speed = dud.settings.speed;
slow = (speed < 100);


% Initialize the stopping criteria.


%  The compute window.

CC = ud.cwind(3);
DD = ud.cwind(4);

% The stop button.

stop = 0;
ud.stop = 0;

% Set the the line handle.

ph = plot([tspan(1),tspan(1)],[y0,y0],'color',col,...
    'erase','none',...
    'parent',dispha);
ud.line = ph;

% Set up the phase line

vi = dud.pline;
figure(disph);
v = axis;
aa = v(1)+0.01*(v(2)-v(1));
plh = plot(aa,y0,'.','markersize',20,'color',col,...
    'erase','xor','parent',dispha,'visible',vi);    
ud.pline = plh;
set(dispha,'UserData',ud);

% Initialize the loop.

t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
t = t0;
y = y0;

% By default, hmax is 1/10 of the interval.
%hmax = min(abs(0.1*(tfinal-t)),1);

rDY = DY(:,ones(1,refine));
steps = 0;
block = 120;
tout = zeros(block,1);
yout = zeros(block,1);

N = 1;
tout(N) = t;
yout(N) = y;

% Initialize method parameters.
pow = 1/5;
C = [1/5; 3/10; 4/5; 8/9; 1; 1]; 
A = [
    1/5         3/40    44/45   19372/6561      9017/3168  
    0           9/40    -56/15  -25360/2187     -355/33    
    0           0       32/9    64448/6561      46732/5247      
    0           0       0       -212/729        49/176          
    0           0       0       0               -5103/18656     
    0           0       0       0               0               
    0           0       0       0               0            
    ];
bhat = [35/384 0 500/1113 125/192 -2187/6784 11/84 0]';
% E = bhat - b.
E = [71/57600; 0; -71/16695; 71/1920; -17253/339200; 22/525; -1/40];
if refine > 1
  sigma = (1:refine-1) / refine;
  S = cumprod(sigma(ones(4,1),:));
  bstar = [
    1       -183/64     37/12       -145/128
    0       0       0       0
    0       1500/371    -1000/159   1000/371
    0       -125/32     125/12      -375/64 
    0       9477/3392   -729/106    25515/6784
    0       -11/7       11/3        -55/28
    0       3/2     -4      5/2
    ];
  bstar = bstar*S;
    
end

f = zeros(1,7);
f0 = feval(dfcn,t,y);

mm = max(abs(f0./DY));
absh = hmax;
if mm
  absh = min(absh,1/(100*mm));
end

f(:,1) = f0;


% THE MAIN LOOP
tic

while ~stop
  
  % hmin is a small number such that t+h is distinquishably
  % different from t if abs(h) > hmin.
  hmin = 16*eps*abs(t);
  absh = min(hmax, max(hmin, absh));    
  h = tdir * absh;
    
  % LOOP FOR ADVANCING ONE STEP.
  while stop~=5
    hC= h * C;
    hA = h * A;

    f(:,2) = feval(dfcn, t + hC(1), y + f*hA(:,1));
    f(:,3) = feval(dfcn, t + hC(2), y + f*hA(:,2));
    f(:,4) = feval(dfcn, t + hC(3), y + f*hA(:,3));
    f(:,5) = feval(dfcn, t + hC(4), y + f*hA(:,4));
    f(:,6) = feval(dfcn, t + hC(5), y + f*hA(:,5));
    tn = t + h;
    yn = y + f*h*bhat;
    f(:,7) = feval(dfcn, tn, yn);
    
    % Estimate the error.
    err = abs(h * f * E);
    alpha = (2*max(err/((abs(y)+abs(yn)+DY(2)*1e-3)*tol)))^pow;
    if alpha < 1         % Step is OK
      break
    else
      if absh <= hmin		% This keeps us out of an infinite loop.
	stop = 5;
	break;
      end
      
      absh = max(hmin,0.8*absh / alpha);
      h = tdir * absh;
    end  % if alpha < 1
  end  % while stop~=5
  steps = steps + 1;
  

  oldN = N;
  N = N + refine;
  if N > length(tout)
    tout = [tout; zeros(block,1)];  
    yout = [yout; zeros(block,1)];
  end
  if refine > 1             % computed points, with refinement
    j = oldN+1:N-1;
    tout(j) = t + h*sigma';
    yout(j) = (y(:,ones(length(j),1)) + f*h*bstar).';
    tout(N) = tn;
    yout(N) = yn;
  else               % computed points, no refinement
    tout(N) = tn;
    yout(N) = yn;
  end
  
  % Update stop.   Maybe the stop button has been pressed.

  ud = get(dispha,'user');
  stop = max(ud.stop,stop);
  
  % Are we out of the compute window?
  
  if yn<CC | yn>DD
    stop = 1;
  end  
  if (abs(tn-tfinal) < hmin)
    stop = 2;
  end  % if gstop
  
  i = oldN:N;    
  set(ph,'Xdata',tout(i),'Ydata',yout(i));
  set(plh,'Xdata',aa,'Ydata',yn);
  drawnow    
  
  % Compute a new step size.
  absh = max(hmin,0.8*absh / max( alpha,0.1));
  absh = min(absh,tdir*(tfinal - tn));
  h = absh*tdir;
  % Advance the integration one step.
  t = tn;
  y = yn;
  f(1) = f(7);                      % Already evaluated dfcn(tnew,ynew)
  
  if slow
    ttt= N/(speed*refine);
    tt = toc;
    while tt < ttt
      tt = toc;
    end
  end
end  % while ~stop
tout = tout(1:N);
yout = yout(1:N,:);

if dud.notice
  nstr = get(dud.notice,'string');

  switch stop
    case 1
      nstr{5} = [nstr{5}, ' left the computation window.']; 
    case 4
      nstr{5} = [nstr{5}, ' was stopped by the user.'];
    case 5 
      ystr = ['(',num2str(t,2), ', ', num2str(y,2),').'];
      nstr(1:3) = nstr(2:4);
      nstr{4} = [nstr{5},' experienced a failure at ',ystr];
      nstr{5} = 'Problem is singular or tolerances are too large.';
  end
  set(dud.notice,'string',nstr);
end
drawnow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [tout,yout] = dfeul(dfcn,tspan,y0,disph)

% DFEUL  is an implementation of Euler's method


% Input the user data. 

dud = get(disph,'user');
dispha = dud.axes;
ud = get(dispha,'user');
refine = dud.settings.refine;
ssize = dud.settings.stepsize;
DY = ud.DY;
col = dud.color.temp;
speed = dud.settings.speed;
slow = (speed < 100);

% Initialize the stopping criteria.

%  The compute window.

CC = ud.cwind(3);
DD = ud.cwind(4);

% The stop button.

stop = 0;
ud.stop = 0;

% Set the the line handle.

ph = plot([tspan(1),tspan(1)],[y0,y0],'color',col,...
    'erase','none',...
    'parent',dispha);
ud.line = ph;

% Set up the phase line

vi = dud.pline;
figure(disph);
v = axis;
aa = v(1)+0.01*(v(2)-v(1));
plh = plot(aa,y0,'.','markersize',20,'color',col,...
    'erase','xor','parent',dispha,'visible',vi);    
ud.pline = plh;
set(dispha,'UserData',ud);

% Initialize the loop.

t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
t = t0;
y = y0;

h = ssize*tdir;
block = 120;
tout = zeros(block,1);
yout = tout;
N = 1;
tout(N) = t;
yout(N) = y;

% The main loop
tic
while ~stop
  if abs(t - tfinal) < ssize 
    h = tfinal - t; 
  end

  % Compute the slope
  s1 = feval(dfcn,t,y); 
  t = t + h;
  y = y + h*s1;		
  if N >= length(tout)
    tout = [tout;zeros(block,1)];
    yout = [yout;zeros(block,1)];
  end
  N = N + 1;  
  tout(N) = t;
  yout(N) = y;
  
  % Update stop.   Maybe the stop button has been pressed.

  ud = get(dispha,'user');
  stop = max(ud.stop,stop);
  
  % Are we out of the compute window?
  
  if y<CC | y>DD
    stop = 1;
  end  
  if (abs(t-tfinal) < 0.0001*ssize)
    stop = 2;
  end  
  
  i = (N-1):N;    
  set(ph,'Xdata',tout(i),'Ydata',yout(i));
  set(plh,'Xdata',aa,'Ydata',y);
  drawnow    
  if slow
    ttt= N/(speed);
    tt = toc;
    while tt < ttt
      tt = toc;
    end
  end
    
end  % while ~stop

tout = tout(1:N);
yout = yout(1:N,:);
if dud.notice
  nstr = get(dud.notice,'string');
  
  switch stop
    case 1
      nstr{5} = [nstr{5}, ' left the computation window.']; 
    case 4
      nstr{5} = [nstr{5}, ' was stopped by the user.'];
    case 5 
      ystr = ['(',num2str(t,2), ', ', num2str(y,2),').'];
      nstr(1:3) = nstr(2:4);
      nstr{4} = [nstr{5},' experienced a failure at ',ystr];
      nstr{5} = 'Problem is singular or tolerances are too large.';
  end
  set(dud.notice,'string',nstr);
end
drawnow


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [tout,yout] = dfrk2(dfcn,tspan,y0,disph)

% DFRK2  is an implementation of the second order Runge-Kutta method. 


% Input the user data. 

dud = get(disph,'user');
dispha = dud.axes;
ud = get(dispha,'user');
refine = dud.settings.refine;
ssize = dud.settings.stepsize;
DY = ud.DY;
col = dud.color.temp;
speed = dud.settings.speed;
slow = (speed < 100);

% Initialize the stopping criteria.

%  The compute window.

CC = ud.cwind(3);
DD = ud.cwind(4);

% The stop button.

stop = 0;
ud.stop = 0;

% Set the the line handle.

ph = plot([tspan(1),tspan(1)],[y0,y0],'color',col,...
    'erase','none',...
    'parent',dispha);
ud.line = ph;

% Set up the phase line

vi = dud.pline;
figure(disph);
v = axis;
aa = v(1)+0.01*(v(2)-v(1));
plh = plot(aa,y0,'.','markersize',20,'color',col,...
    'erase','xor','parent',dispha,'visible',vi);    
ud.pline = plh;
set(dispha,'UserData',ud);

% Initialize the loop.

t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
t = t0;
y = y0;

h = ssize*tdir;
block = 120;
tout = zeros(block,1);
yout = tout;
N = 1;
tout(N) = t;
yout(N) = y;

% The main loop
tic
while ~stop
  if abs(t - tfinal) < ssize 
    h = tfinal - t; 
  end

  % Compute the slope
  s1 = feval(dfcn,t,y); 
  s2 = feval(dfcn, t + h, y + h*s1); 
  t = t + h;
  y = y + h*(s1 + s2)/2;

  if N >= length(tout)
    tout = [tout;zeros(block,1)];
    yout = [yout;zeros(block,1)];
  end
  N = N + 1;  
  tout(N) = t;
  yout(N) = y;
  
  % Update stop.   Maybe the stop button has been pressed.

  ud = get(dispha,'user');
  stop = max(ud.stop,stop);
  
  % Are we out of the compute window?
  
  if y<CC | y>DD
    stop = 1;
  end  
  if (abs(t-tfinal) < 0.0001*ssize)
    stop = 2;
  end  
  
  i = (N-1):N;    
  set(ph,'Xdata',tout(i),'Ydata',yout(i));
  set(plh,'Xdata',aa,'Ydata',y);
  drawnow
  if slow
    ttt= N/(speed);
    tt = toc;
    while tt < ttt
      tt = toc;
    end
  end
    
end  % while ~stop

tout = tout(1:N);
yout = yout(1:N,:);
if dud.notice
  nstr = get(dud.notice,'string');
  
  switch stop
    case 1
      nstr{5} = [nstr{5}, ' left the computation window.']; 
    case 4
      nstr{5} = [nstr{5}, ' was stopped by the user.'];
    case 5 
      ystr = ['(',num2str(t,2), ', ', num2str(y,2),').'];
      nstr(1:3) = nstr(2:4);
      nstr{4} = [nstr{5},' experienced a failure at ',ystr];
      nstr{5} = 'Problem is singular or tolerances are too large.';
  end
  set(dud.notice,'string',nstr);
end
drawnow



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [tout,yout] = dfrk4(dfcn,tspan,y0,disph)

% DFRK4  is an implementation of the fourth order Runge-Kutta method. 


% Input the user data. 

dud = get(disph,'user');
dispha = dud.axes;
ud = get(dispha,'user');
refine = dud.settings.refine;
ssize = dud.settings.stepsize;
DY = ud.DY;
col = dud.color.temp;
speed = dud.settings.speed;
slow = (speed < 100);

% Initialize the stopping criteria.

%  The compute window.

CC = ud.cwind(3);
DD = ud.cwind(4);

% The stop button.

stop = 0;
ud.stop = 0;

% Set the the line handle.

ph = plot([tspan(1),tspan(1)],[y0,y0],'color',col,...
    'erase','none',...
    'parent',dispha);
ud.line = ph;

% Set up the phase line

vi = dud.pline;
figure(disph);
v = axis;
aa = v(1)+0.01*(v(2)-v(1));
plh = plot(aa,y0,'.','markersize',20,'color',col,...
    'erase','xor','parent',dispha,'visible',vi);    
ud.pline = plh;
set(dispha,'UserData',ud);

% Initialize the loop.

t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
t = t0;
y = y0;

h = ssize*tdir;
block = 120;
tout = zeros(block,1);
yout = tout;
N = 1;
tout(N) = t;
yout(N) = y;

% The main loop
tic
while ~stop
  if abs(t - tfinal) < ssize 
    h = tfinal - t; 
  end

  % Compute the slope
  s1 = feval(dfcn,t,y); 
  s2 = feval(dfcn, t + h/2, y + h*s1/2); s2=s2(:);
  s3 = feval(dfcn, t + h/2, y + h*s2/2); s3=s3(:);
  s4 = feval(dfcn, t + h, y + h*s3); s4=s4(:);
  
  t = t + h;
  y = y + h*(s1 + 2*s2 + 2*s3 +s4)/6;

  if N >= length(tout)
    tout = [tout;zeros(block,1)];
    yout = [yout;zeros(block,1)];
  end
  N = N + 1;  
  tout(N) = t;
  yout(N) = y;
  
  % Update stop.   Maybe the stop button has been pressed.

  ud = get(dispha,'user');
  stop = max(ud.stop,stop);
  
  % Are we out of the compute window?
  
  if y<CC | y>DD
    stop = 1;
  end  
  if (abs(t-tfinal) < 0.0001*ssize)
    stop = 2;
  end  
  
  i = (N-1):N;    
  set(ph,'Xdata',tout(i),'Ydata',yout(i));
  set(plh,'Xdata',aa,'Ydata',y);
  drawnow    
  if slow
    ttt= N/(speed);
    tt = toc;
    while tt < ttt
      tt = toc;
    end
  end
    
end  % while ~stop

tout = tout(1:N);
yout = yout(1:N,:);
if dud.notice
  nstr = get(dud.notice,'string');
  
  switch stop
    case 1
      nstr{5} = [nstr{5}, ' left the computation window.']; 
    case 4
      nstr{5} = [nstr{5}, ' was stopped by the user.'];
    case 5 
      ystr = ['(',num2str(t,2), ', ', num2str(y,2),').'];
      nstr(1:3) = nstr(2:4);
      nstr{4} = [nstr{5},' experienced a failure at ',ystr];
      nstr{5} = 'Problem is singular or tolerances are too large.';
  end
  set(dud.notice,'string',nstr);
end
drawnow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

