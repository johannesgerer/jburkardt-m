function [flag,c4,imax,jmax,kmax,valex,nbmots] = uread(file)

%*****************************************************************************80
%
%% UREAD ?
%
%  Discussion:
%
%    This function is discussed in chapter 22 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
% ------------ GHER file : read function --------------
% ------------ M. Rixen 2000 --------------------------

% optimisation: 03/04/2003
% Alexander

  flag=0;
  imax=0;
  jmax=0;
  kmax=0;
  valex=0;
  file;

  fid=gzfopen(file,'r','native');

  if fid==-1
    error([file ' not found.']); 
  end 

% ignore header

  fread ( fid, 21,'int32');

  imax=fread(fid,1,'int32')
  jmax=fread(fid,1,'int32')
  kmax=fread(fid,1,'int32')
  iprec=fread(fid,1,'int32')
  nbmots=fread(fid,1,'int32')
  valex=fread(fid,1,'single')
  fread(fid,2,'int32');

  nl=fix((imax*jmax*kmax)/nbmots);
  ir=imax*jmax*kmax-nbmots*nl;
  ide=1;

  if imax<0 | jmax<0 | kmax<0
    nl=0;
    ir=4;
  end

% allocation

  c4 = zeros(nbmots*nl+ir,1);

% load all full records including leading and tailing 4 byte integer

  data = reshape(fread(fid,nl*(nbmots+2),'single'),nbmots+2,nl);

% remove leading and trailing 4 byte integer

  c4(1:nbmots*nl) = reshape(data(1:nbmots,:),nbmots*nl,1);

% read last record

  c4(nbmots*nl+1:end)=fread(fid,ir,'single');

  flag=1;
  gzfclose(fid);

  return
end
