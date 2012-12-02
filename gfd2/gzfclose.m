function gzfclose ( fid )

%*****************************************************************************80
%
%% GZFCLOSE ?
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

  fclose ( fid );

  index = [];
  if ~isempty(GZ_FILE_IDS)
    index = find(GZ_FILE_IDS == fid);
  end

  if ~isempty(index)
    tmp = GZ_FILE_NAMES{index};
    eval(['!rm  ' tmp ]);

    GZ_FILE_IDS(index)=[];
    GZ_FILE_NAMES={GZ_FILE_NAMES{1:index-1}  GZ_FILE_NAMES{index+1:end}};
  end

  return
end
