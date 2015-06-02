function tsgDeleteGridByName( sGridName )
%
% tsgDeleteGridByName( sGridName )
%
% deletes all of the background files used by the grid with name sGridName,
% this function is to be used if the grid class lGrid has been lost
% 
% NOTE: lGrid containing the sGridName can no longer be used
%
% INPUT:
%
% sGridName: the name of the grid to be deleted, i.e. the sGridName
%            parameter given to makeGrid(...)
%

lGrid.name = sGridName;
tsgDeleteGrid( lGrid );

end

