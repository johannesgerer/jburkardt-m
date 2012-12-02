function [x, e_conn, variable, index_c1, index_c2, index_bc] = ...
         twod_readcadyf1(file,num_fig)
%-----------------------------------------------------------------------
%  twod_readcadyf1.m - Reads in mesh, connectivity and boundary node
%                     numbers from a *.cadyf file generated with
%                     amiral (preprocessor for cadyf).
%
%                     This code is quite problem specific, since the 
%                     *.cadyf file is setup to solve the Navier-Stokes 
%                     equations.
%
%                     ! NOTE: Matlab has difficulty with D+00 double
%                     precision notation, globally change to E+00
%
%  Copyright (c) 2001, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:     [x, e_conn, variable, index_c1, index_c2, index_bc] = ...
%             twod_readcadyf(file,num_fig)
%
%  Variables:     file 
%                        Name of the *.cadyf file.
%                 num_fig
%                        If included, plot the mesh
%
%                 x
%                        Nodal coordinates
%                 e_conn
%                        Element connectivity
%                 variable
%                        Contains finite element information
%                 index_c1
%                        Node numbers corresponding to curve c1  
%                 index_c2
%                        Node numbers corresponding to curve c2  
%                 index_bc
%                        Node numbers corresponding to curve bc  
%-----------------------------------------------------------------------
fid = fopen(file);

% match up with indata.f and contrl.f in cadyf

%-----------------------------------------------------------------------
%  From control blocks
%-----------------------------------------------------------------------
% card # 1
temp  = fgetl(fid);           % title line

% card # 2
A     = fscanf(fid,'%i',9);   % itim, lin, etc.
itemp = A(5);

A     = fscanf(fid,'%g',9);   % icomp, itype, etc.
ifturb = A(4);

if (ifturb == 3)
  temp = fgetl(fid);
  temp = fgetl(fid);
end

% card # 3
A = fscanf(fid,'%i %i %i %i %i %i %i %i %i',9);

% get the number of nodes and elements
n_node = A(1);
n_elem = A(2);
% fprintf('twod_readcadyf: reading in mesh with %g nodes and %g elements\n',...
%          n_node,n_elem);

% skip over cards # 4 and # 5
temp = fscanf(fid,'%s',4);
temp = fscanf(fid,'%s',4);

% card # 6
A = fscanf(fid,'%i %i %i %i %i %i',6);

% read in number of specified boundary conditions
n_dbc = sum(A(1:6)); % number of bcs for u,v,w,T,k,e
% fprintf('                reading %g boundary conditions\n',n_dbc);

% card # 7 (assuming no neuman bc's)
temp = fscanf(fid,'%g',6);
% card # 8 (assuming no periodic bc's)
temp = fscanf(fid,'%g',1);

temp = fscanf(fid,'%g',12); % card #9
temp = fscanf(fid,'%g',7);  % card #10

% card #11
A = fscanf(fid,'%g',8);
ninitu = A(5); % number of initial guess to read/skip
ninitt = A(6);
ninitk = A(7);
ninite = A(8);
ntoti  = ninitu + ninitt + ninitk + ninite;
% fprintf('                reading %g initial guess lines\n',ntoti);

temp = fscanf(fid,'%g',15); % card #12
temp = fscanf(fid,'%g',8);  % card #13
temp = fscanf(fid,'%g',2);  % card #14
temp = fscanf(fid,'%g',5);  % card #15
temp = fscanf(fid,'%g',6);  % card #16

%-----------------------------------------------------------------------
%  Now read in nodes and connectivity information
%-----------------------------------------------------------------------
% read in inblok data (skipped for now)
% read in time functions (intfns) (skipped for now)
% read in periodic nodes (skipped for now)

% read in nodal coordinates

for i=1:n_node
  A = fscanf(fid,'%g',12);
  if (length(A)<12)
    error('You need to change Ds to Es, Matlab doesnt recognize doubles')
  end
  x(i,1) = A(10);
  x(i,2) = A(11);
end

% read in blade normal information (inblad) (skipped for now)

% read in boundary conditions (incons)
%  this can be used to "tag" certain nodes...
index_c1 = [];
index_c2 = [];
index_bc = [];
for i=1:n_dbc
  A = fscanf(fid,'%i %g %i %g',4);

  if (A(2)==1)
    index_c1 = [index_c1 A(1)];
  elseif (A(2)==2)
    index_c2 = [index_c2 A(1)];
  else
    index_bc = [index_bc A(1)];
  end

  variable.dirichlet_node(i) = A(1);
  variable.dirichlet_value(i) = max(0,A(2));
end


% read in neuman data (inload, skipped for now)
% read in volumetric body forces (invol, skipped for now)

% read in, or skip, reading in the initial guess... (inital)
for i=1:ninitu
  temp = fscanf(fid,'%g',4);
end
for i=1:ninitt
  temp = fscanf(fid,'%g',2);
end
for i=1:ninitk
  temp = fscanf(fid,'%g',1);
end
for i=1:ninite
  temp = fscanf(fid,'%g',1);
end

% skip over three lines
for i=1:3
  temp = fscanf(fid,'%i',8);
end

% skip over material properties
temp   = fscanf(fid,'%g',1); % rho
temp   = fscanf(fid,'%g',1); % viscosity
if ( itemp==1 | itemp==2 )
  temp = fscanf(fid,'%g',1); % cp
  temp = fscanf(fid,'%g',1); % cond
end

% read in element connectivity (assuming 6 noded elements)
for i=1:n_elem
  A = fscanf(fid,'%i',7);
  e_conn(i,:) = A(2:7)'; 
end

if ( nargin==2 )
  twod_plotm2(num_fig,x,e_conn)
  figure(num_fig)

  hold on
  for i=1:length(index_c1)
    n = index_c1(i);
    plot(x(n,1),x(n,2),'g*')
  end
  for i=1:length(index_c2)
    n = index_c2(i);
    plot(x(n,1),x(n,2),'r*')
  end
  for i=1:length(index_bc)
    n = index_bc(i);
    plot(x(n,1),x(n,2),'b*')
  end
  pause(.001)
end

