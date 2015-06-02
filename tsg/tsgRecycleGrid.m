function [ newp ] = tsgRecycleGrid( lGrid, depth, order, type, anisotropy )
%
% [ newp ] = tsgRecycleGrid( lGrid, depth, order, type, anisotropy )
%
% overwrites the grid in lGrid with a new grid having the same parameters,
% but with updated depth, order, type and anisotropy. Recycling also reuses
% all of the old points values.
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%
% depth: (all grids) integer bigger than or equal to 0 (0 is accepted only by type = basis)
%        the deinsity of the grid, i.e. levels
%
% order: (local polynomial or wavelet grids only) integer 1, 2 or 3 (2 is for polynomial grids only)
%        the order of the grid, i.e. linear, quadratic, cubic
%
% type: (global grids only) string from <level,basis>
%       level used the classical Smolyak tensor selection (depth == level)
%       basis gives the minimum subset of the tensors requires to capture a
%             polynomial of certain degree, 
%             clenshaw-curtis and chebychev consider interolation
%             gauss-legendre focuses on interation
%
% anisotropy: (global grids only) vector of size dim with min( anisotropy ) == 1
%             gives linear weighting on the selection of the tensors
%
% OUTPUT:
%
% newp: (optional) the new points associated with the new grid in an array
%       of dimension [ num_new_poits, dim ]
%
% NOTE: lGrid is overwritten
%

if ( nargin < 8 )
    anisotropy = [];
end

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -recycle'];

sCommand = [ sCommand, ' -gridfile ', gFile];

sCommand = [ sCommand, ' -depth ',num2str(depth)];

sCommand = [ sCommand, ' -order ',num2str(order)];

sCommand = [ sCommand, ' -type ',type];

if ( size( anisotropy ) ~= [ 0 0 ] )
    tsgWriteMatrix( wFile, anisotropy );
    sCommand = [ sCommand, ' -af ',wFile];
end

if ( nargout > 1 )
    sCommand = [ sCommand, ' -of ',qFile];
end

[status, cmdout] = system(sCommand);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    disp(cmdout);
    fprintf(2,['Erors were encountered\n']);
    return;
else
    if ( nargout > 1 )
        newp = tsgReadMatrix( qFile );
    end
end


end

