function [u, v, p, T, s] = twod_readcad5out(file,e_conn,n_sens)
%-----------------------------------------------------------------------
%  twod_readcad5out.m - Reads in solution data from a *.cad5out file 
%                       generated with cadyf.
%
%                     This code is quite problem specific, since the 
%                     *.cad5out file is setup to solve the Navier-Stokes 
%                     equations.
%
%                     ! NOTE: Matlab has difficulty with D+00 double
%                     precision notation, globally change to E+00
%
%  Copyright (c) 2002, Jeff Borggaard, Virginia Tech
%  Version: 1.0a
%
%  Usage:     [u, v, p, T] = twod_readcad5out(file,e_conn)
%          or 
%             [u, v, p   ] = twod_readcad5out(file,e_conn)
%          or
%             [u, v, p, T, s] = twod_readcad5out(file,e_conn,n_sens)
%          or
%             [u, v, p,    s] = twod_readcad5out(file,e_conn,n_sens)
%
%  Variables:     file 
%                        Name of the *.cad5out file ('string').
%                 e_conn
%                        Element connectivity (required to calculate
%                        nodal values of pressure)
%                 n_sens
%                        Number of sensitivity variables
%
%                 u,v (,T)   (T is optional)
%                        Nodal information
%                 p
%                        values of pressure nodes on each linear element
%-----------------------------------------------------------------------

[nelem,nel_dof] = size(e_conn);

if ( nargin==2 )
  n_sens = 0;
end

if ( n_sens==0 )
  s = 0;
end

thrmiq = 1;   % 1 if thermal problem, 0 otherwise

iturb = 0;   % if we do turbulent problems, we need to figure out
             % when we have this case (w and w/o thrmiq)

%-----------------------------------------------------------------------
fid = fopen(file);

% skip over beginning stuff
for i=1:137
  line = fgetl(fid);
end

line = fgetl(fid);
while( line(10:15) ~= 'number')
  line = fgetl(fid);
  line = strcat(line,'1                     1');
end

numnp = str2num(line(80:end));

line = fgetl(fid);
line = fgetl(fid);

nelem = str2num(line(80:end));

while ( ~strcmp(line(2:16),'v e l o c i t y') )
  line = fgetl(fid);
  line = strcat(line,'1                     1');
end

for i=1:4
  line = fgetl(fid);
end

% we only assume twod or axi for now
if ( thrmiq )
  for i=1:numnp
    A = fscanf(fid,'%g',8);
    node    = A(1);
    x(node) = A(2);
    y(node) = A(3);
    u(node) = A(5);
    v(node) = A(6);
    T(node) = A(8);
  end
else
  for i=1:numnp
    A = fscanf(fid,'%g',7);
    node = A(1);
    x(i) = A(2);
    y(i) = A(3);
    u(i) = A(5);
    v(i) = A(6);
  end
    T       = 0; % no reason to get the size right
end

for i=1:6
  line = fgetl(fid);
end

% assume ipres = 0
for i=1:nelem
  A = fscanf(fid,'%g',7);
  node = A(1);
  press(i,:) = A(5:7)';
end
  
% need to convert press (centroid + derivatives) to values at nodes
for i=1:nelem
  nodes_local = e_conn(i,1:3);
  x_local     = x(nodes_local);
  y_local     = y(nodes_local);

  xc          = sum(x_local)/3;
  yc          = sum(y_local)/3;

  p(i,:)      = press(i,1) + press(i,2)*(x_local-xc) + press(i,3)*(y_local-yc);
end

if (iturb)
  for i=1:6
    line = fgetl(fid);
  end

  for i=1:numnp
    A = fscanf(fid,'%g',6);
    k(i) = A(5);
    e(i) = A(6);
  end
end

for np=1:n_sens
  
  while ( ~strcmp(line(1:20),'SENSITIVITY SOLUTION') )
    line = fgetl(fid);
    line = strcat(line,'1                     1');
  end
  
  for i=1:9
    line = fgetl(fid);
  end

  % again, assuming either twod or axi
  if (thrmiq)
    for i=1:numnp
      A = fscanf(fid,'%g',4);
      s(np).u(i) = A(2);
      s(np).v(i) = A(3);
      s(np).T(i) = A(4);
    end
  else
    for i=1:numnp
      A = fscanf(fid,'%g',3);
      s(np).u(i) = A(2);
      s(np).v(i) = A(3);
    end
  end

  for i=1:6
    line = fgetl(fid);
  end

  % again, assuming discontinuous pressure
  for i=1:nelem
    A = fscanf(fid,'%g',4);
    node = A(1);
    s_press(i,:) = A(2:4)';
  end

  % need to convert s_press (centroid + derivatives) to values at nodes
  for i=1:nelem
    nodes_local = e_conn(i,1:3);
    x_local     = x(nodes_local);
    y_local     = y(nodes_local);

    xc          = sum(x_local)/3;
    yc          = sum(y_local)/3;

    s(np).p(i,:) = s_press(i,1) + s_press(i,2)*(x_local-xc) + ...
                                  s_press(i,3)*(y_local-yc);
  end

  if (iturb)
    % read in turbulence sensitivities
    for i=1:6
      line = fgetl(fid);
    end

    for i=1:numnp
      A = fscanf(fid,'%g',3);
      s(np).k(i) = A(2);
      s(np).e(i) = A(3);
    end
  end

end
