function fid = gzfopen ( fname, permission, machineformat )

%*****************************************************************************80
%
%% GZFOPEN ?
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
  global GZ_FILE_IDS GZ_FILE_NAMES

  if isempty ( GZ_FILE_NAMES )
    GZ_FILE_NAMES = {};
  end

  zipped = 0;

  if length(fname) > 3
    if strcmp(fname(end-2:end),'.gz') 
      zipped = 1;
    end
  end

  if zipped
    tmp = ['/tmp/gzfopen.' num2str(floor(rand*1e7),'%7.7i')];
    eval(['!cp ' fname '  ' tmp '.gz;   gunzip ' tmp '.gz; ']);
    fid = fopen(tmp,permission,machineformat);

    GZ_FILE_IDS(end+1) = fid;
    GZ_FILE_NAMES{end+1} = tmp;
  else
    fid = fopen ( fname, permission, machineformat );
  end

  return
end
